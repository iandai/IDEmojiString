//
//  NSCharacterSet+emojiCharacterSet.m
//  IDEmojiString
//
//  Created by Ian on 2016/12/29.
//  Copyright © 2016 iandai. All rights reserved.
//

#import "NSCharacterSet+emojiCharacterSet.h"

@implementation NSCharacterSet (emojiCharacterSet)

+ (NSCharacterSet *)emojiCharacterSet {
    
    NSMutableCharacterSet *emojiCharacterSet = [[NSMutableCharacterSet alloc] init];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"emoji" ofType:@"plist"];
    NSArray *emojiArr = [NSArray arrayWithContentsOfFile:plistPath];
    for (NSString *emoji in emojiArr) {
        [emojiCharacterSet addCharactersInString:emoji];
    }
    
    return emojiCharacterSet;
}

@end
