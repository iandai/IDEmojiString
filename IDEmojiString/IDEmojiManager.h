//
//  IDEmojiManager.h
//  IDEmojiString
//
//  Created by Ian on 2016/12/28.
//  Copyright © 2016 iandai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDEmojiManager : NSObject

- (BOOL)containEmojiInString:(NSString *)aStr;

- (NSString *)removeEmojiFromString:(NSString *)aStr;

@end
