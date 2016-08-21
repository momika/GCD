//
//  GCDGroup.h
//  GCD
//  Created by macPro on 15/2/16.
//  Copyright (c) 2016年 macPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDGroup : NSObject

@property (strong, nonatomic, readonly) dispatch_group_t dispatchGroup;

#pragma 初始化以及释放
- (instancetype)init;

#pragma 用法
- (void)enter;
- (void)leave;
- (void)wait;
- (BOOL)wait:(int64_t)delta;

@end
