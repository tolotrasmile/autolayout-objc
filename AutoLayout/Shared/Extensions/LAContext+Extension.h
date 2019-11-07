//
//  LAContext+Extension.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 17/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <LocalAuthentication/LocalAuthentication.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BiometryType) {
  BiometryTypeNone,
  BiometryTypeTouchID,
  BiometryTypeFaceID,
};

@interface LAContext (Extension)
/**
 * Get
 * @param policy
 * @param reason
 * @param reply
 */
- (void)canUseBiometrics:(LAPolicy)policy
               reason:(NSString *)reason
                reply:(void (^)(BOOL success, NSError *__nullable error, NSInteger code))reply;

- (BOOL)canUseBiometrics:(LAPolicy)policy;

- (void)getLAType:(LAPolicy)policy reply:(void (^)(BOOL BiometryType, NSError *__nullable error))reply;

@end

NS_ASSUME_NONNULL_END
