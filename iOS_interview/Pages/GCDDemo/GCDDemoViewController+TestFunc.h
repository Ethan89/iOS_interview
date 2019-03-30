//
//  GCDDemoViewController+TestFunc.h
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/30.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "GCDDemoViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface GCDDemoViewController (TestFunc)

- (void)testGcdSyncAndConcurrent;
- (void)testGcdAsyncAndConcurrent;
- (void)testGcdSyncAndSerial;
- (void)testGcdAsyncAndSerial;
- (void)testGcdSyncAndMainQueueInSubThread;
- (void)testGcdAsyncAndMainQueue;
- (void)testGcdGroupAndSync;
- (void)testGcdGroupAndAsync;

@end

NS_ASSUME_NONNULL_END
