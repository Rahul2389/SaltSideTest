//
//  NSArray+JSON.h
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JSON)

+ (NSArray*)arrayWithContentsOfJSONFilePath:(NSURL*)filePath;

@end
