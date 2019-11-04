//
//  SettingsCell.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 31/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"

@class SettingsRow;

NS_ASSUME_NONNULL_BEGIN

@protocol SettingsCellDelegate <NSObject>
- (void)didToggle:(BOOL)newState item:(SettingsRow *)item indexPath:(NSIndexPath *)indexPath;
@end

@interface SettingsCell : UITableViewCell

@property(nonatomic, nonnull, readonly) UILabel *titleLabel;
@property(nonatomic, nonnull, readonly) UILabel *descriptionLabel;
@property(nonatomic, nonnull, readonly) UISegmentedControl *button;
@property(nonatomic, nonnull) id <SettingsCellDelegate> delegate;
@property(nonatomic, nonnull) NSIndexPath *indexPath;
@property(nonatomic, nonnull) NSString *key;
@property(nonatomic, nonnull) SettingsRow *item;

- (id)init:(NSString *)reuseIdentifier horizontal:(CGFloat)horizontal vertical:(CGFloat)vertical;

- (void)setAccessible:(BOOL)accessible;

- (void)setActive:(BOOL)active;

- (void)update:(SettingsRow *)row atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
