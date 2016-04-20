//
//  NSDictionary+SSJsonData.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "NSDictionary+SSJsonData.h"

@implementation NSDictionary (SSJsonData)

- (NSString *)title
{
    NSString *titleStr = self[@"title"];
    return titleStr;
}

- (NSString *)description
{
    NSString *descriptionStr = self[@"description"];
    return descriptionStr;
}

- (NSString *)imageURL
{
    NSString *imageURLStr = self[@"image"];
    return imageURLStr;
}

@end
