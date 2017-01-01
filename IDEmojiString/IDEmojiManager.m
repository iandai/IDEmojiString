//
//  IDEmojiManager.m
//  IDEmojiString
//
//  Created by Ian on 2016/12/28.
//  Copyright © 2016 iandai. All rights reserved.
//

#import "IDEmojiManager.h"
#import "IDCharacterSet.h"
#import "NSString+CharacterRange.h"

@interface IDEmojiManager()
@property (nonatomic, strong) IDCharacterSet *emojiCharacterSet;
@end

@implementation IDEmojiManager

- (instancetype)init {

    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.emojiCharacterSet = [[IDCharacterSet alloc] init];
    
    // emoji.plist extracted from http://unicode.org/Public/emoji/4.0/emoji-test.txt
    // which is the best definition of the full set is in the emoji-test.txt file, indicated in
    // http://www.unicode.org/reports/tr51/#Identification
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"emoji" ofType:@"plist"];
    NSArray *emojiArr = [NSArray arrayWithContentsOfFile:plistPath];
    for (NSString *emoji in emojiArr) {
        [self.emojiCharacterSet addComposedCharactersInString:emoji];
    }

    return self;
}

- (BOOL)containEmojiInString:(NSString *)aStr {
    
    __block BOOL containEmoji = NO;
    
    [aStr enumerateSubstringsInRange:NSMakeRange(0, [aStr length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              // rangeOfCharacterFromSet can not handle following situation:
                              // NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
                              // [set addCharactersInString:@"2️⃣"];
                              // BOOL result = [@"2" rangeOfCharacterFromSet:set].location != NSNotFound;
                              // result will be NO
                              // @"2"  => 0032
                              // @"2️⃣" => 0032 FE0F 20E3
                              if ([substring rangeOfComposedCharacterFromSet:self.emojiCharacterSet].location != NSNotFound) {
                                  *stop = YES;
                                  containEmoji = YES;
                              }
                          }];
    
    return containEmoji;
}

- (NSString *)removeEmojiFromString:(NSString *)aStr {
    
    __block NSMutableString *buffer = [NSMutableString stringWithCapacity:[aStr length]];
    
    [aStr enumerateSubstringsInRange:NSMakeRange(0, [aStr length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring rangeOfComposedCharacterFromSet:self.emojiCharacterSet].location == NSNotFound) {
                                  [buffer appendString:substring];
                              }
                          }];

    return buffer;
}

@end
