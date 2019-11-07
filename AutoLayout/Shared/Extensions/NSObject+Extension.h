//
// Created by Tolotra RAHARISON on 23/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extension)

+ (instancetype)sharedInstance;

- (id)performSelector:(SEL)sel with:(id)object;

@end

NS_ASSUME_NONNULL_END