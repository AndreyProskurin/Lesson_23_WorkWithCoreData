//
//  Report+CoreDataProperties.m
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//
//

#import "Report+CoreDataProperties.h"

@implementation Report (CoreDataProperties)

+ (NSFetchRequest<Report *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Report"];
}

@dynamic name;
@dynamic nominations;

@end
