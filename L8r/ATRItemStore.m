//
//  ATRItemStore.m
//  HomePwner
//
//  Created by Leonard Bogdonoff on 10/22/14.
//  Copyright (c) 2014 New Public Art Foundation. All rights reserved.
//

#import "ATRItem.h"
#import "ATRImageStore.h"
#import "ATRItemStore.h"

@interface ATRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation ATRItemStore

+ (instancetype)sharedStore
{
    static ATRItemStore *sharedStore;
    
    // Do I need to create a sharedStore?
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    
    // Returns YES on success
    return [NSKeyedArchiver archiveRootObject:self.privateItems
                                       toFile:path];
}

- (NSString *)itemArchivePath
{
    // Make sure that the first argument is NSDocumentDriectory
    // and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

// If a programmer calls [[ATRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[ATRItemStore sharedStore]"];
    return nil;
}
     
- (instancetype)initPrivate
{
    self = [super init];
    if(self) {
        NSString *path = [self itemArchivePath];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If the array hadn't been saved previously, create a new empty one
        if (!_privateItems){
            _privateItems = [[NSMutableArray alloc] init];
        }
    }
    
    
    return self;
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex
{
    if(fromIndex == toIndex){
        return;
    }
    
    // Get pointer to object being moved so you can re-insert it
    ATRItem *item = self.privateItems[fromIndex];
    
    // Remove item from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    // Insert item in array at new loction
    [self.privateItems insertObject:item atIndex:toIndex];
}

- (void)removeItem:(ATRItem *)item
{
    NSString *key = item.itemKey;
    
    [[ATRImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (ATRItem *)createItem
{
    ATRItem *item = [[ATRItem alloc] init];
    [self.privateItems addObject:item];
    
    return item;
}

@end
