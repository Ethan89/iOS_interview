//
//  RootViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/18.
//  Copyright © 2019 ethan. All rights reserved.
//

static NSString *const cellId = @"k_rootCellId";

#import "RootViewController.h"
#import "PaintingBoardViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation RootViewController

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

- (void)setupSubUI {
    [super setupSubUI];
    
    self.title = @"Demo";
    
    [self.containerView addSubview:self.tableView];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
}

- (void)initData {
    
    NSArray *tmp = @[
                     @{
                         @"title": NSLocalizedString(@"RunLoop", nil),
                         @"subTitle": NSLocalizedString(@"RunLoopDesc", nil),
                         @"className": @"TimerInRunLoopViewController"
                         },
                     @{
                         @"title": NSLocalizedString(@"LowestCommonAncestorView", nil),
                         @"subTitle": NSLocalizedString(@"LowestCommonAncestorViewDesc", nil),
                         @"className": @"LowestCommonAncestorViewController"
                         },
                     @{
                         @"title": NSLocalizedString(@"ObjectCopy", nil),
                         @"subTitle": NSLocalizedString(@"ObjectCopyDesc", nil),
                         @"className": @"CustomObjectCopyViewController"
                         },
                     @{
                         @"title": NSLocalizedString(@"DynamicBinding", nil),
                         @"subTitle": NSLocalizedString(@"DynamicBindingDesc", nil),
                         @"className": @"DynamicBindingDemoViewController"
                         },
                     @{
                         @"title": NSLocalizedString(@"Category", nil),
                         @"subTitle": NSLocalizedString(@"CategoryDesc", nil),
                         @"className": @"CategoryViewController"
                         },
                     @{
                         @"title": NSLocalizedString(@"PaintingBoard", nil),
                         @"subTitle": NSLocalizedString(@"PaintingBoardDesc", nil),
                         @"className": @"PaintingBoardViewController",
                         @"type": [NSNumber numberWithInteger:1]
                         },
                     @{
                         @"title": NSLocalizedString(@"ShapeLayerBoard", nil),
                         @"subTitle": NSLocalizedString(@"ShapeLayerBoardDesc", nil),
                         @"className": @"PaintingBoardViewController",
                         @"type": [NSNumber numberWithInteger:2]
                         },
                     @{
                         @"title": NSLocalizedString(@"DirtyRectangle", nil),
                         @"subTitle": NSLocalizedString(@"DirtyRectangleDesc", nil),
                         @"className": @"PaintingBoardViewController",
                         @"type": [NSNumber numberWithInteger:3]
                         },
                     @{
                         @"title": NSLocalizedString(@"DirtyRectangleOptimize", nil),
                         @"subTitle": NSLocalizedString(@"DirtyRectangleOptimizeDesc", nil),
                         @"className": @"PaintingBoardViewController",
                         @"type": [NSNumber numberWithInteger:4]
                         }
                     ];
    [self.dataSource addObjectsFromArray:tmp];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellId];
        cell.detailTextLabel.numberOfLines = 0;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary *dict = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"title"];
    cell.detailTextLabel.text = [dict objectForKey:@"subTitle"];
    [cell setNeedsUpdateConstraints];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = [self.dataSource objectAtIndex:indexPath.row];
    NSString *classNameStr = [dict objectForKey:@"className"];
    
    if (classNameStr == nil || classNameStr.length == 0) {
        return;
    }
    
    Class class = NSClassFromString(classNameStr);
    id next = [[class alloc] init];
    
    if ([next isKindOfClass:[UIViewController class]]) {
        ((UIViewController *)next).title = dict[@"title"];
        
        if ([next isKindOfClass:[PaintingBoardViewController class]] && dict[@"type"] != nil) {
            NSNumber *typeObj = dict[@"type"];
            PaintingBoardViewController *tmp = (PaintingBoardViewController *)next;
            tmp.type = [typeObj integerValue];
        }
        
        [self.navigationController pushViewController:next animated:YES];
    }
}

#pragma mark - Getters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44.f;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
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
