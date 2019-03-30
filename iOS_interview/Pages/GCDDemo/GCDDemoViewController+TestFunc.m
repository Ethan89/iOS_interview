//
//  GCDDemoViewController+TestFunc.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/30.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "GCDDemoViewController+TestFunc.h"

@implementation GCDDemoViewController (TestFunc)

- (void)testGcdSyncAndConcurrent {
    kPrintCurrentThread;
    NSLog(@"同步执行、并发队列---开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.ethan.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务一】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务二】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务三】===%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"同步执行、并发队列---结束");
}

- (void)testGcdAsyncAndConcurrent {
    kPrintCurrentThread;
    NSLog(@"异步执行、并发队列---开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.ethan.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务一】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务二】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务三】===%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"异步执行、并发队列---结束");
}

- (void)testGcdSyncAndSerial {
    kPrintCurrentThread;
    NSLog(@"同步执行、串行队列---开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.ethan.testQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务一】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务二】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务三】===%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"同步执行、串行队列---结束");
}

- (void)testGcdAsyncAndSerial {
    kPrintCurrentThread;
    NSLog(@"异步执行、串行队列---开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.ethan.testQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务一】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务二】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务三】===%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"异步执行、串行队列---结束");
}

- (void)testGcdSyncAndMainQueueInSubThread {
    kPrintCurrentThread;
    NSLog(@"同步执行、主队列---开始");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务一】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务二】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务三】===%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"同步执行、主队列---结束");
}

- (void)testGcdAsyncAndMainQueue {
    kPrintCurrentThread;
    NSLog(@"异步执行、主队列---开始");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务一】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务二】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务三】===%@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"异步执行、主队列---结束");
}

- (void)testGcdGroupAndSync {
    kPrintMainThread;
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务一】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务二】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2.f];
            NSLog(@"【模拟任务三】===%@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"group内任务全部执行完毕\n");
        kPrintCurrentThread;
    });
}

- (void)testGcdGroupAndAsync {
    kPrintMainThread;
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"【group一】===%@", [NSThread currentThread]);
        dispatch_queue_t tmpQueue = dispatch_queue_create("com.ethan.tmpQueue.task1", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(tmpQueue, ^{
            for (NSInteger i = 0; i < 2; i++) {
                [NSThread sleepForTimeInterval:2.f];
                NSLog(@"【模拟任务一】===%@", [NSThread currentThread]);
            }
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"【group二】===%@", [NSThread currentThread]);
        dispatch_queue_t tmpQueue = dispatch_queue_create("com.ethan.tmpQueue.task2", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(tmpQueue, ^{
            for (NSInteger i = 0; i < 2; i++) {
                [NSThread sleepForTimeInterval:2.f];
                NSLog(@"【模拟任务二】===%@", [NSThread currentThread]);
            }
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"【group三】===%@", [NSThread currentThread]);
        dispatch_queue_t tmpQueue = dispatch_queue_create("com.ethan.tmpQueue.task3", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(tmpQueue, ^{
            for (NSInteger i = 0; i < 2; i++) {
                [NSThread sleepForTimeInterval:2.f];
                NSLog(@"【模拟任务三】===%@", [NSThread currentThread]);
            }
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"group内任务全部执行完毕\n");
        kPrintCurrentThread;
    });
}
@end
