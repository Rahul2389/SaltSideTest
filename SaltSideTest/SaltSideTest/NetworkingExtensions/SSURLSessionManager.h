//
//  SSURLSessionManager.h
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface SSURLSessionManager : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)downloadFile:(NSString*)fileName
   completionHandler:(void (^)(NSString* fileName, NSURL *filePath, NSError *error))completionHandler;

@end
