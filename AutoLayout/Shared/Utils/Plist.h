//
// Created by Tolotra RAHARISON on 08/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Plist : NSObject

#pragma mark Properties

/**
 * File name
 */
@property(nonnull, readonly, getter=getName) NSString *name;

/**
 * Plist values as mutable dictionary
 */
@property(nonnull, readonly, getter=getValues) NSMutableDictionary *values;

#pragma mark Constructor

- (instancetype)init:(NSString *)name;


#pragma mark Methods

/**
 * Save values to file
 * You need to trigger it manually to avoid accessing file many times
 */
- (void)persistValues;

/**
 * Set value for key
 * @param value
 * @param key
 */
- (void)setItem:(id)value forKey:(NSString *)key;

/**
 * Remove item for key
 * @param key
 * @return
 */
- (void)removeItemForKey:(NSString *)key;

/**
 * Get value for key
 * @param key
 * @return NSString*
 */
- (id)getItemForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END