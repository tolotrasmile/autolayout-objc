//
//  LAContext+Extension.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 17/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "LAContext+Extension.h"

@implementation LAContext (Extension)

- (void)canUseBiometrics:(LAPolicy)policy
                  reason:(NSString *)reason
                   reply:(void (^)(BOOL success, NSError *__nullable error, NSInteger code))reply {
  [self getLAType:policy reply:^(BOOL type, NSError *e) {
    if (type != BiometryTypeNone) {
      [self evaluatePolicy:policy
           localizedReason:reason
                     reply:^(BOOL success, NSError *error) {
                       dispatch_async(dispatch_get_main_queue(), ^{
                         if (success) {
                           reply(true, error, 0);
                         } else {
                           reply(false, error, error.code);
                         }
                       });
                     }
      ];
    } else {
      reply(false, e, e.code);
    }
  }];
}

- (BOOL)canUseBiometrics:(LAPolicy)policy {
  NSError *e = nil;
  if (![self canEvaluatePolicy:policy error:&e]) {
    return false;
  }
  return e ? false : true;
}

- (void)getLAType:(LAPolicy)policy reply:(void (^)(BOOL BiometryType, NSError *__nullable error))reply {
  NSError *e = nil;

  /**
   * Evaluer l'accèss
   */
  if (![self canEvaluatePolicy:policy error:&e]) {
    return reply(BiometryTypeNone, e);
  }

  // Pour iOS 11.2 et plus
  if (@available(iOS 11.2, *)) {
    BiometryType type;
    switch (self.biometryType) {
      case LABiometryTypeTouchID:
        type = BiometryTypeTouchID;
        break;
      case LABiometryTypeFaceID:
        type = BiometryTypeFaceID;
        break;
      default:
        type = BiometryTypeNone;
        break;
    }
    return reply(type, e);
  }

  // Fallback to TouchID
  return reply(BiometryTypeTouchID, e);
}

@end
