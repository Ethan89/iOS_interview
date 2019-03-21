//
//  RecentParentViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/18.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "LowestCommonAncestorViewController.h"

@interface LowestCommonAncestorViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *greenView;

@property (nonatomic, strong) UIButton *lcaBtn1;
@property (nonatomic, strong) UIButton *lcaBtn2;

@end

@implementation LowestCommonAncestorViewController

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
    
    [self.containerView addSubview:self.redView];
    [self.redView addSubview:self.blueView];
    [self.redView addSubview:self.greenView];
    
    [self.containerView addSubview:self.lcaBtn1];
    [self.containerView addSubview:self.lcaBtn2];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200.f, 200.f));
        make.top.equalTo(self.containerView);
        make.centerX.equalTo(self.containerView);
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80.f, 80.f));
        make.top.left.equalTo(self.redView);
    }];
    
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80.f, 80.f));
        make.bottom.right.equalTo(self.redView);
    }];
    
    [self.lcaBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(160.f, 60.f));
        make.top.mas_equalTo(self.redView.mas_bottom).mas_offset(60.f);
        make.centerX.equalTo(self.redView);
    }];
    
    [self.lcaBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(160.f, 60.f));
        make.top.mas_equalTo(self.lcaBtn1.mas_bottom).mas_offset(10.f);
        make.centerX.equalTo(self.lcaBtn1);
    }];
}

#pragma mark - Private Method
- (NSArray *)superViews:(UIView *)view {
    if (view == nil) {
        return @[];
    }
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:0];
    while (view != nil) {
        [result addObject:view];
        view = view.superview;
    }
    
    return [result copy];
}

/**
 最近公共先祖LCA O（N^2）Solution

 @param viewA 第一个View
 @param viewB 第二个View
 */
- (UIView *)LCA_1:(UIView *)viewA andView:(UIView *)viewB {
    NSArray *arrayA = [self superViews:viewA];
    NSArray *arrayB = [self superViews:viewB];
    
    for (NSInteger ii = 0; ii < arrayA.count; ii++) {
        UIView *targetView = arrayA[ii];
        for (NSInteger jj = 0; jj < arrayB.count; jj++) {
            if (targetView == arrayB[jj]) {
                return targetView;
            }
        }
    }
    return nil;
}

- (UIView *)LCA_2:(UIView *)viewA andView:(UIView *)viewB {
    UIView *result = nil;
    
    NSArray *arrayA = [self superViews:viewA];
    NSArray *arrayB = [self superViews:viewB];
    NSInteger p1 = arrayA.count - 1;
    NSInteger p2 = arrayB.count - 1;
    while (p1 >= 0 && p2 >= 0) {
        if (arrayA[p1] == arrayB[p2]) {
            result = arrayA[p1];
        }
        p1--;
        p2--;
    }
    return result;
}

- (void)lcaON2Solution {
    UIView *lcaView = [self LCA_1:self.blueView andView:self.greenView];
    NSString *result = @"没有最近公共先祖";
    if (lcaView != nil) {
        result = [NSString stringWithFormat:@"%@", lcaView];
    }
    UIAlertController *next = [UIAlertController alertControllerWithTitle:@"结果"
                                                                  message:result
                                                           preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [next addAction:action];
    [self presentViewController:next animated:YES completion:nil];
}

- (void)lcaONSolution {
    UIView *lcaView = [self LCA_2:self.blueView andView:self.greenView];
    NSString *result = @"没有最近公共先祖";
    if (lcaView != nil) {
        result = [NSString stringWithFormat:@"%@", lcaView];
    }
    UIAlertController *next = [UIAlertController alertControllerWithTitle:@"结果"
                                                                  message:result
                                                           preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [next addAction:action];
    [self presentViewController:next animated:YES completion:nil];
}

- (UIButton *)generateBaseButton {
    UIButton *tmpBtn = [[UIButton alloc] init];
    tmpBtn.layer.cornerRadius = 4.f;
    tmpBtn.backgroundColor = kMainColor;
    [tmpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    return tmpBtn;
}

#pragma mark - Getters
- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)blueView {
    if (!_blueView) {
        _blueView = [[UIView alloc] init];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

- (UIView *)greenView {
    if (!_greenView) {
        _greenView = [[UIView alloc] init];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}

- (UIButton *)lcaBtn1 {
    if (!_lcaBtn1) {
        _lcaBtn1 = [self generateBaseButton];
        [_lcaBtn1 setTitle:@"LCA O（N^2）" forState:UIControlStateNormal];
        [_lcaBtn1 addTarget:self
                     action:@selector(lcaON2Solution)
           forControlEvents:UIControlEventTouchUpInside];
    }
    return _lcaBtn1;
}

- (UIButton *)lcaBtn2 {
    if (!_lcaBtn2) {
        _lcaBtn2 = [self generateBaseButton];
        [_lcaBtn2 setTitle:@"LCA O（N）" forState:UIControlStateNormal];
        [_lcaBtn2 addTarget:self
                     action:@selector(lcaONSolution)
           forControlEvents:UIControlEventTouchUpInside];
    }
    return _lcaBtn2;
}
@end
