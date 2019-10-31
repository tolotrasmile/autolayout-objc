//
// Created by Tolotra RAHARISON on 17/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

- (instancetype)init:(NSString *)reuseIdentifier selectionColor:(UIColor *)selectionColor resetEdges:(BOOL)resetEdges {
    if ([self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        if (resetEdges) {
            if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
                [self setSeparatorInset:UIEdgeInsetsZero];
            }

            if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
                [self setPreservesSuperviewLayoutMargins:NO];
            }

            if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
                [self setLayoutMargins:UIEdgeInsetsZero];
            }
        }

        [self setSelectionStyle:UITableViewCellSelectionStyleDefault];

        UIView *bgColorView = UIView.alloc.init;
        bgColorView.backgroundColor = selectionColor;
        self.selectedBackgroundView = bgColorView;
    }
    return self;
}

- (instancetype)init:(NSString *)reuseIdentifier selectionColor:(UIColor *)selectionColor {
    return [self init:reuseIdentifier selectionColor:selectionColor resetEdges:TRUE];
}

@end
