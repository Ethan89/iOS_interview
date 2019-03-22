//
//  UILabel+Category.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/20.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

- (UILabel *)generateLabelWithFont:(UIFont *)font
                         textColor:(UIColor *)color
                         textAlign:(NSTextAlignment)align {
    
    UIFont *defaultFont = [UIFont systemFontOfSize:14.f];
    UIColor *defaultColor = [UIColor blackColor];
    NSTextAlignment defaultAlign = NSTextAlignmentLeft;
    
    if (font != nil) {
        defaultFont = font;
    }
    
    if (defaultColor != nil) {
        defaultColor = color;
    }
    
    if (align >= 0 && align <= 4) {
        defaultAlign = align;
    }
    
    UILabel *new = [[UILabel alloc] init];
    new.font = defaultFont;
    new.textColor = defaultColor;
    new.textAlignment = defaultAlign;
    
    return new;
}

+ (UILabel *)generateLabelWithFont:(UIFont *)font
                         textColor:(UIColor *)color
                         textAlign:(NSTextAlignment)align {
    UILabel *new = [[UILabel alloc] generateLabelWithFont:font
                                                textColor:color
                                                textAlign:align];
    return new;
}
@end
