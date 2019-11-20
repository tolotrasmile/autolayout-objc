//
// Created by Tolotra RAHARISON on 15/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "TRToggle.h"

@implementation TRToggle {
  BOOL _value;
  BOOL _isUpperCaseTitle;
  UISegmentedControl *_control;
}

#pragma mark Contructors

- (instancetype)initWithFrame:(CGRect)frame isOn:(BOOL)isOn {
  self = [super initWithFrame:frame];

  if (self) {
    // Create control
    _control = [[UISegmentedControl alloc] initWithItems:@[@"Yes", @"Non"]];
    [self addSubview:_control];
    [self updateControlFrame];
    [self setIsOn:isOn];
    [_control addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventValueChanged];
  }

  return self;
}

- (instancetype)init {
  return [self initWithFrame:CGRectZero isOn:FALSE];
}

#pragma mark UI methods

- (void)layoutSubviews {
  [self updateControlFrame];
}

- (void)updateControlFrame {
  // Update control frame
  _control.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

  // Calculate segment width by frame
  CGFloat width = self.frame.size.width / 2.0;

  // Update segments width
  [_control setWidth:width forSegmentAtIndex:0];
  [_control setWidth:width forSegmentAtIndex:1];
}

#pragma mark Delegate methods

- (void)onChange:(UISegmentedControl *)sender {
  _value = [self getBoolFromIndex:(NSUInteger) sender.selectedSegmentIndex];
  [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark Private methods

/**
 * Get selected index from input value
 * @param isOn Input state
 * @return  TRUE: 0, FALSE: 1
 */
- (NSUInteger)getIndexFromBool:(BOOL)isOn {
  return isOn ? 0 : 1;
}

/**
 * Get boolean value from selected index
 * @param index Input index
 * @return 0: TRUE, 1: FALSE
 */
- (BOOL)getBoolFromIndex:(NSUInteger)index {
  return index == 0;
}

#pragma mark Getters and Setters

/**
 * Get ON value
 * @return BOOL value
 */
- (BOOL)getIsOn {
  return _value;
}

/**
 * Set ON value
 * @param isOn New value
 */
- (void)setIsOn:(BOOL)isOn {
  _value = isOn;
  _control.selectedSegmentIndex = [self getIndexFromBool:isOn];
  [self layoutIfNeeded];
}

/**
 * Set upper casing value
 * @param isUpperCaseTitle New title
 */
- (void)setIsUpperCaseTitle:(BOOL)isUpperCaseTitle {
  _isUpperCaseTitle = isUpperCaseTitle;
  [self setTitle:[_control titleForSegmentAtIndex:1] forState:FALSE];
  [self setTitle:[_control titleForSegmentAtIndex:0] forState:TRUE];
}

/**
 * Get upper casing value
 * @return TRUE/FALSE
 */
- (BOOL)getIsUpperCaseTitle {
  return _isUpperCaseTitle;
}

/**
 * Set title for state
 * @param title New title
 * @param state State (TRUE/FALSE)
 */
- (void)setTitle:(NSString *)title forState:(BOOL)state {
  NSUInteger index = [self getIndexFromBool:state];

  // Check upper case value
  NSString *t = (title && _isUpperCaseTitle) ? [title uppercaseString] : title;
  [_control setTitle:t forSegmentAtIndex:index];
}

- (NSString *)getTitleForState:(BOOL)state {
  NSUInteger index = [self getIndexFromBool:state];
  return [_control titleForSegmentAtIndex:index];
}

/**
 * Enable/Disable user interaction
 */
- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled {
  [super setUserInteractionEnabled:userInteractionEnabled];
  [_control setEnabled:userInteractionEnabled];
}

- (void)setTintColor:(UIColor *)tintColor {
  [super setTintColor:tintColor];
  [_control setTintColor:tintColor];
}

- (void)setFont:(UIFont *)font forState:(UIControlState)state {
  [_control setTitleTextAttributes:@{NSFontAttributeName: font} forState:UIControlStateNormal];
}

- (UIFont *)getFontForState:(UIControlState)state {
  NSDictionary *attributes = [_control titleTextAttributesForState:state];
  return attributes ? attributes[NSFontAttributeName] : nil;
}

- (void)dealloc {
  [_control removeTarget:self action:@selector(onChange:) forControlEvents:UIControlEventValueChanged];
  _control = nil;
}

@end
