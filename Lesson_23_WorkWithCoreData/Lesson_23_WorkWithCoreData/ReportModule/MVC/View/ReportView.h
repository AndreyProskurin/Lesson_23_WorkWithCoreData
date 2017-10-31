//
//  ReportView.h
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportModuleProtocol.h"

@interface ReportView : UIView <ReportViewOutput>

@property (nonatomic, weak) id <ReportViewInput> userInterfaceInput;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
