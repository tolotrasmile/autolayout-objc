//
//  UIViewController+Extension.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 17/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extension)

/**
 * Show alert with all parameters
 * @param title
 * @param message
 * @param closeTitle
 * @param handler
 */
- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message closeTitle:(NSString *)closeTitle handler:(void (^ __nullable)(UIAlertAction *action))handler;

/**
 * Show alert with callback handler
 * @param title
 * @param message
 * @param handler
 */
- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler;

/**
 * Show alert without callback handler
 * @param title
 * @param message
 * @param handler
 */
- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message;

/**
 * Add subview to view controller main view with insets
 * @param view
 * @param insets
 */
- (void)addSubview:(UIView *)view insets:(UIEdgeInsets)insets;

/**
 * Add subview to view controller main view separated insets
 */
- (void)addSubview:(UIView *)view top:(double)top left:(double)left bottom:(double)bottom right:(double)right;

/**
 * Add subview to view controller main view vertical/horizontal insets
 */
- (void)addSubview:(UIView *)view horizontal:(double)horizontal vertical:(double)vertical;

@end

NS_ASSUME_NONNULL_END
