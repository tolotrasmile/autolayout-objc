//
//  SettingsViewController.m
//  AutoLayout
//
//  Created by p1smartphone imac3 on 31/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsCell.h"
#import "Functions.h"
#import "Macros.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController {
  NSMutableArray *settings;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  self.tableView.estimatedRowHeight = 90;
  self.tableView.rowHeight = UITableViewAutomaticDimension;
  [self.tableView reloadData];
  self.clearsSelectionOnViewWillAppear = NO;
  [self reloadSettings];
}

- (void)reloadSettings {
  settings = [NSMutableArray array];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 10;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:false];
  Log(@"%f", x(tableView.frame));
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  SettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell"];
  if (cell == nil) {
    cell = [[SettingsCell alloc] init:@"SettingsCell" horizontal:30 vertical:15];
  }
  cell.titleLabel.text = @"Mes prises en charge de la maladie cœliaque";
  cell.descriptionLabel.text = @"Mémoriser";
  cell.button.selectedSegmentIndex = randomBool();
  cell.enabled = randomBool();
  return cell;
}

@end
