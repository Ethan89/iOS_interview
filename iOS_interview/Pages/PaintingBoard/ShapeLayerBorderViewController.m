//
//  ShapeLayerBorderViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/21.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "ShapeLayerBorderViewController.h"
#import "ShapeLayerBorderView.h"

@interface ShapeLayerBorderViewController ()

@property (nonatomic, strong) ShapeLayerBorderView *borderView;

@end

@implementation ShapeLayerBorderViewController

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
    
    [self.containerView addSubview:self.borderView];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.borderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
}

#pragma mark - Getters
- (ShapeLayerBorderView *)borderView {
    if (!_borderView) {
        _borderView = [[ShapeLayerBorderView alloc] init];
    }
    return _borderView;
}
@end
