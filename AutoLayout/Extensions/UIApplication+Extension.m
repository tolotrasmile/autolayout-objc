//
// Created by p1smartphone imac3 on 17/10/2019.
// Copyright (c) 2019 norsys. All rights reserved.
//

#import "UIApplication+Extension.h"

@implementation UIApplication (Extension)

- (void)openAppSettings {
    [self openExpectedURL:UIApplicationOpenSettingsURLString];
}

- (void)openExpectedURL:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    if (url && [UIApplication.sharedApplication canOpenURL:url]) {
        if (@available(iOS 10.0, *)) {
            [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
        } else {
            [UIApplication.sharedApplication openURL:url];
        }
    }
}

@end

