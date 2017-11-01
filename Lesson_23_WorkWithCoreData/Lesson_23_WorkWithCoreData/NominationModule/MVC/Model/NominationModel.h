//
//  NominationModel.h
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NominationModuleProtocol.h"

@interface NominationModel : NSObject <NominationModelInput>

@property (nonatomic, weak) id <NominationModelOutput> modelOutput;

@end
