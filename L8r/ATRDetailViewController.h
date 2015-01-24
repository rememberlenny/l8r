//
//  ATRDetailViewController.h
//  HomePwner
//
//  Created by Leonard Bogdonoff on 10/23/14.
//  Copyright (c) 2014 New Public Art Foundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATRItem;

@interface ATRDetailViewController : UIViewController

@property (nonatomic, strong) ATRItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);

- (instancetype)initForNewItem:(BOOL)isNew;

@end


