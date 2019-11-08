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
#import "UITableView+Extension.h"
#import "UIViewController+Extension.h"
#import "Plist.h"

static const UITableViewRowAnimation rowAnimation = UITableViewRowAnimationAutomatic;

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

  UIBarButtonItem *plus = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRow)];
  UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
  self.navigationItem.rightBarButtonItems = @[plus, refresh];

  // @"Settings.bundle/Root"
  Plist *plistManager = [[Plist alloc] init:@"Settings"];
  NSLog(@"%@", plistManager.values);

}

- (void)refresh {
  [self.tableView reloadDataAnimated:UITableViewRowAnimationAutomatic];
}

- (void)addRow {
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  return nil;
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

- (void)didToggle:(BOOL)newState item:(SettingsRow *)item indexPath:(NSIndexPath *)indexPath {
  [self showAlert:@"SUCCESS" message:@"Index changed" handler:^(UIAlertAction *action) {

  }];
}

#pragma mark - Settings

- (void)reloadDefaultSettings {
  settings = [NSMutableArray array];
  [settings addObjectsFromArray:[SettingsRow getSettingsRows]];
  [self.tableView reloadDataAnimated:UITableViewRowAnimationAutomatic];
}

- (NSInteger)findIndex:(SettingsRow *)item {
  for (NSUInteger i = 0; i < settings.count; ++i) {
    SettingsRow *row = settings[i];
    if (row == item) {
      return i;
    }
  }
  return -1;
}

- (SettingsRow *)itemAtIndexPath:(NSIndexPath *)indexPath {
  return settings[(NSUInteger) indexPath.row];
}

- (void)setVisibility:(BOOL)isVisible atIndexPath:(NSIndexPath *)indexPath {
  [self itemAtIndexPath:indexPath].visible = isVisible;
  [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:rowAnimation];
}

- (void)setAccessible:(BOOL)isAccessible atIndexPath:(NSIndexPath *)indexPath {
  [self itemAtIndexPath:indexPath].accessible = isAccessible;
  [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:rowAnimation];
}

- (void)setEnabled:(BOOL)isEnabled atIndexPath:(NSIndexPath *)indexPath {
  [self itemAtIndexPath:indexPath].active = isEnabled;
  [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:rowAnimation];
}

- (void)deleteItemAtIndexPath:(NSIndexPath *)indexPath {
  [settings removeObjectAtIndex:(NSUInteger) indexPath.row];
  [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:rowAnimation];
}

- (void)insertItem:(SettingsRow *)item atIndexPath:(NSIndexPath *)indexPath {
  [settings insertObject:item atIndex:(NSUInteger) indexPath.row];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:rowAnimation];
}

@end
