//
//  NSString+Manipulate.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "NSString+Manipulate.h"

@implementation NSString (Manipulate)

- (NSString*)firstLetterCapitalizedString{
    NSString* stringToReturn = self;
    if (self.length > 2) {
        stringToReturn = [self stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                       withString:[[self substringToIndex:1] uppercaseString]];
    }
    return stringToReturn;
}

@end
