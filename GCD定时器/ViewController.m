//
//  ViewController.m
//  GCD定时器
//
//  Created by peter on 16/8/20.
//  Copyright © 2016年 MacPro. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()

@property (nonatomic, strong) GCDTimer *gcdTimer;
@property (nonatomic, strong) NSTimer *normalTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 执行GCDTimer
    [self runGCDTimer];
    
    // 执行NSTimer
    [self runNSTimer];
    
}
/**
 *  GCDTimer
 */
- (void)runGCDTimer {
    
    // 初始化定时器
    self.gcdTimer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    
    // 指定事件间隔以及要执行的事件
    [self.gcdTimer event:^{
        NSLog(@"GCD定时器");
    } timeInterval:NSEC_PER_SEC]; // 1秒钟
    
    // 运行GCD定时器
    [self.gcdTimer start];
}

/**
 *  NSTimer
 */

- (void)runNSTimer {
    
    // 初始化并激活定时器
    self.normalTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                        target:self
                                                      selector:@selector(timerEvent)
                                                      userInfo:nil
                                                       repeats:YES];
    
}
- (void)timerEvent {
    
    NSLog(@"NSTimer定时器");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
