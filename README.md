# IDEmojiString

IDEmojiString is a simple tool to detect emoji in string, and also remove emoji from string.  

IDEmojiString detects an emoji by search through full emoji set loaded from emoji.plist. Emoji.plist extracted from http://unicode.org/Public/emoji/4.0/emoji-test.txt, which is the best definition of the full set indicated in http://www.unicode.org/reports/tr51/#Identification.


## Purpose

NSString's existing method ```- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet;``` only supports character set in BMP, not supplementary characters. For example:

```objective-c

NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
[set addCharactersInString:@"2️⃣"];      // keycap 2, 0032 FE0F 20E3, github seems not supporting this emoji. Check from http://www.iemoji.com/view/emoji/296/symbols/keycap-2 
[@"2" rangeOfCharacterFromSet:set];     // return value: YES, which is not reasonable 

```

Existing library does not solve emoji perfectly. [NSString+RemoveEmoji](https://github.com/woxtu/NSString-RemoveEmoji) category, which quoted by many articles, does not detect emoji such as @"⭐", and detects character such as @"Ⅶ" which is not emoji. 


## Usage

```objective-c
#import "IDEmojiManager.h"

IDEmojiManager *manager = [[IDEmojiManager alloc] init];
BOOL containsEmoji = [manager containEmojiInString:@"Some String⭐"];  // return value: YES
NSString *str = [manager removeEmojiFromString:@"Some String⭐"];      // return value: Some String

```


## Install

Use CocoaPods.

```ruby
pod 'IDEmojiString'
```


## Communication

If you found a bug, open an issue.


## License

IDEmojiString is released under the MIT license. See LICENSE for details.
