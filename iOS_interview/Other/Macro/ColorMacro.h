//
//  ColorMacro.h
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/18.
//  Copyright © 2019 ethan. All rights reserved.
//

#ifndef ColorMacro_h
#define ColorMacro_h

//十六进制颜色
#define UIColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromHexA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#endif /* ColorMacro_h */
