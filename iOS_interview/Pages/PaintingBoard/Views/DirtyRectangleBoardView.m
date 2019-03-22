//
//  DirtyRectangleBoardView.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/22.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "DirtyRectangleBoardView.h"

static CGFloat const BRUSH_SIZE = 20.f;

@interface DirtyRectangleBoardView ()

@property (nonatomic, strong) NSMutableArray *strokes;

@end

@implementation DirtyRectangleBoardView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.backgroundColor = UIColorFromHex(0x3A3B33);
        [self cleanStrokes];
    }
    return self;
}

#pragma mark - Private Method
- (void)cleanStrokes {
    [self.strokes removeAllObjects];
}

- (void)addBrushStrokeAtPoint:(CGPoint)point {
    // 保存point
    [self.strokes addObject:[NSValue valueWithCGPoint:point]];
    
    // 刷新绘制
    [self setNeedsDisplay];
}

#pragma mark - Override
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取起始点
    CGPoint point = [[touches anyObject] locationInView:self];
    [self addBrushStrokeAtPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    [self addBrushStrokeAtPoint:point];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (NSValue *value in self.strokes) {
        // 获取点位坐标
        CGPoint point = [value CGPointValue];
        //get brush rect
        CGRect brushRect = CGRectMake(point.x - BRUSH_SIZE/2, point.y - BRUSH_SIZE/2, BRUSH_SIZE, BRUSH_SIZE);
        //draw brush stroke
        [[UIImage imageNamed:@"brush"] drawInRect:brushRect];
    }
}

#pragma mark - Getters
- (NSMutableArray *)strokes {
    if (!_strokes) {
        _strokes = [NSMutableArray arrayWithCapacity:0];
    }
    return _strokes;
}
@end
