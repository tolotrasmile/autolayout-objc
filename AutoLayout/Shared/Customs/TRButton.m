//
//  TRButton.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//
#import "TRButton.h"

@implementation TRButton {
  BOOL pressed;
  BOOL loading;
  CGFloat opacity;
}

const static CGFloat TRButtonAnimationDuration = 0.5f;

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = UIColor.whiteColor;
    self.text = @"button";
    [self addSubview:self.titleLabel];

    self.loader = [[UIActivityIndicatorView alloc] init];
    self.loader.alpha = 0;
    self.loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    self.loader.color = UIColor.whiteColor;
    self.loader.hidesWhenStopped = true;
    [self addSubview:self.loader];

    self.insets = UIEdgeInsetsZero;
  }
  return self;
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
  self.titleLabel.frame = CGRectMake(
      self.insets.left,
      self.insets.top,
      self.bounds.size.width - self.insets.left - self.insets.right,
      self.bounds.size.height - self.insets.top - self.insets.bottom
  );
  self.loader.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
  [self updateCornerRadius];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
  [super setBackgroundColor:backgroundColor];
  [backgroundColor getRed:nil green:nil blue:nil alpha:&opacity];
}

- (void)setText:(nullable NSString *)text {
  if (text != nil) {
    self.titleLabel.text = [text uppercaseString];
  }
}

- (BOOL)isLoading {
  return loading;
}

- (void)setIsLoading:(BOOL)isLoading {
  loading = isLoading;
  dispatch_async(dispatch_get_main_queue(), ^{
    if (loading) {
      [self.loader startAnimating];
      [UIView animateWithDuration:TRButtonAnimationDuration animations:^{
        self.titleLabel.alpha = 0;
        self.loader.alpha = 1;
      }];
    } else {
      [self.loader stopAnimating];
      [UIView animateWithDuration:TRButtonAnimationDuration animations:^{
        self.titleLabel.alpha = 1;
        self.loader.alpha = 0;
      }];
    }
  });
}

- (void)setPressed:(BOOL)value {
  pressed = value;
  CGFloat alpha = pressed ? opacity / 3 : opacity;
  [UIView animateWithDuration:TRButtonAnimationDuration animations:^{
    self.alpha = alpha;
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
