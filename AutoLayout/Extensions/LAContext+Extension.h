//
//  LAContext+Extension.h
//  IT_IO
//
//  Created by p1smartphone imac3 on 17/10/2019.
//  Copyright © 2019 norsys. All rights reserved.
//

#import <LocalAuthentication/LocalAuthentication.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BiometryType) {
    BiometryTypeNone,
    BiometryTypeTouchID,
    BiometryTypeFaceID,
};

@interface LAContext (Extension)

- (void)getLAPermission:(LAPolicy)policy reason:(NSString *)reason reply:(void (^)(BOOL success, NSError *__nullable error, NSInteger code))reply;

@end

NS_ASSUME_NONNULL_END