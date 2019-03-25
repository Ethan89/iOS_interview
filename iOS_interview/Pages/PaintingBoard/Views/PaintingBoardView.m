//
//  PaintingBoardView.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/21.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "PaintingBoardView.h"

@interface PaintingBoardView ()

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation PaintingBoardView

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
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor clearColor] setFill];
    [[UIColor redColor] setStroke];
    [self.path stroke];
}

#pragma mark - Private Method
- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    self.path = [[UIBezierPath alloc] init];
    self.path.lineJoinStyle = kCGLineJoinRound;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineWidth = 5;
}

#pragma mark - Responding to Touch Events
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    kPrintCurrentThread;
    
    // 获取起始位置
    CGPoint point = [[touches anyObject] locationInView:self];
    
    // 将画笔移动到起始位置
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    kPrintCurrentThread;
    
    // 获取当前位置
    CGPoint point = [[touches anyObject] locationInView:self];
    
    // 绘制一条线，起始位置为上一个节点，结束位置为当前节点
    [self.path addLineToPoint:point];
    
    // 刷新页面
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}
@end
