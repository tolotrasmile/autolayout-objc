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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (id)performSelector:(SEL)sel with:(id)object {
  if ([self respondsToSelector:sel]) {
    return [self performSelector:sel withObject:object];
  }
  return nil;
}

#pragma clang diagnostic pop

@end
