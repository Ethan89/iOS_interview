//
//  CustomMacro.h
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/25.
//  Copyright © 2019 ethan. All rights reserved.
//

#ifndef CustomMacro_h
#define CustomMacro_h


#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...);
#endif

// 打印主线程
#define kPrintMainThread NSLog(@"主线程：%p", [NSThread mainThread]);

// 打印当前线程
#define kPrintCurrentThread NSLog(@"当前线程：%p", [NSThread currentThread]);

#endif /* CustomMacro_h */
