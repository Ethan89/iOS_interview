//
//  Student.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/19.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "Student.h"
#import "Student+AllName.h"

@implementation Student

- (id)copyWithZone:(nullable NSZone *)zone {
    Student *new = [[[self class] allocWithZone:zone] init];
    new.name = self.name;
    new.age  = self.age;
    
    return new;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    Student *new = [[[self class] allocWithZone:zone] init];
    new.name = [self.name mutableCopy];
    new.age  = self.age;
    
    return new;
}



- (NSString *)getRelationship {
    return [NSString stringWithFormat:@"%@ 和 %@ 是好朋友", self.name, self.friendName];
}
@end
