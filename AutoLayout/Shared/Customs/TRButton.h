//
//  TRButton.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, TRButtonStyle) {
  TRButtonStylePlain = 1 << 0,
  TRButtonStyleOutline = 1 << 1
};

@interface TRButton : UIControl

// TODO: Implement style
@property(nonatomic) TRButtonStyle style;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic) UIEdgeInsets insets;
@property(nonatomic, readonly, getter=isLoading) BOOL loading;
@property(nonatomic) CGFloat cornerRadius;

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets;

- (void)setText:(nullable NSString *)text;

- (void)setGradientColors:(NSArray *)colors;

- (void)setEnabled:(BOOL)isEnabled;

- (void)setEnabled:(BOOL)isEnabled animated:(BOOL)animated;

- (void)setIsLoading:(BOOL)isLoading;

@end

NS_ASSUME_NONNULL_END
