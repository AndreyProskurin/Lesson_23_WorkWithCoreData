//
//  ReportViewController.m
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "ReportViewController.h"
#import "ReportModel.h"
#import "ReportView.h"
#import "ReportModuleProtocol.h"
#import "NominationViewController.h"

@interface ReportViewController () <ReportModelOutput, ReportViewInput, UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) ReportModel *model;
@property (weak, nonatomic) IBOutlet ReportView *contentView;

@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];

}

#pragma mark - lazy init

- (ReportModel *)model {
    if (!_model)
        _model = [[ReportModel alloc] init];
    return _model;
}

#pragma mark - private methods

- (void)setup {
    self.model.modelOutput = self;
    self.contentView.userInterfaceInput = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const cellIdentifier = @"reportCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // config
}

//#pragma mark - navigation
//
//- (void)showNominationsScreen {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    NominationViewController *nominationVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([NominationViewController class])];
//    [self.navigationController pushViewController:nominationVC animated:YES];
//}

@end
