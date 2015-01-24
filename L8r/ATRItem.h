//
//  ATRItem.h
//  ATRRandomNumber
//
//  Created by Leonard Bogdonoff on 10/15/14.
//  Copyright (c) 2014 New Public Art Foundation. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ATRItem : NSObject <NSCoding>
{
}

@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic,readonly) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;
@property (strong, nonatomic) UIImage *thumbnail;

- (void)setThumbnailFromImage:(UIImage *)image;

+(instancetype)randomItem;

-(instancetype)initWithItemName:(NSString *) name
                 valueInDollars:(int)value
                   serialNumber:(NSString *)sNumber;

-(instancetype)initWithItemName:(NSString *)name;


@end
