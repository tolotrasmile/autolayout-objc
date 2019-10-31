//
//  TodoCell.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 14/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <FontAwesomeKit/FAKMaterialIcons.h>
#import "TodoCell.h"
#import "UIView+Extension.h"
#import "UIView+AutoLayout.h"
#import "UITableViewCell+Extension.h"

@implementation TodoCell {
    UILabel *titleLabel;
    UILabel *descriptionLabel;
}

- (id)init:(NSString *)reuseIdentifier {
    if ([super init:reuseIdentifier selectionColor:UIColor.redColor]) {
        FAKMaterialIcons *icon = [FAKMaterialIcons checkCircleIconWithSize:20];
        [icon addAttribute:NSForegroundColorAttributeName value:UIColor.greenColor];

        UIView *container = [[UIView alloc] init:self.contentView color:UIColor.clearColor];
        [container pinToSuperviewEdges:JRTViewPinAllEdges inset:16.0];

        //UIView *container = [[UIView alloc] init:self.contentView color:UIColor.redColor];
        //[container pinToSuperviewEdges:JRTViewPinAllEdges inset:10.0];

        titleLabel = [[UILabel alloc] init:container color:UIColor.clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.numberOfLines = 1;
        [titleLabel pinToSuperviewEdges:JRTViewPinTopEdge | JRTViewPinRightEdge | JRTViewPinLeftEdge inset:0.0];

        descriptionLabel = [[UILabel alloc] init:container color:UIColor.clearColor];
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel pinToSuperviewEdges:JRTViewPinBottomEdge | JRTViewPinLeftEdge | JRTViewPinRightEdge inset:0.0];

        [descriptionLabel pinAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:titleLabel withConstant:4];
    }
    return self;
}

- (void)setTitleText:(NSString *)titleText {
    titleLabel.text = titleText;
}

- (void)setDescriptionText:(NSString *)descriptionText {
    descriptionLabel.text = descriptionText;
}
@end
