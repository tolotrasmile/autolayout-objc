//
// Created by Tolotra RAHARISON on 31/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "SettingsRow.h"

@implementation SettingsRow

- (instancetype)init:(NSString *)key
               title:(NSString *)titleKey
         description:(NSString *)descriptionKey
              active:(BOOL)active
          accessible:(BOOL)accessible
             visible:(BOOL)visible {
  self = [super init];
  if (self) {
    self.key = key;
    self.title = NSLocalizedString(titleKey, @"");
    self.subtitle = NSLocalizedString(descriptionKey, @"");
    self.active = active;
    self.visible = visible;
    self.accessible = accessible;
  }
  return self;
}

- (instancetype)init:(NSString *)key titleKey:(NSString *)titleKey description:(NSString *)descriptionKey {
  return [self init:key title:titleKey description:descriptionKey active:false accessible:true visible:true];
}

+ getSettingsRows {
  return @[
      [[SettingsRow alloc] init:@"security" titleKey:@"settings_security_number" description:@"settings_save"],
      [[SettingsRow alloc] init:@"bio" titleKey:@"settings_biometric" description:@"settings_touch_id"],
      [[SettingsRow alloc] init:@"gluten" titleKey:@"settings_gluten" description:@"settings_enable_service"],
  ];
};

@end
