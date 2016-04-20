//
//  ViewController.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "ListViewController.h"

#import "DetailViewController.h"

// Network Imports
#import "AFNetworkReachabilityManager+Extras.h"
#import "SSURLSessionManager.h"

// Cateogires
#import "NSArray+JSON.h"

//Utils
#import "Constants.h"
#import "ListParser.h"
#import "UIUtility.h"

//Views
#import "ListViewCell.h"

//Models
#import "ItemData.h"

@interface ListViewController ()

@property (strong) NSMutableArray* itemListArray;

@end

@implementation ListViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.itemListArray = [NSMutableArray array];
    self.tableView.separatorColor = [UIColor clearColor];
    
    [self fetchListItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:kSSItemToDetailSequeIdentifier]) {
        
        UITableViewCell* tableViewCell = (UITableViewCell *)sender;
        NSIndexPath* indexPath = [self.tableView indexPathForCell:tableViewCell];
        
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.itemData = [self.itemListArray objectAtIndex:indexPath.row];
    }
}

#pragma mark - Button Actions

- (IBAction)refreshButtonAction:(id)sender {
    if(self.itemListArray.count == 0){
        [self fetchListItems];
    }
}

#pragma mark - Data Fetching Methods

- (void)fetchListItems{
    ListViewController * __weak weakSelf = self;
    
    [AFNetworkReachabilityManager isNetworkAvailable:^(bool isAvailable) {
        
        if (isAvailable) {
            
            [UIUtility setNetworkActivityIndicator:YES];
            [UIUtility addActivityIndicatorViewOnView:self.view
                                               ofSize:CGSizeMake(96, 64)];
            
            [[SSURLSessionManager sharedClient] downloadFile:kSSItemListJsonFileURL
                                           completionHandler:^(NSString* fileName,
                                                               NSURL *filePath,
                                                               NSError* error){
                                               
               [UIUtility setNetworkActivityIndicator:NO];
               [UIUtility removeActivityIndicatorViewFromView:self.view];
               
               if(error){
                   [UIUtility showAlertViewWithTitle:@"Error Retrieving Items"
                                             message:[error localizedDescription]];
               }else{
                   NSLog(@"File downloaded to: %@", filePath);

                   NSArray* litemListArray =
                   [NSArray arrayWithContentsOfJSONFilePath:filePath];
                   
                   NSLog(@"ItemList: %@", litemListArray);
                   
                   weakSelf.itemListArray = [ListParser parseJsonArray:litemListArray];
                   weakSelf.tableView.separatorColor = [UIColor lightGrayColor];
                   [weakSelf.tableView reloadData];
               }
            }];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListCellIdentifier";
    ListViewCell *cell =
    (ListViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                   forIndexPath:indexPath];
    
    ItemData* itemData = [self.itemListArray objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = itemData.title;
    cell.descriptionLabel.text = itemData.itemDescription;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // do nothing
}

@end
