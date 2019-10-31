//
//  UIView+NSLayoutConstraint.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 08/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NSLayoutConstraint)


/**
 * Add edges constraints to subview
 * @param view Subview
 * @param top Top margin
 * @param left Left margin
 * @param bottom Bottom margin
 * @param right Right margin
 */
- (void)addConstraintsInView:(UIView *)view top:(double)top left:(double)left bottom:(double)bottom right:(double)right;

/**
 * Add constraints for horizontal and vertical margins
 * @param view Subview
 * @param horizontal Horizontal margin
 * @param vertical Vertical margin
 */
- (void)addConstraintsInView:(UIView *)view h:(double)horizontal v:(double)vertical;

/**
 * Enable safe aria view from UIViewController first view
 * @param view UIViewController view
 */
- (void)enableSafeArea:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
