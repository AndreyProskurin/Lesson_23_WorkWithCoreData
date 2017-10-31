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

- (Report *)createReport {
    return nil;
}
- (NSArray *)allReports {
    return nil;
}

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
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ReportModel"];
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

- (NSManagedObjectContext*)context
{
    return self.persistentContainer.viewContext;
}

@end
