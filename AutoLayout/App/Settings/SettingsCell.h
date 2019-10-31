//
//  SettingsCell.h
//  AutoLayout
//
//  Created by p1smartphone imac3 on 31/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colors.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsCell : UITableViewCell

@property(nonatomic, nonnull, readonly) UILabel *titleLabel;
@property(nonatomic, nonnull, readonly) UILabel *descriptionLabel;
@property(nonatomic, nonnull, readonly) UISegmentedControl *button;

- (id)init:(NSString *)reuseIdentifier horizontal:(CGFloat)horizontal vertical:(CGFloat)vertical;

- (void)setEnabled:(BOOL)enabled;
@end

NS_ASSUME_NONNULL_END
