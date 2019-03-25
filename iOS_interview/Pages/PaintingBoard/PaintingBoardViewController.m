
//
//  PaintingBoardViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/21.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "PaintingBoardViewController.h"
#import "UnknowBoardView.h"
#import "PaintingBoardView.h"
#import "ShapeLayerBoardView.h"
#import "DirtyRectangleBoardView.h"
#import "DirtyRectangleOptimizeView.h"

@interface PaintingBoardViewController ()

@property (nonatomic, strong) UIView *paintingBoardView;

@end

@implementation PaintingBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    kPrintMainThread;
    kPrintCurrentThread;
    
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
    
    switch (self.type) {
        case PaintingBoardTypeBezierPath:
            self.paintingBoardView = [[PaintingBoardView alloc] init];
            break;
        case PaintingBoardTypeShapeLayer:
            self.paintingBoardView = [[ShapeLayerBoardView alloc] init];
            break;
        case PaintingBoardTypeDirtyRectangle:
            self.paintingBoardView = [[DirtyRectangleBoardView alloc] init];
            break;
        case PaintingBoardTypeDirtyRectangleOptimize:
            self.paintingBoardView = [[DirtyRectangleOptimizeView alloc] init];
            break;
        default:
            self.paintingBoardView = [[UnknowBoardView alloc] init];
            break;
    }
    
    [self.containerView addSubview:self.paintingBoardView];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.paintingBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
}

#pragma mark - Getters
@end
