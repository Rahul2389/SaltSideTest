//
//  UIUtility.h
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIUtility : NSObject

+ (void)setNetworkActivityIndicator:(BOOL)show;

+(void)addActivityIndicatorViewOnView:(UIView*)view
                               ofSize:(CGSize)size;
+ (void)removeActivityIndicatorViewFromView:(UIView*)view;

+ (void)showAlertViewWithTitle:(NSString*)title
                       message:(NSString*)msg;
@end
