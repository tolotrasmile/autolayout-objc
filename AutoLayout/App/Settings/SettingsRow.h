//
// Created by Tolotra RAHARISON on 31/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface SettingsRow : JSONModel

@property(strong, nonatomic) NSString *key;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *subtitle;

// Activate/deactivate setting (Switch value)
@property(nonatomic) BOOL active;

// Hide setting item from defaultSettings list
@property(nonatomic) BOOL visible;

// Enable/disable setting
@property(nonatomic) BOOL accessible;

- (instancetype)init:(NSString *)key
               title:(NSString *)titleKey
         description:(NSString *)descriptionKey
              active:(BOOL)active
          accessible:(BOOL)accessible
             visible:(BOOL)visible;

- (instancetype)init:(NSString *)key titleKey:(NSString *)titleKey description:(NSString *)descriptionKey;

+ (id)getSettingsRows;

@end