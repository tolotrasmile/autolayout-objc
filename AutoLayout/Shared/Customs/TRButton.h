//
//  TRButton.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 25/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TRTouchable.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRButton : TRTouchable

@property(nullable, nonatomic, copy, getter=getText, setter=setText:) NSString *text;
@property(null_resettable, nonatomic, strong) UIColor *textColor;
@property(null_resettable, nonatomic, strong) UIFont *font;

@end

NS_ASSUME_NONNULL_END
