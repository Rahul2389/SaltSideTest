//
//  SaltSideTestTests.m
//  SaltSideTestTests
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListViewController.h"
#import "NSArray+JSON.h"
#import "ListParser.h"
#import "ItemData.h"

@interface SaltSideTestTests : XCTestCase

@end

@implementation SaltSideTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testAPIQueryForJsonFileDownload{
    
    ListViewController *listVC =
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ListViewController"];
    
    // Set the flag to YES
    __block BOOL waitingForBlock = YES;
    
    [listVC fetchListItemsCompletionHandler:^(bool flag){
        // Set the flag to NO to break the loop
        waitingForBlock = NO;
        // Assert the truth
        XCTAssertTrue(flag, @"Should have been success!");
    }];
    
    // Run the loop
    while(waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}

- (void)testMockAPIResponseForJsonFileDownload{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"items" ofType:@"json"];
    NSURL *URL = [NSURL  URLWithString:path];
    
    NSArray* litemListArray =
    [NSArray arrayWithContentsOfJSONFilePath:URL];

    NSArray* itemListArray = [ListParser parseJsonArray:litemListArray];
    
    if (itemListArray.count >0) {
        ItemData* firstItemData = [itemListArray objectAtIndex:0];

        XCTAssertNotNil(firstItemData.title, @"title Exists");
        XCTAssertNotNil(firstItemData.description, @"description Exists");
        XCTAssertNotNil(firstItemData.imageUrl, @"imageUrl Exists");
    }else{
        XCTAssertNil(itemListArray,@"No Records found");
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
