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

- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler;

- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message;

- (void)addSubview:(UIView *)view insets:(UIEdgeInsets)insets;

- (void)addSubview:(UIView *)view top:(double)top left:(double)left bottom:(double)bottom right:(double)right;

- (void)addSubview:(UIView *)view horizontal:(double)horizontal vertical:(double)vertical;

@end

NS_ASSUME_NONNULL_END
