//
//  DataManager.h
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Report+CoreDataProperties.h"
#import "Nomination+CoreDataProperties.h"

@interface DataManager : NSObject

+ (id)storage;

- (Report *)createReport;
- (NSArray *)allReports;

@end
