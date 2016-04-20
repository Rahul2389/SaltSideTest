//
//  AFNetworkReachabilityManager+Extras.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "AFNetworkReachabilityManager+Extras.h"

@implementation AFNetworkReachabilityManager (Extras)

+ (void)isNetworkAvailable:(void (^)(bool isAvailable))success{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusReachableViaWiFi ||
            status == AFNetworkReachabilityStatusReachableViaWWAN) {
            success(YES);
        }else{
            NSLog(@"No Network Available");
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

@end
