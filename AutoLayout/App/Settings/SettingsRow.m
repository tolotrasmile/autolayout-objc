//
// Created by p1smartphone imac3 on 31/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "SettingsRow.h"
#import "SettingsCell.h"

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

+ getSettingsRows {
  return @[
      [[SettingsRow alloc] init:@"security" titleKey:@"settings_security_number" description:@"settings_save"],
      [[SettingsRow alloc] init:@"bio" titleKey:@"settings_biometric" description:@"settings_touch_id"],
      [[SettingsRow alloc] init:@"gluten" titleKey:@"settings_gluten" description:@"settings_enable_service"],
  ];
};

- (instancetype)init:(NSString *)key titleKey:(NSString *)titleKey description:(NSString *)descriptionKey {
  return [self init:key title:titleKey description:descriptionKey active:true accessible:true visible:true];
}

- (void)updateViewModel:(SettingsCell *)viewModel atIndexPath:(NSIndexPath *)indexPath {
  if (viewModel) {
    viewModel.titleLabel.text = self.title;
    viewModel.descriptionLabel.text = self.subtitle;
    viewModel.button.selectedSegmentIndex = self.active ? 0 : 1;
    viewModel.accessible = self.accessible;
    viewModel.key = self.key;
    viewModel.indexPath = indexPath;
  }
}

@end