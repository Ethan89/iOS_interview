//
//  PaintingBoardViewController.h
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/21.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger, PaintingBoardType) {
    // enum like: MyEnumTypeA = 0,
    PaintingBoardTypeUnknow = 0,
    PaintingBoardTypeBezierPath,
    PaintingBoardTypeShapeLayer,
    PaintingBoardTypeDirtyRectangle,
    PaintingBoardTypeDirtyRectangleOptimize
};

NS_ASSUME_NONNULL_BEGIN

@interface PaintingBoardViewController : BaseViewController

@property (nonatomic, assign) PaintingBoardType type;

@end

NS_ASSUME_NONNULL_END
