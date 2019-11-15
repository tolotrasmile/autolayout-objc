//
// Created by Tolotra RAHARISON on 15/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRWebViewController : UIViewController <UIWebViewDelegate>

@property(nonatomic, retain) NSURL *url;

@end

NS_ASSUME_NONNULL_END
