
//
//  GCDDemoViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/30.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "GCDDemoViewController.h"
#import "GCDDemoViewController+TestFunc.h"

typedef NS_ENUM(NSInteger, GCDDemoType) {
    // enum like: MyEnumTypeA = 0,
    GCDDemoTypeUnKnow = 0,
    GCDDemoTypeSyncAndConcurrent,
    GCDDemoTypeAsyncAndConcurrent,
    GCDDemoTypeSyncAndSerial,
    GCDDemoTypeAsyncAndSerial,
    GCDDemoTypeSyncAndMainQueue,
    GCDDemoTypeAsyncAndMainQueue,
    GCDDemoTypeGroupAndSync,
    GCDDemoTypeGroupAndAsync,
};

static NSString *const kGCDDemoCellId = @"kGCDDemoCellId";

@interface GCDDemoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation GCDDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Override
- (void)setupSubUI {
    [super setupSubUI];
    
    [self.containerView addSubview:self.tableView];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
}

- (void)initData {
    self.dataSource = @[@{
                            @"title": @"同步执行 + 并发队列",
                            @"type": [NSNumber numberWithInteger:GCDDemoTypeSyncAndConcurrent]
                            },
                        @{
                            @"title": @"异步执行 + 并发队列",
                            @"type": [NSNumber numberWithInteger:GCDDemoTypeAsyncAndConcurrent]
                            },
                        @{
                            @"title": @"同步执行 + 串行队列",
                            @"type": [NSNumber numberWithInteger:GCDDemoTypeSyncAndSerial]
                            },
                        @{
                            @"title": @"异步执行 + 串行队列",
                            @"type": [NSNumber numberWithInteger:GCDDemoTypeAsyncAndSerial]
                            },
                        @{
                            @"title": @"同步执行 + 主队列 + 子线程",
                            @"type": [NSNumber numberWithInteger:GCDDemoTypeSyncAndMainQueue]
                            },
                        @{
                            @"title": @"异步执行 + 主队列",
                            @"type": [NSNumber numberWithInteger:GCDDemoTypeAsyncAndMainQueue]
                            },
                        @{
                            @"title": @"GCD Group + 同步耗时操作",
                            @"type": [NSNumber numberWithInteger:GCDDemoTypeGroupAndSync]
                            },
                        @{
                            @"title": @"GCD Group + 异步耗时操作",
                            @"type": [NSNumber numberWithInteger:GCDDemoTypeGroupAndAsync]
                            }];
    
    [self.tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kGCDDemoCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kGCDDemoCellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *dict = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = dict[@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = [self.dataSource objectAtIndex:indexPath.row];
    NSInteger type = [[dict objectForKey:@"type"] integerValue];
    
    switch (type) {
        case GCDDemoTypeSyncAndConcurrent:
            [self testGcdSyncAndConcurrent];
            break;
        case GCDDemoTypeAsyncAndConcurrent:
            [self testGcdAsyncAndConcurrent];
            break;
        case GCDDemoTypeSyncAndSerial:
            [self testGcdSyncAndSerial];
            break;
        case GCDDemoTypeAsyncAndSerial:
            [self testGcdAsyncAndSerial];
            break;
        case GCDDemoTypeSyncAndMainQueue:
            [NSThread detachNewThreadSelector:@selector(testGcdSyncAndMainQueueInSubThread)
                                     toTarget:self
                                   withObject:nil];
            break;
        case GCDDemoTypeAsyncAndMainQueue:
            [self testGcdAsyncAndMainQueue];
            break;
        case GCDDemoTypeGroupAndSync:
            [self testGcdGroupAndSync];
            break;
        case GCDDemoTypeGroupAndAsync:
            [self testGcdGroupAndAsync];
            break;
        default:
            break;
    }
}



#pragma mark - Getters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSArray alloc] init];
    }
    return _dataSource;
}
@end
