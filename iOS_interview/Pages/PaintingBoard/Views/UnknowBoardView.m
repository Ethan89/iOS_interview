
//
//  UnknowBoardView.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/22.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "UnknowBoardView.h"

@interface UnknowBoardView ()

@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation UnknowBoardView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Private Method
- (void)setup {
    [self addSubview:self.tipsLabel];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(100.f);
        make.center.equalTo(self);
    }];
}

#pragma mark - Getters
- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [UILabel generateLabelWithFont:[UIFont systemFontOfSize:14.f]
                                          textColor:[UIColor blackColor]
                                          textAlign:NSTextAlignmentCenter];
        _tipsLabel.text = NSLocalizedString(@"InvalidPaintingBoardType", nil);
    }
    return _tipsLabel;
}
@end
