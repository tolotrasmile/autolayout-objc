//
//  UIImage.m
//  IT_IO
//
//  Created by Aurelien DELRUE on 03/02/2014.
//  Copyright (c) 2014 norsys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Custom.h"

@implementation UIImage (Custom)

- (UIImage *)overlay:(UIColor *)color {
  CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
  if (&UIGraphicsBeginImageContextWithOptions) {
    CGFloat imageScale = 1.0f;
    if ([self respondsToSelector:@selector(scale)]) {// The scale property is new with iOS4.
      imageScale = self.scale;
    }
    UIGraphicsBeginImageContextWithOptions(self.size, NO, imageScale);
  }

  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(context, 0, self.size.height);
  CGContextScaleCTM(context, 1.0, -1.0);

  CGContextSetBlendMode(context, kCGBlendModeMultiply);
  CGContextDrawImage(context, rect, self.CGImage);
  CGContextSetFillColorWithColor(context, color.CGColor);
  CGContextClipToMask(context, rect, self.CGImage);
  CGContextFillRect(context, rect);

  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return image;

}

- (UIImage *)drawText:(NSString *)text font:(UIFont *)font position:(CGPoint)position color:(UIColor *)color {

  if (&UIGraphicsBeginImageContextWithOptions) {
    CGFloat imageScale = 1.0f;
    if ([self respondsToSelector:@selector(scale)]) {// The scale property is new with iOS4.
      imageScale = self.scale;
    }
    UIGraphicsBeginImageContextWithOptions(self.size, NO, imageScale);
  }

  [self drawInRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height)];

  CGSize sizeText = [text sizeWithAttributes:@{NSFontAttributeName: font}];

  CGRect rect = CGRectMake(self.size.width - ceilf((float) sizeText.width) / 2, 0, self.size.width, self.size.height);
  [text drawInRect:CGRectIntegral(rect) withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: color}];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return image;

}

- (UIImage *)drawText:(NSString *)text font:(UIFont *)font position:(CGPoint)position {
  if (&UIGraphicsBeginImageContextWithOptions) {
    CGFloat imageScale = 1.0f;
    if ([self respondsToSelector:@selector(scale)]) {// The scale property is new with iOS4.
      imageScale = self.scale;
    }
    UIGraphicsBeginImageContextWithOptions(self.size, NO, imageScale);
  }

  [self drawInRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height)];

  CGFloat width = self.size.width - (position.x * 2.0);
  CGFloat height = self.size.height - (position.y * 2.0);

  CGRect rect = CGRectMake(position.x, position.y, width, height);
  [UIColor.blackColor set];

  NSDictionary *dictionary = @{NSFontAttributeName: font};

  [text drawInRect:CGRectIntegral(rect) withAttributes:dictionary];

  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return image;

}

- (UIImage *)scaleTo:(CGSize)size {
  CGFloat factorScreen = 3.0;

  if ([[UIScreen mainScreen] respondsToSelector:NSSelectorFromString(@"scale")]) {
    factorScreen = [[UIScreen mainScreen] scale];
  }

  CGSize targetSize = CGSizeMake(size.width * factorScreen, size.height * factorScreen);

  CGFloat width = self.size.width;
  CGFloat height = self.size.height;

  CGFloat targetWidth = targetSize.width;
  CGFloat targetHeight = targetSize.height;

  CGFloat scaledWidth = targetWidth;
  CGFloat scaledHeight = targetHeight;
  CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);

  if (!CGSizeEqualToSize(self.size, targetSize)) {
    CGFloat widthFactor = targetWidth / width;
    CGFloat heightFactor = targetHeight / height;

    CGFloat scaleFactor = widthFactor > heightFactor ? widthFactor : heightFactor;

    scaledWidth = width * scaleFactor;
    scaledHeight = height * scaleFactor;

    // Center the image
    if (widthFactor > heightFactor) {
      thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
    } else {
      if (widthFactor < heightFactor) {
        thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
      }
    }
  }

  UIGraphicsBeginImageContext(targetSize); // this will crop

  CGRect thumbnailRect = CGRectZero;
  thumbnailRect.origin = thumbnailPoint;
  thumbnailRect.size.width = scaledWidth;
  thumbnailRect.size.height = scaledHeight;

  [self drawInRect:thumbnailRect];

  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

  // Pop the context to get back to the default
  UIGraphicsEndImageContext();

  return newImage;
}

- (BOOL)isJPEG:(NSData *)data {
  if ([data length] < 4) {
    return NO;
  }

  const unsigned char *bytes = (const unsigned char *) [data bytes];

  if (bytes[0] != 0xFF || bytes[1] != 0xD8) {
    return NO;
  }

  return !(bytes[[data length] - 2] != 0xFF || bytes[[data length] - 1] != 0xD9);
}

- (UIImage *)firstPDFPageToUIImageFromURL:(NSURL *)urlParam width:(CGFloat)width {

  CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL((__bridge CFURLRef) urlParam);
  CGPDFPageRef page = CGPDFDocumentGetPage(pdf, 1);
  CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
  CGFloat pdfScale = width / pageRect.size.width;
  pageRect.size = CGSizeMake(pageRect.size.width * pdfScale, pageRect.size.height * pdfScale);
  pageRect.origin = CGPointZero;

  UIGraphicsBeginImageContext(pageRect.size);

  CGContextRef context = UIGraphicsGetCurrentContext();

  // White BG
  CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
  CGContextFillRect(context, pageRect);

  CGContextSaveGState(context);

  // ***********
  // Next 3 lines makes the rotations so that the page look in the right direction
  // ***********
  CGContextTranslateCTM(context, 0.0, pageRect.size.height);
  CGContextScaleCTM(context, 1.0, -1.0);
  CGContextConcatCTM(context, CGPDFPageGetDrawingTransform(page, kCGPDFMediaBox, pageRect, 0, true));

  CGContextDrawPDFPage(context, page);
  CGContextRestoreGState(context);

  UIImage *photoImage = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  return photoImage;
}

@end
