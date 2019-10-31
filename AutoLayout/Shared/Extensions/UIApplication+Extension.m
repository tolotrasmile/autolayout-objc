//
// Created by Tolotra RAHARISON on 17/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UIApplication+Extension.h"

@implementation UIApplication (Extension)

- (void)openAppSettings {
  [self openURLString:UIApplicationOpenSettingsURLString];
}


- (void)openURLString:(NSString *)urlString {
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

