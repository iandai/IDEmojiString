//
//  NSString+CharacterRange.h
//  IDEmojiString
//
//  Created by Ian on 2016/12/31.
//  Copyright © 2016 iandai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDCharacterSet.h"

@interface NSString (CharacterRange)

- (NSRange)rangeOfComposedCharacterFromSet:(IDCharacterSet *)searchSet;
@end
