//
//  TodoCell.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 14/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TODO_CELL_ID @"TODO_CELL_ID"

NS_ASSUME_NONNULL_BEGIN

@interface TodoCell : UITableViewCell

- (id)init:(NSString *)reuseIdentifier;

- (void)setTitleText:(NSString *)titleText;

- (void)setDescriptionText:(NSString *)descriptionText;

@end

NS_ASSUME_NONNULL_END
