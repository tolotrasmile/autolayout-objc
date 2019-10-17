//
//  UIViewController+Extension.h
//  IT_IO
//
//  Created by p1smartphone imac3 on 17/10/2019.
//  Copyright © 2019 norsys. All rights reserved.
//



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIViewController (Extension)

- (void)showAlert:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler;

@end

NS_ASSUME_NONNULL_END
