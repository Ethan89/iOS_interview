//
//  Student+Category.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/20.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "Student+Category.h"
#import <objc/runtime.h>

static void *const kNickNameKey = @"kStudentNickNameKey";

@implementation Student (Category)

- (void)setNickName:(NSString *)nickName {
    objc_setAssociatedObject(self, kNickNameKey, nickName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)nickName {
    return objc_getAssociatedObject(self, kNickNameKey);
}

- (NSString *)getNameAndAge {
    return [NSString stringWithFormat:@"名字：%@，年龄：%ld", self.name, self.age];
}

@end
