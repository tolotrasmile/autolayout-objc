//
//  LATableViewCell.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 16/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LATableViewCellDelegate <NSObject>

- (void)onClick:(NSObject *)sender;

@end

@interface LATableViewCell : UITableViewCell

@property(nonatomic, nullable) id <LATableViewCellDelegate> delegate;

- (instancetype)init:(NSString *)reuseIdentifier;

- (void)setTitleText:(NSString *)titleText;

- (void)setTitleColor:(UIColor *)color;

- (void)setDescriptionText:(NSString *)descriptionText;

@end

static NSString *cellIdentifier = @"playCellIdentifier";

NS_ASSUME_NONNULL_END
