//
//  UILabel+Extras.h
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extras)

+ (CGSize)sizeToFitForconstrainedSize:(CGSize)constrainedSize
                                 text:(NSString*)text
                                 font:(UIFont*)font
                              options:(NSStringDrawingOptions)options;

@end
