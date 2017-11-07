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
#import "DataManager.h"
#import "Report+CoreDataProperties.h" // для ...

static NSInteger const numberOfSectionsInTableView = 1;

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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Edit"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(editButtonAction:)];
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
//    [barButtonItem release];

//    [barButtonItem addTarget:self action:@selector(editButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    [self.model needToReloadData];
}

-(IBAction)editButtonAction:(id)sender {
    [self.contentView.tableView setEditing:!self.contentView.tableView.editing animated:YES];
    
    if (self.contentView.tableView.editing)
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    else
        [self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return numberOfSectionsInTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model reportsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const cellIdentifier = @"reportCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Report *report = [self.model reportAtIndex:indexPath.row];
    cell.textLabel.text = report.name;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if ([self.model respondsToSelector:@selector(deleteReportAtIndex:)]) {
            NSLog(@"UITableViewCellEditingStyleDelete");
            [self.model deleteReportAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"UITableViewCellEditingStyleInsert");
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self showNominationsScreen];
}

#pragma mark - Report View Input Protocol

- (void)addReportButtonWasTapped {
    [self.model createNewTestReport];
}

#pragma mark - Report Model Output Protocol

- (void)dataDidReload {
    [self.contentView.tableView reloadData]; // перезапись таблицы
}

#pragma mark - navigation

//- (void)showNominationsScreen {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    NSString *viewControllerID = NSStringFromClass([NominationViewController class]);
//    NominationViewController *nominationVC = [storyboard instantiateViewControllerWithIdentifier:viewControllerID];
//    [self.navigationController pushViewController:nominationVC animated:YES];
//}

@end
