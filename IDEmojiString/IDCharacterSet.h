//
//  IDCharacterSet.h
//  IDEmojiString
//
//  Created by Ian on 2016/12/31.
//  Copyright © 2016 iandai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDCharacterSet : NSObject

@property (nonatomic, strong) NSMutableCharacterSet *oneLengthSet;
@property (nonatomic, strong) NSMutableCharacterSet *otherLengthSet;

- (void)addComposedCharactersInString:(NSString *)aString;

@end
