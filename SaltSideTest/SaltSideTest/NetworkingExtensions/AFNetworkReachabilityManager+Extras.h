//
//  AFNetworkReachabilityManager+Extras.h
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFNetworkReachabilityManager (Extras)

+ (void)isNetworkAvailable:(void (^)(bool isAvailable))success;

@end
