//
//  CALayer+Gradient.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 14/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAGradientLayer (Extension)

+ (CAGradientLayer *)createGradientLayer:(UIColor *)startColor endColor:(UIColor *)endColor frame:(CGRect)frame angle:(CGFloat)angle;

- (CGPoint)startPoint:(CGFloat)angle;

- (CGPoint)endPoint:(CGFloat)angle;

@end

NS_ASSUME_NONNULL_END
