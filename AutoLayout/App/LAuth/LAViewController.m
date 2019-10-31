//
//  LAViewController.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 16/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <LocalAuthentication/LocalAuthentication.h>
#import "LAViewController.h"
#import "UIView+AutoLayout.h"
#import "UIApplication+Extension.h"
#import "LAContext+Extension.h"
#import "UITableView+Extension.h"

@interface LAViewController () <UITableViewDataSource, UITableViewDelegate, LATableViewCellDelegate>

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
    LATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[LATableViewCell alloc] init:cellIdentifier];
    }

    NSDictionary *item = items[(NSUInteger) indexPath.row];

    [cell setTitleText:[NSString stringWithFormat:@"%@: %@", item[@"key"], item[@"value"]]];
    [cell setTitleColor:_errorCode == [item[@"value"] intValue] ? UIColor.redColor : UIColor.blackColor];
    cell.delegate = self;

    [cell setDescriptionText:[NSString stringWithFormat:@"ERROR CODE: %d", _errorCode]];
    return cell;
}

- (void)setErrorCode:(NSInteger)code {
    _errorCode = (int) code;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_tableView reloadData];
    });
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)initTableView {
    _tableView = [[UITableView alloc] initWithStyle:UITableViewStylePlain estimatedRowHeight:80 withParent:self];
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
            @{@"key": @"kLAErrorBiometryLockout", @"value": @(LAErrorBiometryLockout)},
            @{@"key": @"kLAErrorAppCancel", @"value": @(kLAErrorAppCancel)},
            @{@"key": @"kLAErrorInvalidContext", @"value": @(kLAErrorInvalidContext)},
            @{@"key": @"kLAErrorNotInteractive", @"value": @(kLAErrorNotInteractive)},
    ];

    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didActive:) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)didActive:(id)didActive {
    NSLog(@"UIApplicationWillEnterForegroundNotification : %@", UIApplicationWillEnterForegroundNotification);
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}


- (void)onClick:(NSObject *)sender {
    LAContext *context = [LAContext new];
    context.localizedFallbackTitle = @"";
    [context getPermission:LAPolicyDeviceOwnerAuthenticationWithBiometrics reason:@"Get LA Code" reply:^(BOOL success, NSError *error, NSInteger code) {
        if (!success) {
            if (code == kLAErrorBiometryNotEnrolled) {
                [UIApplication.sharedApplication openURLString:@"App-prefs:root=General"];
            }
        }
        [self setErrorCode:code];
    }];
}


@end
