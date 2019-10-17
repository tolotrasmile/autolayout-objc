//
// Created by Tolotra RAHARISON on 17/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extension)

/**
 * Open iPhone App setting
 */
- (void)openAppSettings;

/**
 * Open specified URL
 * @param urlString : String URL
 */
- (void)openExpectedURL:(NSString *)urlString;

@end
