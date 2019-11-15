//
// Created by Tolotra RAHARISON on 15/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TRToggle;

NS_ASSUME_NONNULL_BEGIN

@interface TRToggle : UIControl

@property(nonatomic, getter=getIsOn, setter=setIsOn:) BOOL isOn;
@property(nonatomic, getter=getIsUpperCaseTitle, setter=setIsUpperCaseTitle:) BOOL isUpperCaseTitle;

- (instancetype)initWithFrame:(CGRect)frame isOn:(BOOL)isOn;

- (instancetype)init;

/**
 * Set title for state
 * @param title
 * @param isOn
 */
- (void)setTitle:(NSString *)title forState:(BOOL)isOn;

/**
 * Get title for state
 * @param state
 * @return
 */
- (NSString *)getTitleForState:(BOOL)state;

/**
 * Set font for state
 * @param font
 * @param state
 */
- (void)setFont:(UIFont *)font forState:(UIControlState)state;

/**
 * Get font for state
 * @param state
 * @return
 */
- (UIFont *)getFontForState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
