//
//  UITableView+Extension.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

- (instancetype)initWithStyle:(UITableViewStyle)style estimatedRowHeight:(CGFloat)estimatedRowHeight withParent:(id <UITableViewDataSource, UITableViewDelegate>)parent {
    if ([self initWithFrame:CGRectZero style:style]) {
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = estimatedRowHeight;
        self.sectionHeaderHeight = UITableViewAutomaticDimension;
        self.estimatedSectionHeaderHeight = estimatedRowHeight;
        self.sectionFooterHeight = UITableViewAutomaticDimension;
        self.sectionFooterHeight = estimatedRowHeight;
        self.dataSource = parent;
        self.delegate = parent;
        self.backgroundColor = UIColor.whiteColor;
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

@end
