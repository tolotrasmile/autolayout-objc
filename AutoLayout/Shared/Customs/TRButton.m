//
//  TRButton.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "TRButton.h"

@implementation TRButton {
  TRButtonStyle buttonStyle;
  BOOL pressed;
  BOOL loading;
  UIActivityIndicatorView *loader;
  UILabel *titleLabel;
}

const static CGFloat TRButtonAnimationDuration = 0.5f;

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];

    loader = [[UIActivityIndicatorView alloc] init];
    loader.hidesWhenStopped = true;
    [self addSubview:loader];

    [self setup];
  }
  return self;
}

- (void)setup {
  titleLabel.textAlignment = NSTextAlignmentCenter;
  titleLabel.textColor = UIColor.whiteColor;
  titleLabel.numberOfLines = 1;
  titleLabel.adjustsFontSizeToFitWidth = YES;
  [self setText:@"button"];

  loader.alpha = 0;
  loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
  loader.color = UIColor.whiteColor;
  loader.hidesWhenStopped = true;

  self.insets = UIEdgeInsetsZero;
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
  self.insets = edgeInsets;
  [self layoutIfNeeded];
}

- (void)updateCornerRadius {
  self.layer.masksToBounds = true;
  self.layer.cornerRadius = self.cornerRadius;
}

- (void)layoutSubviews {
  titleLabel.frame = CGRectMake(
      self.insets.left,
      self.insets.top,
      self.bounds.size.width - self.insets.left - self.insets.right,
      self.bounds.size.height - self.insets.top - self.insets.bottom
  );
  loader.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
  [self updateCornerRadius];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
  [super setBackgroundColor:backgroundColor];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor opacity:(CGFloat)alpha {
  CGFloat red, green, blue;
  [backgroundColor getRed:&red green:&green blue:&blue alpha:nil];
  [self setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:alpha]];
}

- (void)setText:(nullable NSString *)text {
  if (text != nil) {
    titleLabel.text = [text uppercaseString];
  }
}

- (UIColor *)textColor {
  return titleLabel.textColor;
}

- (TRButtonStyle)style {
  return buttonStyle;
}

- (void)setTextColor:(UIColor *)textColor {
  titleLabel.textColor = textColor;
}

- (UIFont *)font {
  return titleLabel.font;
}

- (void)setFont:(UIFont *)font {
  titleLabel.font = font;
}

- (void)setGradientColors:(NSArray *)colors {
  CAGradientLayer *gradient = [CAGradientLayer layer];
  gradient.frame = self.bounds;
  gradient.colors = colors;
  gradient.startPoint = CGPointZero;
  gradient.endPoint = CGPointMake(1, 1);
  [self.layer insertSublayer:gradient atIndex:0];
}

- (BOOL)isLoading {
  return loading;
}

- (void)setEnabled:(BOOL)isEnabled {
  [self setEnabled:isEnabled animated:FALSE];
}

- (void)setEnabled:(BOOL)isEnabled animated:(BOOL)animated {
  [super setEnabled:isEnabled];
  CGFloat alpha = isEnabled ? 1.0 : 0.3;

  if (animated) {
    __weak __typeof__(self) weakSelf = self;
    [UIView animateWithDuration:TRButtonAnimationDuration animations:^{
      [weakSelf setBackgroundColor:self.backgroundColor opacity:alpha];
    }];
  } else {
    [self setBackgroundColor:self.backgroundColor opacity:alpha];
  }
}

- (void)setIsLoading:(BOOL)isLoading {
  loading = isLoading;
  __weak __typeof__(loader) weakLoader = loader;
  if (isLoading) {
    [weakLoader startAnimating];
    [UIView animateWithDuration:TRButtonAnimationDuration animations:^{
      titleLabel.alpha = 0;
    }];
  } else {
    [weakLoader stopAnimating];
    [UIView animateWithDuration:TRButtonAnimationDuration animations:^{
      titleLabel.alpha = 1;
    }];
  }
}

- (void)setPressed:(BOOL)value {
  pressed = value;
  CGFloat alpha = pressed ? 0.3 : 1.0;
  __weak __typeof__(self) weakSelf = self;
  [UIView animateWithDuration:TRButtonAnimationDuration animations:^{
    weakSelf.alpha = alpha;
  }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  [self setPressed:true];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  if (pressed) {
    [self sendActionsForControlEvents:UIControlEventAllEvents];
  }
  [self setPressed:false];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
  [self setPressed:false];
}

@end
