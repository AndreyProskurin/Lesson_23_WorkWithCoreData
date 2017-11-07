//
//  DataManager+Storage.m
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 03.11.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "DataManager+Storage.h"
#import "Report+CoreDataProperties.h"
#import "Nomination+CoreDataProperties.h"

@implementation DataManager (Storage)

- (Report *)createReport {
    Report *report = [NSEntityDescription insertNewObjectForEntityForName:@"Report"
                                                   inManagedObjectContext:[self context]];
    report.name = @"Test Report";
    return report;
}

//- (Report *)createReportWithName:(NSString *)name {
//    Report *report = [NSEntityDescription insertNewObjectForEntityForName:@"Report"
//                                                   inManagedObjectContext:[self context]];
//    [report setValue:name forKey:@"name"];
//
//    return report;
//}

- (void)removeReport:(Report *)report {
    [[self context] deleteObject:report];
}

- (NSArray *)allReports {
    NSFetchRequest *fetchRequest = [Report fetchRequest];
    NSError *error = nil;
    
    NSArray *reportsArray = [[self context] executeFetchRequest:fetchRequest
                                                          error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return nil;
    } else {
        return reportsArray;
    }
}

@end
