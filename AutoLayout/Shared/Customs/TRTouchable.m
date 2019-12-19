//
//  TRTouchable.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 2019-12-13.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "TRTouchable.h"

@interface TRTouchable ()
@property UIView *backgroundView;
@end

@implementation TRTouchable {
  BOOL pressed;
}

const static CGFloat touchableAnimationDuration = 0.5f;

- (instancetype)init {
  self = [super init];
  if (self) {
    self.backgroundView = [[UIView alloc] init];
    [self addSubview:self.backgroundView];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:self.backgroundView];
  }
  return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
  self.backgroundView.backgroundColor = backgroundColor;
}

- (UIColor *)backgroundColor {
  return self.backgroundView.backgroundColor;
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
  self.insets = edgeInsets;
  [self layoutIfNeeded];
}

- (void)updateCornerRadius {
  self.layer.masksToBounds = true;
  self.layer.cornerRadius = self.cornerRadius;
}

- (void)setHidden:(BOOL)hidden {
  [super setHidden:hidden];
  for (UIView *view in self.subviews) {
    view.hidden = hidden;
    view.alpha = hidden ? 0.0 : 1.0;
    view.userInteractionEnabled = !hidden;
  }
}

- (BOOL)isHidden {
  return [super isHidden];
}

- (void)setEnabled:(BOOL)enabled {
  for (UIView *view in self.subviews) {
    view.alpha = enabled ? 1 : 0.3;
    view.userInteractionEnabled = enabled;
  }
  self.alpha = enabled ? 1 : 0.3;
  [super setEnabled:enabled];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.backgroundView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
  [self updateCornerRadius];
}

- (void)setBorderColor:(UIColor *)borderColor {
  self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)getBorderColor {
  return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setPressed:(BOOL)value {
  pressed = value;
  CGFloat alpha = pressed ? 0.3 : 1.0;
  __weak __typeof__(self) weakSelf = self;
  [UIView animateWithDuration:touchableAnimationDuration animations:^{
    weakSelf.alpha = alpha;
  }];
}

- (void)setGradientColors:(NSArray *)colors {
  // Remove previous layers
  if (self.layer.sublayers.count > 0) {
    for (CALayer *layer in self.layer.sublayers) {
      [layer removeFromSuperlayer];
    }
  }

  CAGradientLayer *gradient = [CAGradientLayer layer];
  gradient.frame = self.bounds;
  gradient.colors = colors;
  gradient.startPoint = CGPointMake(0, 1);
  gradient.endPoint = CGPointMake(1, 0);
  [self.layer insertSublayer:gradient atIndex:0];
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
