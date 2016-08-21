//
//  ViewController.m
//  GCD延时执行
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
    
    // GCD延时执行操作
    [GCDQueue executeInMainQueue:^{
        
     NSLog(@"GCD线程事件");
        
    }afterDelaySecs:2.f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
