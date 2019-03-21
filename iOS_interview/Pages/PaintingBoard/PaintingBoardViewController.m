
//
//  PaintingBoardViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/21.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "PaintingBoardViewController.h"
#import "PaintingBoardView.h"

@interface PaintingBoardViewController ()

@property (nonatomic, strong) PaintingBoardView *paintingBoardView;

@end

@implementation PaintingBoardViewController

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
    
    [self.containerView addSubview:self.paintingBoardView];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.paintingBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
}

#pragma mark - Getters
- (PaintingBoardView *)paintingBoardView {
    if (!_paintingBoardView) {
        _paintingBoardView = [[PaintingBoardView alloc] init];
    }
    return _paintingBoardView;
}
@end
