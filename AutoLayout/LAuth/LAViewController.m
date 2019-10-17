//
//  LAViewController.m
//  IT_IO
//
//  Created by Tolotra RAHARISON on 16/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <LocalAuthentication/LocalAuthentication.h>
#import "LAViewController.h"
#import "PlayTableViewCell.h"
#import "UIView+AutoLayout.h"
#import "UIApplication+Extension.h"
#import "LAContext+Extension.h"

@interface LAViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation LAViewController {
    UITableView *_tableView;
    NSArray *items;
    int _errorCode;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[PlayTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        UIView *bgColorView = UIView.alloc.init;
        bgColorView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8];
        cell.selectedBackgroundView = bgColorView;
    }

    NSDictionary *item = items[(NSUInteger) indexPath.row];

    [cell setTitleText:[NSString stringWithFormat:@"%@: %@", item[@"key"], item[@"value"]]];
    [cell setTitleColor:_errorCode == [item[@"value"] intValue] ? UIColor.redColor : UIColor.blackColor];

    [cell setDescriptionText:[NSString stringWithFormat:@"ERROR CODE: %d", _errorCode]];
    return cell;
}

- (void)reloadWithCode:(NSInteger)code {
    _errorCode = (int) code;
    NSLog(@"errorCode=%d,  error=%d", _errorCode, (int) code);
    [_tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    LAContext *context = [LAContext new];
    context.localizedFallbackTitle = @"";
    [context getLAPermission:LAPolicyDeviceOwnerAuthenticationWithBiometrics reason:@"Get LA Code" reply:^(BOOL success, NSError *error, NSInteger code) {
        if (!success) {
            if (code == kLAErrorBiometryNotEnrolled) {
                [UIApplication.sharedApplication openExpectedURL:@"App-prefs:root=General"];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadWithCode:code];
        });
        NSLog(@"code=%d, success=%d error=%@", (int) code, success, error);
    }];
}

- (void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = UIColor.whiteColor;
    _tableView.estimatedRowHeight = 80;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_tableView];
    [_tableView pinToSuperviewEdges:JRTViewPinAllEdges inset:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    self.view.backgroundColor = UIColor.whiteColor;
    items = @[
            @{@"key": @"kLAErrorAuthenticationFailed", @"value": @(kLAErrorAuthenticationFailed)},
            @{@"key": @"kLAErrorUserCancel", @"value": @(kLAErrorUserCancel)},
            @{@"key": @"kLAErrorUserFallback", @"value": @(kLAErrorUserFallback)},
            @{@"key": @"kLAErrorSystemCancel", @"value": @(kLAErrorSystemCancel)},
            @{@"key": @"kLAErrorPasscodeNotSet", @"value": @(kLAErrorPasscodeNotSet)},
            @{@"key": @"kLAErrorBiometryNotAvailable", @"value": @(kLAErrorBiometryNotAvailable)},
            @{@"key": @"kLAErrorBiometryNotEnrolled", @"value": @(kLAErrorBiometryNotEnrolled)},
            @{@"key": @"kLAErrorBiometryLockout", @"value": @(kLAErrorBiometryLockout)},
            @{@"key": @"kLAErrorAppCancel", @"value": @(kLAErrorAppCancel)},
            @{@"key": @"kLAErrorInvalidContext", @"value": @(kLAErrorInvalidContext)},
            @{@"key": @"kLAErrorNotInteractive", @"value": @(kLAErrorNotInteractive)},
    ];
}


@end
