//
//  UIView+Extension.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 11/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//
#import "UIView+Extension.h"
#import "CAGradientLayer+Extension.h"

@implementation UIView (Extension)

#pragma mark Constructors

- (instancetype)init:(UIView *)superView color:(UIColor *)color {
    if (self = [self init]) {
        [self setBackgroundColor:color];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [superView addSubview:self];
    }
    return self;
}

- (instancetype)initWithColor:(UIColor *)color {
    if (self = [self init]) {
        [self setBackgroundColor:color];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return self;
}

#pragma mark -
#pragma mark Layer

- (void)addGradientLayer:(UIColor *)startColor endColor:(UIColor *)endColor angle:(CGFloat)angle {
    CAGradientLayer *gradient = [CAGradientLayer createGradientLayer:startColor endColor:endColor frame:self.bounds angle:angle];
    [self insertOrReplaceLayer:gradient];
}

- (void)insertOrReplaceLayer:(CALayer *)layer atIndex:(unsigned)index {
    if ((self.layer.sublayers.count > index) && [self.layer.sublayers[index].name isEqualToString:layer.name]) {
        [self.layer replaceSublayer:[self.layer sublayers][index] with:layer];
    } else {
        [self.layer insertSublayer:layer atIndex:index];
    }
}

- (void)insertOrReplaceLayer:(CALayer *)layer {
    BOOL found = false;

    // Find layer to replace by layer name
    for (CALayer *l in self.layer.sublayers) {
        if ([l.name isEqualToString:layer.name]) {
            [self.layer replaceSublayer:layer with:layer];
            found = true;
            break;
        }
    }

    // Insert layer if not found
    if (!found) {
        [self.layer insertSublayer:layer atIndex:0];
    }
}

#pragma mark -
#pragma mark Radius

- (void)round {
    CGFloat cornerRadius = MIN(self.bounds.size.width, self.bounds.size.height) / 2;
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = cornerRadius;
}

@end
