//
//  UILabel+Utility.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 29/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Utility)

- (CGFloat)textHeightForWidth:(CGFloat)width;

- (CGFloat)attributedTextHeightForWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
