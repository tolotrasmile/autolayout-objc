//
//  UITableView+Extension.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Extension)

- (instancetype)initWithStyle:(UITableViewStyle)style estimatedRowHeight:(CGFloat)estimatedRowHeight withParent:(UIViewController <UITableViewDataSource, UITableViewDelegate> *)parent;

- (void)reloadDataAnimated:(UITableViewRowAnimation)animation;

@end

NS_ASSUME_NONNULL_END
