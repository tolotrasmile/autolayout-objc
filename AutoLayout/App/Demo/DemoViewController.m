//
// Created by p1smartphone imac3 on 20/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "DemoViewController.h"
#import "TRButton.h"

@implementation DemoViewController {
  TRButton *button;
}

- (void)viewDidLoad {
  self.title = @"DEMO";
  self.view.backgroundColor = UIColor.whiteColor;
  button = [[TRButton alloc] init];
  button.frame = CGRectMake(0, 0, 200, 60);
  button.cornerRadius = MIN(button.frame.size.height, button.frame.size.width) / 2;
  button.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
  button.text = @"CLICK ME!!!";
  //button.gradientColors = @[(id) [UIColor systemPinkColor].CGColor, (id) [UIColor systemOrangeColor].CGColor];
  button.backgroundColor = [UIColor clearColor];
  button.style = TRButtonStyleOutline;
  button.textColor = button.borderColor = [UIColor grayColor];
  button.layer.borderWidth = 2;

  button.center = self.view.center;
  [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:button];
}

/**
 *
 * @return
 */
- (CGFloat)scaleFactor {
  return [[UIScreen mainScreen] respondsToSelector:NSSelectorFromString(@"scale")] ? [UIScreen.mainScreen scale] : 1.0;
}

- (void)onClickButton:(TRButton *)sender {
  NSURL *url = [NSURL URLWithString:@"https://reqres.in/api/users"];
  [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:NSOperationQueue.mainQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    if (data) {
      NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
      NSLog(@"%@", str);
    }
  }];
  NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (data) {
      NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
      NSLog(@"%@", str);
    }
  }];

  if (task) {
    [task resume];
  }

}

@end