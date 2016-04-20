//
//  UILabel+Extras.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "UILabel+Extras.h"

@implementation UILabel (Extras)

+ (CGSize)sizeToFitForconstrainedSize:(CGSize)constrainedSize
                                 text:(NSString*)text
                                 font:(UIFont*)font
                              options:(NSStringDrawingOptions)options {
    if (text) {
        NSAttributedString *attributedText =
        [[NSAttributedString alloc] initWithString:text
                                        attributes:@{NSFontAttributeName: font}];
        
        CGRect rect =
        [attributedText boundingRectWithSize:CGSizeMake(constrainedSize.width, constrainedSize.height)
                                     options:options
                                     context:nil];
        CGSize size = rect.size;
        size.width  = ceilf(size.width);
        size.height = ceilf(size.height);
        return size;
    }
    return CGSizeZero;
}

@end
