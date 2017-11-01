//
//  NominationView.h
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NominationModuleProtocol.h"

@interface NominationView : UIView <NominationViewOutput>

@property (weak, nonatomic) id <NominationViewInput> userInterfaceInput;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
