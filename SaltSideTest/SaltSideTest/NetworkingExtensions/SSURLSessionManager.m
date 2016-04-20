//
//  SSURLSessionManager.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "SSURLSessionManager.h"

@implementation SSURLSessionManager

+ (instancetype)sharedClient {
    static SSURLSessionManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sharedClient = [[SSURLSessionManager alloc] initWithSessionConfiguration:configuration];
    });
    
    return _sharedClient;
}

- (void)downloadFile:(NSString*)fileName
   completionHandler:(void (^)(NSString* fileName, NSURL *filePath, NSError *error))completionHandler{
    
    SSURLSessionManager *manager = [SSURLSessionManager sharedClient];
    NSURL *URL = [NSURL URLWithString:fileName];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask =
    [manager downloadTaskWithRequest:request
                            progress:nil
                         destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                             
                             NSURL *documentsDirectoryURL =
                             [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                    inDomain:NSUserDomainMask
                                                           appropriateForURL:nil
                                                                      create:NO
                                                                       error:nil];
                             
                             return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
                             
                         } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                             
                             completionHandler(fileName, filePath, error);
                         }];
    
    [downloadTask resume];
}

@end
