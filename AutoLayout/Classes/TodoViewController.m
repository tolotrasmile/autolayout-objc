//
//  TodoViewController.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 08/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <FontAwesomeKit/FAKFontAwesome.h>
#import "TodoViewController.h"
#import "TodoCell.h"
#import "UIView+NSLayoutConstraint.h"
#import "UIView+Extension.h"

@interface TodoViewController ()

@end

@implementation TodoViewController {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self loadViews];
}

- (void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 80;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void)loadViews {
    self.containerView = [[UIView alloc] init:self.view color:UIColor.greenColor];
    [self.containerView enableSafeArea:self.view];
    [self.containerView addSubview:_tableView];
    [self.containerView addConstraintsInView:_tableView top:0 left:0 bottom:0 right:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:TODO_CELL_ID];
    if (cell == nil) {
        cell = [[TodoCell alloc] init:TODO_CELL_ID];
        [cell setDescriptionText:@"To prevent your passwords from being hacked by social engineering"];
        [cell setTitleText:@"Keep your online accounts safe"];
    }
    return cell;
}

@end
