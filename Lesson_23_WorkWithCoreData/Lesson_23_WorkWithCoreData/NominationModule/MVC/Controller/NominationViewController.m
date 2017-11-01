//
//  NominationViewController.m
//  Lesson_23_WorkWithCoreData
//
//  Created by Andrey Proskurin on 31.10.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "NominationViewController.h"
#import "NominationModel.h"
#import "NominationView.h"
#import "NominationModuleProtocol.h"

@interface NominationViewController () <NominationModelOutput, NominationViewInput, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NominationModel *model;
@property (nonatomic, weak) IBOutlet NominationView *contentView;

@end

@implementation NominationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
}

#pragma mark - Lazy init

- (NominationModel *)model {
    if (!_model)
        _model = [[NominationModel alloc] init];
    return _model;
}

#pragma mark - Private methods

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
    static NSString *const cellIdentifier = @"nominationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // config
}



@end
