//
//  DataManager+Storage.h
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 03.11.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "DataManager.h"

@class Report, Nomination;

@interface DataManager (Storage)

- (Report *)createReport;
//- (Report *)createReportWithName:(NSString *)name;
- (void)removeReport:(Report *)report;

- (NSArray *)allReports;

@end
