//
//  UILabel+Category.h
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/20.
//  Copyright © 2019 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

- (UILabel *)generateLabelWithFont:(UIFont *)font
                         textColor:(UIColor *)color
                         textAlign:(NSTextAlignment)align;

+ (UILabel *)generateLabelWithFont:(UIFont *)font
                         textColor:(UIColor *)color
                         textAlign:(NSTextAlignment)align;

@end

NS_ASSUME_NONNULL_END
