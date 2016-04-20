//
//  NSArray+JSON.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "NSArray+JSON.h"

@implementation NSArray (JSON)

+ (NSArray*)arrayWithContentsOfJSONFilePath:(NSURL*)filePath{
    NSData* data = [NSData dataWithContentsOfURL:filePath];
    NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions
                                                  error:&error];
    if (error != nil) return nil;
    return result;
}

@end
