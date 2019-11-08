//
// Created by Tolotra RAHARISON on 08/11/2019.
// Copyright (c) 2019 Tolotra RAHARISON. All rights reserved.
//

#import "Plist.h"

/**
 * Actually supports Main bundle Plist files
 */
@implementation Plist {
  NSString *name;
  NSMutableDictionary *values;
}

#pragma mark Constructor

- (instancetype)init:(NSString *)fileName {
  self = [super init];
  if (self) {
    name = fileName;
    /**
     * Default file manager
     */
    NSFileManager *fileManager = NSFileManager.defaultManager;

    NSString *sourcePath = [self getSourcePath];

    /**
     * Throw an error if the Plist source file don't exists
     */
    if (![fileManager fileExistsAtPath:sourcePath]) {
      [NSException raise:@"No such file or directory" format:@"Plist for '%@' not found", fileName];
    }

    NSString *destinationPath = [self getDestinationPath];

    /**
     * Copy source content for the first use
     */
    if (![fileManager fileExistsAtPath:destinationPath]) {
      NSLog(@"Path: %@\n Not exists: create new file...", destinationPath);
      NSError *e;

      /**
       * Copy source content into destination path
       */
      [fileManager copyItemAtPath:sourcePath toPath:destinationPath error:&e];

      // If copy failed, eg: Unable to create file
      if (e) {
        NSLog(@"ERROR: %@", e);
        [NSException raise:@"Error when copying file content" format:@""];
      }
    }

    // Save file content into dictionary
    values = [NSMutableDictionary dictionaryWithContentsOfFile:destinationPath];

  }
  return self;
}

#pragma mark Getters

/**
 * Getter method for name property
 * @return
 */
- (NSString *)getName {
  return name;
}

/**
 * Getter method for values property
 * @return
 */
- (NSMutableDictionary *)getValues {
  return values;
}

#pragma mark Private methods

/**
 * Original source path
 * @return
 */
- (NSString *)getSourcePath {
  NSString *filePath = [NSBundle.mainBundle pathForResource:self.name ofType:@"plist"];
  return filePath;
}

/**
 * Destination source path
 * Stored at the user document directory
 * Deleted when the app is uninstalled
 * @return
 */
- (NSString *)getDestinationPath {
  if (self.name) {
    // Use personal document directory
    NSString *directory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE)[0];
    return [directory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", self.name]];
  }
  return nil;
}

#pragma mark Methods

- (void)setItem:(id)value forKey:(NSString *)key {
  values[key] = value;
}

/**
 * Test hooks
 * @param key
 * @return
 */
- (id)getItemForKey:(NSString *)key {
  return values[key];
}

- (void)removeItemForKey:(NSString *)key {
  [values removeObjectForKey:key];
}

- (void)persistValues {
  NSFileManager *fileManager = NSFileManager.defaultManager;
  NSString *destinationPath = [self getDestinationPath];
  if ([fileManager fileExistsAtPath:destinationPath]) {
    [values writeToFile:destinationPath atomically:false];
  }
}


@end