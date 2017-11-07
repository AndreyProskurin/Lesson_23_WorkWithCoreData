//
//  ReportView.m
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "ReportView.h"

@implementation ReportView

- (IBAction)addNewReportButtonAction:(UIButton *)sender {
    if ([self.userInterfaceInput respondsToSelector:@selector(addReportButtonWasTapped)]) {
        [self.userInterfaceInput addReportButtonWasTapped];
    }
}


@end
