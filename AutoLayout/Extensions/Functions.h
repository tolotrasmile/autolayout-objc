//
// Created by Tolotra RAHARISON on 18/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_INLINE void Log(NSString *format, ...) {
#ifdef DEBUG
    va_list ap;
    va_start(ap, format);
    NSString *print = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    NSLog(@"%@", print);
#endif
}
