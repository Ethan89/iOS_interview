//
//  DynamicBindingDemoViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/19.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "DynamicBindingDemoViewController.h"
#import "DBDemoCell.h"
#import <objc/runtime.h>

static NSString *const demoCellId = @"kDynamicBindingDemoCellID";
static void *const deleteBtnKey = @"kDynamicBindingDemoCellDeleteBtnKey";

@interface DynamicBindingDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation DynamicBindingDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Override
- (void)setupSubUI {
    [super setupSubUI];
    
    [self.view addSubview:self.tableView];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
}

- (void)initData {
    for (NSInteger i = 0; i < 100; i++) {
        [self.dataSource addObject:[NSString stringWithFormat:@"%ld", i]];
    }
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DBDemoCell *cell = [tableView dequeueReusableCellWithIdentifier:demoCellId
                                                       forIndexPath:indexPath];
    cell.infoLabel.text = [NSString stringWithFormat:@"Hello,Hello,Hello,Hello,Hello,Hello,This is a test demo cell_%@", self.dataSource[indexPath.row]];
    
    objc_setAssociatedObject(cell.deleteBtn, deleteBtnKey, indexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [cell.deleteBtn addTarget:self
                       action:@selector(cellDeleteBtnClick:)
             forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

#pragma mark - Actions
- (void)cellDeleteBtnClick:(id)sender {
    
    NSIndexPath *indexPath = objc_getAssociatedObject(sender, deleteBtnKey);
    [self.dataSource removeObjectAtIndex:indexPath.row];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [self.tableView reloadData];
    }];
    
    [self.tableView beginUpdates];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationRight];
    
    [self.tableView endUpdates];
    
    [CATransaction commit];
}

#pragma mark - Getters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        
        [_tableView registerClass:[DBDemoCell class] forCellReuseIdentifier:demoCellId];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}
@end
