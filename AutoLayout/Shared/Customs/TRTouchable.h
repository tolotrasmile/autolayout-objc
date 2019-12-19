//
//  TRTouchable.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 2019-12-13.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRTouchable : UIControl

@property(null_resettable, nonatomic, strong, getter=getBorderColor, setter=setBorderColor:) UIColor *borderColor;
@property(nonatomic) UIEdgeInsets insets;
@property(nonatomic) CGFloat cornerRadius;

- (void)setHidden:(BOOL)hidden;

- (BOOL)isHidden;

- (void)setGradientColors:(NSArray *)colors;

@end

NS_ASSUME_NONNULL_END
