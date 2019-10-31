//
//  CALayer+Gradient.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 14/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAGradientLayer+Extension.h"

@implementation CAGradientLayer (Extension)

+ (CAGradientLayer *)createGradientLayer:(UIColor *)startColor endColor:(UIColor *)endColor frame:(CGRect)frame angle:(CGFloat)angle {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = frame;
    gradient.colors = @[(id) startColor.CGColor, (id) endColor.CGColor];
    gradient.startPoint = [gradient startPoint:angle];
    gradient.locations = @[@(0), @(1.0)];
    gradient.endPoint = [gradient endPoint:angle];
    return gradient;
}

- (CGPoint)startPoint:(CGFloat)angle {
    CGPoint p = [self oppositePoint:[self pointForAngle:angle]];
    return [self transformToGradientSpace:p];
}

- (CGPoint)endPoint:(CGFloat)angle {
    CGPoint p = [self pointForAngle:angle];
    return [self transformToGradientSpace:p];
}

// Transform point in unit space to gradient space
- (CGPoint)transformToGradientSpace:(CGPoint)point {
    // Input point is in signed unit space: (-1,-1) to (1,1)
    // Convert to gradient space: (0,0) to (1,1), with flipped Y axis
    return CGPointMake((point.x + 1) * 0.5, 1.0 - (point.y + 1) * 0.5);
}

// Get a point corresponding to the angle
- (CGPoint)pointForAngle:(CGFloat)angle {
    // Convert degrees to radians
    CGFloat radians = angle * M_PI / 180.0;

    // Calculate coordinates
    CGFloat x = cos(radians) * 1.0;
    CGFloat y = sin(radians) * 1.0;

    // (x,y) is in terms unit circle. Extrapolate to unit square to get full vector length
    if (fabs(x) > fabs(y)) {
        // Extrapolate x to unit length
        x = x > 0 ? 1 : -1;
        y = x * tan(radians);
    } else {
        // Extrapolate y to unit length
        y = y > 0 ? 1 : -1;
        x = y / tan(radians);
    }
    return CGPointMake(x, y);
}

// Return the opposite point in the signed unit square
- (CGPoint)oppositePoint:(CGPoint)point {
    return CGPointMake(-point.x, -point.y);
}

@end


