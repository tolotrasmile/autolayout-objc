//
// Created by Tolotra RAHARISON on 23/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

static NSObject *sharedInstance = nil;

+ (instancetype)sharedInstance {
    @synchronized (self) {
        if (!sharedInstance) {
            sharedInstance = [[self alloc] init];
        }
        return sharedInstance;
    }
}

@end
