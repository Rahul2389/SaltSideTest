//
//  UIImage+Manipulate.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "UIImage+Manipulate.h"

@implementation UIImage (Manipulate)

- (UIImage*)resizedImageForSize:(CGSize)newSize{
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
