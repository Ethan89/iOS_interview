//
//  Student.h
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/19.
//  Copyright © 2019 ethan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject <NSCopying, NSMutableCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
