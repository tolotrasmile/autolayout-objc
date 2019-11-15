//
// Created by Tolotra RAHARISON on 15/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (NSString *)toJSONString:(NSJSONWritingOptions)options encoding:(NSStringEncoding)encoding {
  NSData *data = nil;
  NSError *error = nil;

  @try {
    data = [NSJSONSerialization dataWithJSONObject:self options:options error:&error];
  }
  @catch (NSException *exception) {
    NSLog(@"EXCEPTION: %@", exception.description);
    return nil;
  }

  if (!error) {
    return [[NSString alloc] initWithData:data encoding:encoding];
  }

  return nil;
}

- (NSString *)toJSONString:(NSJSONWritingOptions)options {
  return [self toJSONString:options encoding:NSUTF8StringEncoding];
}

- (NSString *)toJSONString {
  return [self toJSONString:NSJSONWritingPrettyPrinted];
}

@end