//
//  NSString+CharacterRange.m
//  IDEmojiString
//
//  Created by Ian on 2016/12/31.
//  Copyright © 2016 iandai. All rights reserved.
//

#import "NSString+CharacterRange.h"

@implementation NSString (CharacterRange)

- (NSRange)rangeOfComposedCharacterFromSet:(IDCharacterSet *)searchSet {
  
    NSRange range;

    if ([self length] == 0) {
        return NSMakeRange(NSNotFound, 0);
    } else if ([self length] == 1) {
        range = [self rangeOfCharacterFromSet:searchSet.oneLengthSet];
    } else {
        range = [self rangeOfCharacterFromSet:searchSet.otherLengthSet];
    }
    
    return range;
}


@end
