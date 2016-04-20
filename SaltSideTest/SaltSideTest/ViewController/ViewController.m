//
//  ViewController.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "ViewController.h"

// Network Imports
#import "AFNetworkReachabilityManager+Extras.h"
#import "SSURLSessionManager.h"

//Utils
#import "Constants.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self fetchListItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Fetching Methods

- (void)fetchListItems{
    [AFNetworkReachabilityManager isNetworkAvailable:^(bool isAvailable) {
        
        if (isAvailable) {
            
            [[SSURLSessionManager sharedClient] downloadFile:kSSItemListJsonFileURL
                                           completionHandler:^(NSString* fileName,
                                                               NSURL *filePath,
                                                               NSError* error){
               if(error){
                   NSLog(@"Error Retrieving Items");
               }else{
                   NSLog(@"File downloaded to: %@", filePath);
               }
               
            }];
        }
    }];
}

@end
