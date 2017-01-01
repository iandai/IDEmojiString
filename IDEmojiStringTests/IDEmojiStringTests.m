//
//  IDEmojiStringTests.m
//  IDEmojiStringTests
//
//  Created by Ian on 2016/12/28.
//  Copyright © 2016 iandai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDEmojiManager.h"

@interface IDEmojiStringTests : XCTestCase

@end

@implementation IDEmojiStringTests

- (void)testContainEmojiInString {
    
    IDEmojiManager *manager = [[IDEmojiManager alloc] init];
    XCTAssertFalse([manager containEmojiInString:@"Some String1"]);
    XCTAssert([manager containEmojiInString:@"👪"]);
    XCTAssert([manager containEmojiInString:@"Some String⭐"]);
}

- (void)testRemoveEmojiFromString {
    
    IDEmojiManager *manager = [[IDEmojiManager alloc] init];
    XCTAssert([[manager removeEmojiFromString:@"Some String ,.*"] isEqualToString:@"Some String ,.*"]);
    XCTAssert([[manager removeEmojiFromString:@"👪"] isEqualToString:@""]);
    XCTAssert([[manager removeEmojiFromString:@"Some String⭐"] isEqualToString:@"Some String"]);
}
@end
