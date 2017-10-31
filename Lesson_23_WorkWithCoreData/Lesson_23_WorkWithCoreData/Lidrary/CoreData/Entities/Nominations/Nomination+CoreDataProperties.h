//
//  Nomination+CoreDataProperties.h
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//
//

#import "Nomination+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Nomination (CoreDataProperties)

+ (NSFetchRequest<Nomination *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) BOOL type;
@property (nullable, nonatomic, retain) Report *report;

@end

NS_ASSUME_NONNULL_END
