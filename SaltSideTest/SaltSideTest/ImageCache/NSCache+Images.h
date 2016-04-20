//
//  NSCache+Images.h
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSCache (Images)

+ (instancetype)sharedInstance;

- (UIImage*)getImageForKey:(NSString*)key;

- (void)saveImage:(UIImage*)image
           forKey:(NSString*)key;

@end
