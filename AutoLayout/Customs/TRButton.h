//
//  TRButton.h
//  AutoLayout
//
//  Created by p1smartphone imac3 on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRButton : UIControl

@property(nullable, nonatomic, strong) UILabel *titleLabel;
@property(nonatomic) UIEdgeInsets insets;
@property(nonatomic) CGFloat cornerRadius;

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets;

@end

NS_ASSUME_NONNULL_END
