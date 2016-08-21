//
//  ViewController.m
//  GCD线程组
//
//  Created by peter on 16/8/20.
//  Copyright © 2016年 MacPro. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSLog(@"启动");
    
    // 初始化线程组
    GCDGroup *group = [[GCDGroup alloc] init];
    
    // 创建一个线程队列
    GCDQueue *queue = [[GCDQueue alloc] initConcurrent];
    
    // 让线程在group中执行(线程1)
    [queue execute:^{
        sleep(2);
        NSLog(@"线程1执行完毕");
    } inGroup:group];
    
    // 让线程在group中执行(线程1)
    [queue execute:^{
        sleep(5);
        NSLog(@"线程2执行完毕");
    } inGroup:group];
    
    // 监听线程组是否执行动画，然后执行（线程3）
    [queue notify:^{
        NSLog(@"线程3执行完毕");
    } inGroup:group];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
