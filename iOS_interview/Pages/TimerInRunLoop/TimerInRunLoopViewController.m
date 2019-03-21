//
//  TimerInRunLoopViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/18.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "TimerInRunLoopViewController.h"

static NSString *cellId = @"k_timerCellId";

@interface TimerInRunLoopViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TimerInRunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
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
        
    [self.containerView addSubview:self.tableView];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
}

- (void)initData {
    [super initData];
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
    // 苹果加的是默认的模式NSDefaultRunLoopMode，
    // 当滑动tableview的时候runloop将会切换到UITrackingRunLoopMode，切换了模式，当然不工作了。因为你是默认的不是托拽的。
//    [runLoop addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
    // 改为NSRunLoopCommonModes模式，timer在tableView滑动的时候就能继续运行了
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId
                                                            forIndexPath:indexPath];
    
    NSString *prefixStr = @"Cell_";
    NSString *countStr = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@%@", prefixStr, countStr];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Getters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                style:UITableViewStylePlain];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        [_tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:cellId];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"timer运行中");
        }];
    }
    return _timer;
}
@end
