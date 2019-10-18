//
//  LATableViewCell.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 16/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "LATableViewCell.h"
#import "UIView+AutoLayout.h"
#import "UIView+Extension.h"
#import "UITableViewCell+Extension.h"

@implementation LATableViewCell {
    UILabel *titleLabel;
    UILabel *descriptionLabel;
}

- (instancetype)init {
    return [self initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
}

- (instancetype)init:(NSString *)reuseIdentifier {
    if ([super init:reuseIdentifier selectionColor:UIColor.redColor]) {
        UIView *container = [[UIView alloc] init:self.contentView color:UIColor.clearColor];
        [container pinToSuperviewEdges:JRTViewPinAllEdges inset:16.0];

        titleLabel = [[UILabel alloc] init:container color:UIColor.clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.numberOfLines = 1;
        [titleLabel pinToSuperviewEdges:JRTViewPinTopEdge | JRTViewPinRightEdge | JRTViewPinLeftEdge inset:0.0];

        descriptionLabel = [[UILabel alloc] init:container color:UIColor.clearColor];
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel pinToSuperviewEdges:JRTViewPinBottomEdge | JRTViewPinLeftEdge | JRTViewPinRightEdge inset:0.0];
        [descriptionLabel pinAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:titleLabel withConstant:0];
    }
    return self;
}

- (void)setTitleText:(NSString *)titleText {
    titleLabel.text = titleText;
}

- (void)setTitleColor:(UIColor *)color {
    titleLabel.textColor = color;
}

- (void)setDescriptionText:(NSString *)descriptionText {
    descriptionLabel.text = descriptionText;
}

@end
