//
//  ReportModuleProtocol.h
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReportModelInput <NSObject>

// VC -> model (обращение к данным модели)

- (NSInteger)reportsCount;

- (id)reportAtIndex:(NSInteger)index;
- (void)deleteReportAtIndex:(NSInteger)index;

- (void)createNewTestReport;
- (void)needToReloadData;

@end

@protocol ReportModelOutput <NSObject>

// model -> VC (передача данных контроллеру)

- (void)dataDidReload;

@end

@protocol ReportViewInput <NSObject>

// view -> VC (какое-то действие юзера на view)

- (void)addReportButtonWasTapped;
//- (void)deleteReportButtonWasTapped;

@end

@protocol ReportViewOutput <NSObject>

// VC -> view (показать изменения интерфейса)


@end
