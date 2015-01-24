//
//  ATRImageViewController.m
//  HomePwner
//
//  Created by Leonard Bogdonoff on 10/24/14.
//  Copyright (c) 2014 New Public Art Foundation. All rights reserved.
//

#import "ATRImageViewController.h"

@implementation ATRImageViewController

- (void)loadView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.view = imageView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // We must cast the view in UIImageView so the compiler knows it
    // is okay to send it setImage
    UIImageView *imageView = (UIImageView *)self.view;
    imageView.image = self.image;
}

@end
