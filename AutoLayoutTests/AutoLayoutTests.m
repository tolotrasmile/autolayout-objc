//
//  AutoLayoutTests.m
//  AutoLayoutTests
//
//  Created by Tolotra RAHARISON on 08/10/2019.
//  Copyright © 2019 Tolotra RAHARISON. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AutoLayoutTests : XCTestCase

@end

@implementation AutoLayoutTests

- (void)setUp {
  // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
  NSString *actual = @"01234567891";
  NSString *excepted = @"01234567891";
  XCTAssertEqualObjects(actual, excepted);
}

- (void)testPerformanceExample {
  // This is an example of a performance test case.
  [self measureBlock:^{
    // Put the code you want to measure the time of here.
  }];
}

@end
