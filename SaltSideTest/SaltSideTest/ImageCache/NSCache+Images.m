//
//  NSCache+Images.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "NSCache+Images.h"

@implementation NSCache (Images)

+ (instancetype)sharedInstance {
    static NSCache *_sharedChache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedChache = [[NSCache alloc] init];
    });
    
    return _sharedChache;
}

- (UIImage*)getImageForKey:(NSString*)key{
    UIImage* image = nil;
    NSData* imageData =
    [[NSCache sharedInstance] objectForKey:key];
    
    if (imageData) {
        image = [UIImage imageWithData:imageData];
    }
    
    return image;
}

- (void)saveImage:(UIImage*)image
           forKey:(NSString*)key{
    NSData* imageData =
    [[NSCache sharedInstance] objectForKey:key];
    if (!imageData) {
        [[NSCache sharedInstance] setObject:UIImagePNGRepresentation(image)
                                     forKey:key];
    }
}

@end
