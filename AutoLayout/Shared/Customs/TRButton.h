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

@interface TRButton : UIControl

@property(nullable, nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIActivityIndicatorView *loader;
@property(nonatomic) UIEdgeInsets insets;
@property(nonatomic, readonly, getter=isLoading) BOOL loading;
@property(nonatomic) CGFloat cornerRadius;

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets;

- (void)setText:(nullable NSString *)text;

- (void)setEnabled:(BOOL)isEnabled;

- (void)setIsLoading:(BOOL)isLoading;

@end

NS_ASSUME_NONNULL_END
