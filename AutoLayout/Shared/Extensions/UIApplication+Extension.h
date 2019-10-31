//
// Created by Tolotra RAHARISON on 17/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (Extension)

/**
 * Open iPhone App setting
 */
- (void)openAppSettings;

/**
 * Open specified URL
 * @param urlString : String URL
 */
- (void)openURLString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END