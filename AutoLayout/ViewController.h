//
//  ViewController.h
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 08/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UIView *containerView;
@property(nonatomic, strong) UIView *headerView;

@end

