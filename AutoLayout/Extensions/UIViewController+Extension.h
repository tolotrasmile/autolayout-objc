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

- (void)addSubview:(UIView *)view top:(double)top left:(double)left bottom:(double)bottom right:(double)right;

@end

NS_ASSUME_NONNULL_END
