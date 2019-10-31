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
#import "TRButton.h"

@implementation LATableViewCell {
    UILabel *titleLabel;
    UILabel *descriptionLabel;
    TRButton *button;
    BOOL isLoading;
}

- (instancetype)init {
    return [self initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
}

- (instancetype)init:(NSString *)reuseIdentifier {
    if ([super init:reuseIdentifier selectionColor:UIColor.redColor]) {
        UIView *container = [[UIView alloc] init:self.contentView color:UIColor.clearColor];
        [container pinToSuperviewEdges:JRTViewPinAllEdges inset:16.0];
        self.backgroundColor = UIColor.whiteColor;
        titleLabel = [[UILabel alloc] init:container color:UIColor.clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.numberOfLines = 1;
        [titleLabel pinToSuperviewEdges:JRTViewPinTopEdge | JRTViewPinRightEdge | JRTViewPinLeftEdge inset:0.0];

        descriptionLabel = [[UILabel alloc] init:container color:UIColor.clearColor];
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.textColor = UIColor.grayColor;
        [descriptionLabel pinToSuperviewEdges:JRTViewPinLeftEdge | JRTViewPinRightEdge inset:0.0];
        [descriptionLabel pinAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:titleLabel withConstant:0];

        button = [[TRButton alloc] initWithFrame:CGRectZero];
        button.backgroundColor = UIColor.blueColor;
        button.translatesAutoresizingMaskIntoConstraints = NO;
        button.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        button.cornerRadius = 8;
        button.isLoading = isLoading;
        [container addSubview:button];

        [button addConstraints:@[[button constrainToHeight:50]]];
        [button pinToSuperviewEdges:JRTViewPinBottomEdge | JRTViewPinLeftEdge | JRTViewPinRightEdge inset:0.0];
        [button pinAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:descriptionLabel withConstant:10];
        [button addTarget:self action:@selector(onPress:) forControlEvents:UIControlEventAllEvents];
    }
    return self;
}

- (void)onPress:(id)sender {
    if ([self.delegate respondsToSelector:@selector(onClick:)]) {
        [self.delegate performSelector:@selector(onClick:) withObject:self];
    }
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
