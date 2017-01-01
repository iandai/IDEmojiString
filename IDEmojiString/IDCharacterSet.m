//
//  IDCharacterSet.m
//  IDEmojiString
//
//  Created by Ian on 2016/12/31.
//  Copyright © 2016 iandai. All rights reserved.
//

#import "IDCharacterSet.h"

@implementation IDCharacterSet

- (instancetype)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.oneLengthSet = [[NSMutableCharacterSet alloc] init];
    self.otherLengthSet = [[NSMutableCharacterSet alloc] init];
    return self;
}


- (void)addComposedCharactersInString:(NSString *)aStr {

    if ([aStr length] == 0) {
        return;
    } else if ([aStr length] == 1) {
        [self.oneLengthSet addCharactersInString:aStr];
    } else {
        [self.otherLengthSet addCharactersInString:aStr];
    }
}

@end
