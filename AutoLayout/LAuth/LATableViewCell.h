//
//  LATableViewCell.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 16/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LATableViewCell : UITableViewCell

- (void)setTitleText:(NSString *)titleText;

- (void)setTitleColor:(UIColor *)color;

- (void)setDescriptionText:(NSString *)descriptionText;

@end

static NSString *cellIdentifier = @"playCellIdentifier";

NS_ASSUME_NONNULL_END
