//
//  SettingsViewController.m
//  AutoLayout
//
//  Created by Tolotra RAHARISON on 31/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import "SettingsViewController.h"
#import "Macros.h"
#import "SettingsRow.h"
#import "Functions.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController {
  NSArray *settings;
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
  addNotification(UIApplicationWillEnterForegroundNotification, @selector(didActive:));
}

- (void)didActive:(id)sender {
  [self reloadSettings];
}

- (void)reloadSettings {
  settings = [SettingsRow getSettingsRows];
  [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self activeSettings].count;
}

- (NSArray *)activeSettings {
  NSMutableArray *activeSettings = [NSMutableArray array];
  for (SettingsRow *o in settings) {
    if (o.visible) {
      [activeSettings addObject:o];
    }
  }
  return activeSettings;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:false];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  SettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell"];
  if (cell == nil) {
    cell = [[SettingsCell alloc] init:@"SettingsCell" horizontal:30 vertical:15];
    cell.delegate = self;
  }
  SettingsRow *currentRow = self.activeSettings[(NSUInteger) indexPath.row];
  [currentRow updateViewModel:cell atIndexPath:indexPath];
  return cell;
}

- (void)didChangeState:(BOOL)newState key:(NSString *)key indexPath:(NSIndexPath *)indexPath {
  Log(@"key %@ newState: %d", key, newState);
}

- (void)dealloc {
  removeNotification(UIApplicationWillEnterForegroundNotification);
}

@end
