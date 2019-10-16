//
//  UIView+NSLayoutConstraint.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 08/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "UIView+NSLayoutConstraint.h"

@implementation UIView (NSLayoutConstraint)

- (void)addConstraints:(NSArray *)formats metrics:(nullable NSDictionary<NSString *, id> *)metrics views:(NSDictionary<NSString *, id> *)views {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    for (id format in formats) {
        id constraint = [NSLayoutConstraint constraintsWithVisualFormat:format options:(NSLayoutFormatOptions) 0 metrics:metrics views:views];
        [self addConstraints:constraint];
    }
    [self layoutIfNeeded];
}

- (void)addConstraints:(NSArray *)formats views:(NSDictionary<NSString *, id> *)views {
    [self addConstraints:formats metrics:nil views:views];
}

- (void)addConstraintsInView:(UIView *)view top:(double)top left:(double)left bottom:(double)bottom right:(double)right {
    [self addConstraints:@[@"H:|-left-[view]-right-|", @"V:|-top-[view]-bottom-|"]
                 metrics:@{@"top": @(top), @"left": @(left), @"bottom": @(bottom), @"right": @(right)}
                   views:@{@"view": view}
    ];
    [self layoutIfNeeded];
}

- (void)addConstraintsInView:(UIView *)view h:(double)horizontal v:(double)vertical {
    [self addConstraints:@[@"H:|-horizontal-[view]-horizontal-|", @"V:|-vertical-[view]-vertical-|"]
                 metrics:@{@"vertical": @(vertical), @"horizontal": @(horizontal)}
                   views:@{@"view": view}
    ];
    [self layoutIfNeeded];
}

- (void)enableSafeArea:(UIView *)view {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    UILayoutGuide *guide = view.safeAreaLayoutGuide;
    [self.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [self.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [self.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [self.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;

    [self layoutIfNeeded];
}

@end
