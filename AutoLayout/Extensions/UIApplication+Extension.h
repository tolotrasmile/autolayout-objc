//
// Created by p1smartphone imac3 on 17/10/2019.
// Copyright (c) 2019 norsys. All rights reserved.
//

#import <Foundation/Foundation.h>

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
