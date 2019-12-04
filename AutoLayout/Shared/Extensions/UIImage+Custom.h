//
//  UIImage.h
//  IT_IO
//
//  Created by Aurelien DELRUE on 03/02/2014.
//  Copyright (c) 2014 norsys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface UIImage (Custom)

- (UIImage *)overlay:(UIColor *)color;

- (UIImage *)drawText:(NSString *)text font:(UIFont *)font position:(CGPoint)position color:(UIColor *)color;

- (UIImage *)drawText:(NSString *)text font:(UIFont *)font position:(CGPoint)position;

- (UIImage *)scaleTo:(CGSize)size;

- (BOOL)isJPEG:(NSData *)data;

- (UIImage *)firstPDFPageToUIImageFromURL:(NSURL *)urlParam width:(CGFloat)width;

@end
