//
//  ATRItemStore.h
//  HomePwner
//
//  Created by Leonard Bogdonoff on 10/22/14.
//  Copyright (c) 2014 New Public Art Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ATRItem;

@interface ATRItemStore : NSObject


@property (nonatomic, readonly, copy) NSArray *allItems;
// Notice that this is a class method and prefixed with + insead of a -

+ (instancetype)sharedStore;

- (ATRItem *)createItem;

- (BOOL)saveChanges;

- (void)removeItem:(ATRItem *)item;

- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;

@end
