//
//  SettingsCell.m
//  AutoLayout
//
//  Created by p1smartphone imac3 on 31/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "SettingsCell.h"
#import "UITableViewCell+Extension.h"
#import "UIView+Extension.h"
#import "UIView+AutoLayout.h"

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
    [button setWidth:50 forSegmentAtIndex:0];
    [button setWidth:50 forSegmentAtIndex:1];
    [bottom addSubview:button];

    [button pinToSuperviewEdges:JRTViewPinTopEdge | JRTViewPinBottomEdge | JRTViewPinRightEdge inset:0.0];
    [button pinAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeRight ofItem:descriptionLabel withConstant:10];
  }
  return self;
}

- (void)setEnabled:(BOOL)enabled {
  [self setUserInteractionEnabled:enabled];
  CGFloat alpha = enabled ? 1.0 : 0.4;
  [UIView animateWithDuration:0.5 animations:^{
    self.titleLabel.alpha = self.descriptionLabel.alpha = self.button.alpha = alpha;
  }];
}

@end
