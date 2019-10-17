//
//  PlayTableViewCell.m
//  IT_IO
//
//  Created by Tolotra RAHARISON on 16/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "PlayTableViewCell.h"
#import "UIView+AutoLayout.h"
#import "UIView+Extension.h"

@implementation PlayTableViewCell {
    UILabel *titleLabel;
    UILabel *descriptionLabel;
    UIImageView *imageView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (id)init {
    return [self initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleDefault];

        UIView *container = [[UIView alloc] init:self.contentView color:UIColor.clearColor];
        [container pinToSuperviewEdges:JRTViewPinAllEdges inset:16.0];

        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
            [self setPreservesSuperviewLayoutMargins:NO];
        }
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }

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
