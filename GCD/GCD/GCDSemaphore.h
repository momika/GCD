//
//  GCDSemaphore.h
//  GCD
//  Created by macPro on 15/2/16.
//  Copyright (c) 2016年 macPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDSemaphore : NSObject

@property (strong, readonly, nonatomic) dispatch_semaphore_t dispatchSemaphore;

#pragma 初始化以及释放
- (instancetype)init;
- (instancetype)initWithValue:(long)value;

#pragma 用法
- (BOOL)signal;
- (void)wait;
- (BOOL)wait:(int64_t)delta;

@end
