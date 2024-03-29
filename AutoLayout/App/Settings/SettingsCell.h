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

/**
 * Notify if row switch value is changed
 * @param newState
 * @param item
 * @param indexPath
 */
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

/**
 * Setter for accessibility for user interaction on row
 * @param accessible
 */
- (void)setAccessible:(BOOL)accessible;

/**
 * Setter for switch value
 * @param active
 */
- (void)setActive:(BOOL)active;

/**
 * Update row model
 * @param row
 * @param indexPath
 */
- (void)update:(SettingsRow *)row atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
