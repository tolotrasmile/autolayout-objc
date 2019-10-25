//
//  UIButton+Extension.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (instancetype)initWithTitle:(nullable NSString *)title backgroundColor:(UIColor *)backgroundColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:backgroundColor forState:UIControlStateNormal];

    button.backgroundColor = UIColor.clearColor;
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.layer.borderColor = backgroundColor.CGColor;
    button.layer.borderWidth = 2.0f;
    button.layer.cornerRadius = 10.0f;

    return button;
}

@end
