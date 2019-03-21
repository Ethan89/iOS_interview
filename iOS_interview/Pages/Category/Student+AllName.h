//
//  Student+AllName.h
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/20.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student ()

@property (nonatomic, strong) NSString *friendName;

- (NSString *)getNameAndAge;
- (NSString *)getRelationship;

@end

NS_ASSUME_NONNULL_END
