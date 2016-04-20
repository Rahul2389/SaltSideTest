//
//  ListParser.h
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListParser : NSObject

+ (NSMutableArray*)parseJsonArray:(NSArray*)litemListArray;

@end
