//
//  UIViewController+Extension.m
//  IT_IO
//
//  Created by p1smartphone imac3 on 17/10/2019.
//  Copyright © 2019 norsys. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *close = [UIAlertAction actionWithTitle:@"Fermer" style:UIAlertActionStyleCancel handler:handler];
    [alert addAction:close];
    [self presentViewController:alert animated:true completion:nil];
}

@end
