//
//  TRButton.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "TRButton.h"

@implementation TRButton {
  UILabel *titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    [self setup];
  }
  return self;
}

- (void)setup {
  titleLabel.textAlignment = NSTextAlignmentCenter;
  titleLabel.numberOfLines = 1;
  titleLabel.adjustsFontSizeToFitWidth = YES;
  [self setText:@"button"];
  self.insets = UIEdgeInsetsZero;
}

- (void)layoutSubviews {
  titleLabel.frame = CGRectMake(
      self.insets.left,
      self.insets.top,
      self.bounds.size.width - self.insets.left - self.insets.right,
      self.bounds.size.height - self.insets.top - self.insets.bottom
  );
  [super layoutSubviews];
}

- (void)setText:(nullable NSString *)text {
  titleLabel.text = text;
}

- (nullable NSString *)getText {
  return titleLabel.text;
}

- (UIColor *)textColor {
  return titleLabel.textColor;
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

@end
