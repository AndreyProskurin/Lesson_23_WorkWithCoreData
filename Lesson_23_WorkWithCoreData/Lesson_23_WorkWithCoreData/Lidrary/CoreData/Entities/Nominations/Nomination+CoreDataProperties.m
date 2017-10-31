//
//  Nomination+CoreDataProperties.m
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//
//

#import "Nomination+CoreDataProperties.h"

@implementation Nomination (CoreDataProperties)

+ (NSFetchRequest<Nomination *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Nomination"];
}

@dynamic name;
@dynamic type;
@dynamic report;

@end
