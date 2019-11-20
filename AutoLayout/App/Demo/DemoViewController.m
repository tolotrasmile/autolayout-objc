//
// Created by p1smartphone imac3 on 20/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "DemoViewController.h"
#import "TRButton.h"
#import "UIViewController+Extension.h"


@implementation DemoViewController

- (void)viewDidLoad {

  self.view.backgroundColor = UIColor.whiteColor;
  TRButton *button = [[TRButton alloc] init];
  button.frame = CGRectMake(0, 0, 200, 60);
  button.cornerRadius = MIN(button.frame.size.height, button.frame.size.width) / 2;
  button.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
  button.textColor = [UIColor whiteColor];
  button.gradientColors = @[(id) [UIColor systemPinkColor].CGColor, (id) [UIColor orangeColor].CGColor];
  button.backgroundColor = [UIColor clearColor];
  button.style = TRButtonStyleOutline;
  button.center = self.view.center;
  [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:button];
}

- (void)onClickButton:(TRButton *)sender {
  [self showAlert:@"Alert!!!" message:@"Button clicked"];
}

@end