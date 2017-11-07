//
//  DataManager.m
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "DataManager.h"

@interface DataManager ()

@property (nonatomic, strong) NSPersistentContainer *persistentContainer;

@end

@implementation DataManager

+ (id)storage
{
    static DataManager *dataStorage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataStorage = [[self alloc] init];
    });
    return dataStorage;
}

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ReportsModel"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    return _persistentContainer;
}

#pragma mark - CoreData NSManagedObjectContext

- (void)saveContext
{
    NSError *error = nil;
    if (self.context != nil)
    {
        if ([self.context hasChanges] && ![self.context save:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSManagedObjectContext *)context
{
    return self.persistentContainer.viewContext;
}

@end
