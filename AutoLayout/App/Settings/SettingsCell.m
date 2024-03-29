//
//  SettingsCell.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 31/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "SettingsCell.h"
#import "UITableViewCell+Extension.h"
#import "UIView+Extension.h"
#import "UIView+AutoLayout.h"
#import "SettingsRow.h"
#import "LAContext+Extension.h"
#import "Functions.h"
#import "NSDictionary+JSON.h"

@implementation SettingsCell

@synthesize titleLabel;
@synthesize descriptionLabel;
@synthesize button;

- (id)init:(NSString *)reuseIdentifier horizontal:(CGFloat)horizontal vertical:(CGFloat)vertical {
  self = [super init:reuseIdentifier];
  if (self) {
    self.backgroundColor = UIColor.whiteColor;

    UIView *container = [[UIView alloc] init:self.contentView color:UIColor.clearColor];
    [container pinToSuperviewEdges:JRTViewPinRightEdge | JRTViewPinLeftEdge inset:horizontal];
    [container pinToSuperviewEdges:JRTViewPinTopEdge | JRTViewPinBottomEdge inset:vertical];

    titleLabel = [[UILabel alloc] init:container color:UIColor.whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.numberOfLines = 0;
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [titleLabel pinToSuperviewEdges:JRTViewPinTopEdge | JRTViewPinRightEdge | JRTViewPinLeftEdge inset:0.0];

    UIView *bottom = [[UIView alloc] init:container color:UIColor.whiteColor];
    [bottom pinToSuperviewEdges:JRTViewPinBottomEdge | JRTViewPinLeftEdge | JRTViewPinRightEdge inset:0.0];
    [bottom pinAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:titleLabel withConstant:10];

    descriptionLabel = [[UILabel alloc] init:bottom color:UIColor.whiteColor];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.textColor = UIColor.grayColor;
    [descriptionLabel pinToSuperviewEdges:JRTViewPinTopEdge | JRTViewPinBottomEdge | JRTViewPinLeftEdge inset:0.0];

    button = [[UISegmentedControl alloc] initWithItems:@[@"OUI", @"NON"]];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.tintColor = kBlueColor;
    [button addTarget:self action:@selector(selectionDidChange:) forControlEvents:UIControlEventValueChanged];
    [button setWidth:50 forSegmentAtIndex:0];
    [button setWidth:50 forSegmentAtIndex:1];
    [bottom addSubview:button];

    [button pinToSuperviewEdges:JRTViewPinTopEdge | JRTViewPinBottomEdge | JRTViewPinRightEdge inset:0.0];
    [button pinAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeRight ofItem:descriptionLabel withConstant:10];
  }
  return self;
}

- (void)selectionDidChange:(UISegmentedControl *)sender {
  Log(@"%@", [[self.item toDictionary] toJSONString]);
  if (self.delegate && [self.delegate respondsToSelector:@selector(didToggle:item:indexPath:)]) {
    LAContext *context = [LAContext new];
    [context canUseBiometrics:LAPolicyDeviceOwnerAuthenticationWithBiometrics reason:@"Get Atuh" reply:^(BOOL success, NSError *error, NSInteger code) {
      if (!error) {
        [self setActive:true];
        [[self delegate] didToggle:(BOOL) sender.selectedSegmentIndex item:self.item indexPath:self.indexPath];
      } else {
        [self setActive:false];
        Log(@"Error %@", error);
      }
    }];
  }
}

- (void)setAccessible:(BOOL)accessible {
  [self setUserInteractionEnabled:accessible];
  CGFloat alpha = accessible ? 1.0 : 0.4;
  [UIView animateWithDuration:0.5 animations:^{
    self.titleLabel.alpha = self.descriptionLabel.alpha = self.button.alpha = alpha;
  }];
}

- (void)setActive:(BOOL)active {
  self.button.selectedSegmentIndex = active ? 0 : 1;
}

- (void)update:(SettingsRow *)row atIndexPath:(NSIndexPath *)indexPath {
  if (row) {
    self.item = row;
    self.titleLabel.text = row.title;
    self.descriptionLabel.text = row.subtitle;
    self.button.selectedSegmentIndex = row.active ? 0 : 1;
    self.accessible = row.accessible;
    self.key = row.key;
    self.active = row.active;
    self.indexPath = indexPath;
  }
}


@end
