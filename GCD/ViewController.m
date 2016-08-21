//
//  ViewController.m
//  GCD
//
//  Created by peter on 16/8/20.
//  Copyright © 2016年 MacPro. All rights reserved.
//
// 串行队列一次只执行一个线程，按照添加到队列的顺序依次执行调用
// 并发队列一次可以执行多个线程，线程的执行没有先后顺序
// UI界面所在的线程队列是串行队列

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 执行串行队列
    [self serailQueue];
    
    // 执行并发队列
    [self initConcurrent];
}

/**
 *  串行队列
 */
- (void)serailQueue {
    
    // 创建队列
    GCDQueue *queue = [[GCDQueue alloc] initSerial];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"1");
    }];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"2");
    }];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"3");
    }];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"4");
    }];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"5");
    }];
}

/**
 *  并发队列
 */
- (void)initConcurrent {
    
    // 创建队列
    GCDQueue *queue = [[GCDQueue alloc] initConcurrent];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"1");
    }];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"2");
    }];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"3");
    }];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"4");
    }];
    
    // 执行队列中的线程
    [queue execute:^{
        NSLog(@"5");
    }];
}

@end
