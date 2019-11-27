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
@property(nullable, nonatomic, copy, getter=getText, setter=setText:) NSString *text;
@property(null_resettable, nonatomic, strong) UIColor *textColor;
@property(null_resettable, nonatomic, strong, getter=getBorderColor, setter=setBorderColor:) UIColor *borderColor;
@property(null_resettable, nonatomic, strong) UIFont *font;
@property(nonatomic) UIEdgeInsets insets;
@property(nonatomic, getter=isLoading, setter=setIsLoading:) BOOL loading;
@property(nonatomic) CGFloat cornerRadius;

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets;

- (void)setGradientColors:(NSArray *)colors;

- (void)setEnabled:(BOOL)isEnabled;

@end

NS_ASSUME_NONNULL_END
