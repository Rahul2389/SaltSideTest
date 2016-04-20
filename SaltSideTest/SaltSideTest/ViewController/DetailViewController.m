//
//  DetailViewController.m
//  SaltSideTest
//
//  Created by Rahul on 4/20/16.
//  Copyright © 2016 SaltSide. All rights reserved.
//

#import "DetailViewController.h"

#import "UIUtility.h"
#import "UIImageView+AFNetworking.h"
#import "UILabel+Extras.h"
#import "UIImage+Manipulate.h"

@implementation DetailViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.titleLabel.text = self.itemData.title;
    self.descriptionLabel.text = self.itemData.itemDescription;
    
    [self resizeDescriptionLabel];
    
    [self downloadImage];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationItem setTitle:@"Item Detail"];
}

#pragma mark - Image Download Method

- (void)downloadImage{
    
    [UIUtility setNetworkActivityIndicator:YES];
    [UIUtility addActivityIndicatorViewOnView:self.imageView
                                       ofSize:CGSizeZero];
    
    NSURL *URL = [NSURL URLWithString:self.itemData.imageUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    DetailViewController * __weak weakSelf = self;
    UIImage* placeHolderImage = [UIImage imageNamed:@"PlaceHolder"];
    
    [self.imageView setImageWithURLRequest:request
                          placeholderImage:placeHolderImage
                                   success:^(NSURLRequest *request,
                                             NSHTTPURLResponse * _Nullable response,
                                             UIImage *image)
     {
         
         [UIUtility setNetworkActivityIndicator:NO];
         [UIUtility removeActivityIndicatorViewFromView:weakSelf.imageView];
         
         CGSize resizedSize =
         [self resizedSizeForImageSize:image.size];
         
         if (image.size.width == resizedSize.width &&
             image.size.height == resizedSize.height) {
             weakSelf.imageView.image = image;
         }else{
             weakSelf.imageView.image =
             [weakSelf.imageView.image resizedImageForSize:resizedSize];
         }
         
         [weakSelf adjustImageViewConstraints:[weakSelf.imageView constraints]
                                       toSize:resizedSize];
     }
     failure:^(NSURLRequest *request,
                 NSHTTPURLResponse * _Nullable response,
                 NSError *error){
           
           [UIUtility setNetworkActivityIndicator:NO];
           [UIUtility removeActivityIndicatorViewFromView:weakSelf.imageView];
     }];
}


#pragma mark - Utility Methods

- (void)resizeDescriptionLabel{
    NSStringDrawingOptions options =
    NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize descriptionLabelSize =
    [UILabel sizeToFitForconstrainedSize:CGSizeMake(self.descriptionLabel.frame.size.width,
                                                    256)
                                    text:self.descriptionLabel.text
                                    font:self.descriptionLabel.font
                                 options:options];
    
    for (NSLayoutConstraint* constraint in [self.descriptionLabel constraints]){
        if (constraint.firstAttribute == NSLayoutAttributeHeight ||
            constraint.secondAttribute == NSLayoutAttributeHeight){
            constraint.constant = descriptionLabelSize.height;
            break;
        }
    }
}

- (void)adjustImageViewConstraints:(NSArray*)constraints
                            toSize:(CGSize)resizedSize{
    for (NSLayoutConstraint* constraint in constraints){
        if (constraint.firstAttribute == NSLayoutAttributeWidth ||
            constraint.secondAttribute == NSLayoutAttributeWidth){
            constraint.constant = resizedSize.width;
            break;
        }
    }
    
    for (NSLayoutConstraint* constraint in constraints){
        if (constraint.firstAttribute == NSLayoutAttributeHeight ||
            constraint.secondAttribute == NSLayoutAttributeHeight){
            constraint.constant = resizedSize.height;
            break;
        }
    }
}

- (CGSize)resizedSizeForImageSize:(CGSize)imageSize
{
    CGSize actualSizeToSet = imageSize;
    CGSize availableSize =
    CGSizeMake(self.view.frame.size.width - 32,
               self.view.frame.size.height - (CGRectGetMaxY(self.descriptionLabel.frame) + 32));
    
    if (imageSize.width > availableSize.width && imageSize.height > availableSize.height) {
        if (imageSize.width > imageSize.height) {
            actualSizeToSet.width = availableSize.width;
            actualSizeToSet.height = imageSize.height * (availableSize.width/imageSize.width);
        }else{
            actualSizeToSet.height = availableSize.height;
            actualSizeToSet.width = imageSize.width * (availableSize.height/imageSize.height);
        }
    }
    else if (imageSize.width > availableSize.width && imageSize.height < availableSize.height) {
        actualSizeToSet.width = availableSize.width;
        actualSizeToSet.height = imageSize.height * (availableSize.width/imageSize.width);
    }else if (imageSize.height > availableSize.height && imageSize.width < availableSize.width) {
        actualSizeToSet.height = availableSize.height;
        actualSizeToSet.width = imageSize.width * (availableSize.height/imageSize.height);
    }
    return actualSizeToSet;
}

@end
