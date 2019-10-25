//
//  TRButton.m
//  AutoLayout
//
//  Created by p1smartphone imac3 on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "TRButton.h"

@implementation TRButton {
    BOOL pressed;
    CGFloat opacity;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = [@"PRESS ME" uppercaseString];
        [self addSubview:self.titleLabel];
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
    [self updateCornerRadius];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    [backgroundColor getRed:nil green:nil blue:nil alpha:&opacity];
}

- (void)setPressed:(BOOL)value {
    pressed = value;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = pressed ? opacity / 2 : opacity;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self setPressed:true];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if (pressed) {
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    [self setPressed:false];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self setPressed:false];
}

@end
