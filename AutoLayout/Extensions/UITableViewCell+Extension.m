//
// Created by p1smartphone imac3 on 17/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UITableViewCell+Extension.h"


@implementation UITableView (Extension)

- (instancetype)init:(NSString *)reuseIdentifier {
    if(self initWi)
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [self setPreservesSuperviewLayoutMargins:NO];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }

    return self;
}

@end
