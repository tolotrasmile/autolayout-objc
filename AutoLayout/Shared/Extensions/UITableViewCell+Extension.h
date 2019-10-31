//
// Created by Tolotra RAHARISON on 17/10/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Extension)

- (instancetype)init:(NSString *)reuseIdentifier selectionColor:(UIColor *)selectionColor;

- (instancetype)init:(NSString *)reuseIdentifier;

@end

NS_ASSUME_NONNULL_END