//
//  ListParser.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "ListParser.h"

#import "ItemData.h"
#import "NSDictionary+SSJsonData.h"
#import "NSString+Manipulate.h"

@implementation ListParser

+ (NSMutableArray*)parseJsonArray:(NSArray*)litemListArray{
    
    NSMutableArray* itemListArray = [NSMutableArray array];
    
    for (NSDictionary* dict in litemListArray) {
        ItemData* itemData = [[ItemData alloc] init];
        itemData.title = [[dict title] firstLetterCapitalizedString];
        itemData.itemDescription = [[dict description] firstLetterCapitalizedString];
        itemData.imageUrl = [dict imageURL];
        [itemListArray addObject:itemData];
    }
    return itemListArray;
}

@end
