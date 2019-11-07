//
//  UITableView+Extension.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

- (instancetype)initWithStyle:(UITableViewStyle)style estimatedRowHeight:(CGFloat)estimatedRowHeight withParent:(UIViewController <UITableViewDataSource, UITableViewDelegate> *)parent {
  if ([self initWithStyle:style withParent:parent]) {
    self.rowHeight = UITableViewAutomaticDimension;
    self.estimatedRowHeight = estimatedRowHeight;
  }
  return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style withParent:(UIViewController <UITableViewDataSource, UITableViewDelegate> *)parent {
  if ([self initWithFrame:CGRectZero style:style]) {
    self.dataSource = parent;
    self.delegate = parent;
    self.backgroundColor = UIColor.whiteColor;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.separatorInset = UIEdgeInsetsZero;
    self.backgroundView = nil;
  }
  return self;
}

- (void)reloadDataAnimated:(UITableViewRowAnimation)animation {
  NSUInteger sectionsCount = (NSUInteger) MAX(self.numberOfSections, 1);
  NSIndexSet *section = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, sectionsCount)];
  [self reloadSections:section withRowAnimation:animation];
}

@end
