//
//  UIViewController+Extension.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 17/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *close = [UIAlertAction actionWithTitle:@"Fermer" style:UIAlertActionStyleCancel handler:handler];
  [alert addAction:close];
  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message {
  [self showAlert:title message:message handler:nil];
}

- (void)addSubview:(UIView *)view insets:(UIEdgeInsets)insets {
  [self.view addSubview:view];
  [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];

  // Add horizontal constraints
  id hConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[view]-right-|"
                                                           options:(NSLayoutFormatOptions) 0
                                                           metrics:@{@"left": @(insets.left), @"right": @(insets.right)}
                                                             views:@{@"view": view}];
  [self.view addConstraints:hConstraint];

  // Add vertical constraints
  id vConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[view]-bottom-|"
                                                           options:(NSLayoutFormatOptions) 0
                                                           metrics:@{@"top": @(insets.top), @"bottom": @(insets.bottom)}
                                                             views:@{@"view": view}];
  [self.view addConstraints:vConstraint];
}

- (void)addSubview:(UIView *)view top:(double)top left:(double)left bottom:(double)bottom right:(double)right {
  [self addSubview:view insets:UIEdgeInsetsMake(top, left, bottom, right)];
}

- (void)addSubview:(UIView *)view horizontal:(double)horizontal vertical:(double)vertical {
  [self addSubview:view top:vertical left:horizontal bottom:vertical right:horizontal];
}

@end
