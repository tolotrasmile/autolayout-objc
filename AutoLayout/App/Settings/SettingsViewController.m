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
  NSMutableArray *settings;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  self.tableView.estimatedRowHeight = 90;
  self.tableView.rowHeight = UITableViewAutomaticDimension;
  [self.tableView reloadData];
  self.clearsSelectionOnViewWillAppear = NO;
  [self reloadDefaultSettings];
  addNotification(UIApplicationWillEnterForegroundNotification, @selector(didActive:));

  UIBarButtonItem *plus = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
  self.navigationItem.rightBarButtonItem = plus;
}

- (void)add {
  SettingsRow *row = [[SettingsRow alloc] init:@"security" titleKey:@"settings_security_number" description:@"settings_save"];
  [self insertItem:row atIndexPath:[NSIndexPath indexPathForRow:MAX(0, settings.count) inSection:0]];
}

- (void)dealloc {
  removeNotification(UIApplicationWillEnterForegroundNotification);
}

- (void)didActive:(id)sender {
  [self.tableView reloadData];
}

#pragma mark - UITableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return settings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  SettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell"];
  if (cell == nil) {
    cell = [[SettingsCell alloc] init:@"SettingsCell" horizontal:30 vertical:15];
    cell.delegate = self;
  }
  [cell update:settings[(NSUInteger) indexPath.row] atIndexPath:indexPath];
  return cell;
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:false];
}

#pragma mark SettingsCellDelegate

- (void)didChangeState:(BOOL)newState key:(NSString *)key indexPath:(NSIndexPath *)indexPath {
  Log(@"key %@ newState: %d", key, newState);
  [self toggleVisibility:FALSE atIndexPath:[NSIndexPath indexPathForRow:[self findIndex:key] inSection:0]];
}

#pragma mark - Settings

- (void)reloadDefaultSettings {
  settings = [NSMutableArray array];
  [settings addObjectsFromArray:[SettingsRow getSettingsRows]];
  [self.tableView reloadData];
}

- (NSInteger)findIndex:(NSString *)key {
  for (NSUInteger i = 0; i < settings.count; ++i) {
    SettingsRow *row = settings[i];
    if (row.key == key) {
      return i;
    }
  }
  return -1;
}

- (void)toggleVisibility:(BOOL)isVisible atIndexPath:(NSIndexPath *)indexPath {
  [self deleteItemAtIndexPath:indexPath];
}

- (void)deleteItemAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row > -1) {
    [settings removeObjectAtIndex:(NSUInteger) indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
  }
}

- (void)insertItem:(SettingsRow *)item atIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row > -1) {
    [settings insertObject:item atIndex:(NSUInteger) indexPath.row];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
  }
}

@end
