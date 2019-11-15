//
// Created by Tolotra RAHARISON on 15/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

/**
 * Convert NSDictionary to string with options and encoding
 * @param options
 * @param encoding
 * @return
 */
- (NSString *)toJSONString:(NSJSONWritingOptions)options encoding:(NSStringEncoding)encoding;

/**
 * Convert NSDictionary to string with options
 * @param options
 * @return
 */
- (NSString *)toJSONString:(NSJSONWritingOptions)options;

/**
 * Convert NSDictionary to string
 * @return
 */
- (NSString *)toJSONString;

@end
