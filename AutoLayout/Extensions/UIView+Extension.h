//
//  UIView+Extension.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 11/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)

/**
 * Init the view and set it to subview aof passed superview
 * @param superView Parent view
 * @param color Background color
 * @return Instance of UIView
 */
- (instancetype)init:(UIView *)superView color:(UIColor *)color;

/**
 * Init view with default background color
 * @param color Background color
 * @return Instance of UIView
 */
- (instancetype)initWithColor:(UIColor *)color;

/**
 * Add gradient layer at index 0 to view
 * @param startColor Start color
 * @param endColor End color
 * @param angle Gradient angle
 */
- (void)addGradientLayer:(UIColor *)startColor endColor:(UIColor *)endColor angle:(CGFloat)angle;

/**
 * Circle bounds radius
 */
- (void)round;

/**
 * Utility for setting view corner radius
 * @param cornerRadius Radius
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
