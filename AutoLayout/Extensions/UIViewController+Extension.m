//
//  UIViewController+Extension.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 17/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "UIView+NSLayoutConstraint.h"

@implementation UIViewController (Extension)

- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *close = [UIAlertAction actionWithTitle:@"Fermer" style:UIAlertActionStyleCancel handler:handler];
    [alert addAction:close];
    [self presentViewController:alert animated:true completion:nil];
}

- (void)addSubview:(UIView *)view top:(double)top left:(double)left bottom:(double)bottom right:(double)right {
    [self.view addSubview:view];
    [self.view addConstraintsInView:view top:top left:left bottom:bottom right:right];
}

@end
