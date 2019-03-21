//
//  BaseViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/18.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.hasLayoutUI) {
        [self layoutSubUI];
        self.hasLayoutUI = YES;
    }
    
    if (!self.hasInitData) {
        [self initData];
        self.hasInitData = YES;
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

#pragma mark - Public Method
- (void)setupSubUI {
    
    [self.view addSubview:self.containerView];
}

- (void)layoutSubUI {
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        } else {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view);
            make.bottom.equalTo(self.view);
            make.right.equalTo(self.view);
        }
    }];
}

- (void)initData {
    // 在子类中重写该方法初始化数据
}

#pragma mark - Getters
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}

@end
