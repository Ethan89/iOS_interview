//
//  DirtyRectangleOptimizeView.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/22.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "DirtyRectangleOptimizeView.h"

static CGFloat const BRUSH_SIZE = 20.f;

@interface DirtyRectangleOptimizeView ()

@property (nonatomic, strong) NSMutableArray *strokes;

@end

@implementation DirtyRectangleOptimizeView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Private Method
- (void)setup {
    self.backgroundColor = UIColorFromHex(0x3A3B33);
    [self.strokes removeAllObjects];
}

- (void)addBrushStrokeAtPoint:(CGPoint)point {
    // 保存point
    [self.strokes addObject:[NSValue valueWithCGPoint:point]];
    
    // 标记需要绘制的矩形
    [self setNeedsDisplayInRect:[self brushRectForPoint:point]];
}

- (CGRect)brushRectForPoint:(CGPoint)point {
    return CGRectMake(point.x - BRUSH_SIZE/2, point.y - BRUSH_SIZE/2, BRUSH_SIZE, BRUSH_SIZE);
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
        CGRect brushRect = [self brushRectForPoint:point];
        //only draw brush stroke if it intersects dirty rect
        if (CGRectIntersectsRect(rect, brushRect)) {
            //draw brush stroke
            [[UIImage imageNamed:@"brush"] drawInRect:brushRect];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Getters
- (NSMutableArray *)strokes {
    if (!_strokes) {
        _strokes = [NSMutableArray arrayWithCapacity:0];
    }
    return _strokes;
}
@end
