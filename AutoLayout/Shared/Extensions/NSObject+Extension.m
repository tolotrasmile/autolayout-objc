//
// Created by Tolotra RAHARISON on 23/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

+ (instancetype)sharedInstance {
  static id sharedInstance = nil;

  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] init];
  });

  return sharedInstance;
}

@end
