//
//  AFNetworkReachabilityManager+Extras.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "AFNetworkReachabilityManager+Extras.h"
#import "UIUtility.h"

@implementation AFNetworkReachabilityManager (Extras)

+ (void)isNetworkAvailable:(void (^)(bool isAvailable))success{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusReachableViaWiFi ||
            status == AFNetworkReachabilityStatusReachableViaWWAN) {
            success(YES);
        }else{
            [UIUtility showAlertViewWithTitle:@"No Network Available"
                                      message:@"Please check your internet connection"];
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

@end
