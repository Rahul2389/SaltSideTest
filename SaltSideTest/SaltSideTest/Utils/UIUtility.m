//
//  UIUtility.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#define BASE_TAG                       100
#define ACTIVITY_INDICATOR_VIEW_TAG    BASE_TAG + 1

#import "UIUtility.h"

@implementation UIUtility

+ (void)setNetworkActivityIndicator:(BOOL)show{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = show;
}

+(void)addActivityIndicatorViewOnView:(UIView*)view
                               ofSize:(CGSize)size{
    if (![view viewWithTag:ACTIVITY_INDICATOR_VIEW_TAG]) {
        UIActivityIndicatorView* activityIndicatorView =
        [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        if (size.width == 0 && size.height == 0) {
            size = activityIndicatorView.frame.size;
        }
        activityIndicatorView.backgroundColor = [UIColor lightGrayColor];
        activityIndicatorView.layer.cornerRadius = 5.0;
        activityIndicatorView.frame =
        CGRectMake((view.frame.size.width - size.width)/2,
                   (view.frame.size.height - size.height)/2,
                   size.width,
                   size.height);
        activityIndicatorView.tag = ACTIVITY_INDICATOR_VIEW_TAG;
        [view addSubview:activityIndicatorView];
        [activityIndicatorView startAnimating];
    }
}

+ (void)removeActivityIndicatorViewFromView:(UIView*)view{
    UIActivityIndicatorView* indicatorView =
    (UIActivityIndicatorView*)[view viewWithTag:ACTIVITY_INDICATOR_VIEW_TAG];
    if (indicatorView) {
        [indicatorView stopAnimating];
        [indicatorView removeFromSuperview];
    }
}

+ (void)showAlertViewWithTitle:(NSString*)title
                       message:(NSString*)msg{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
