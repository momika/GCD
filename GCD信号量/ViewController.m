//
//  ViewController.m
//  GCD信号量
//
//  Created by peter on 16/8/20.
//  Copyright © 2016年 MacPro. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()

@property (nonatomic, strong) UIImageView *view1;
@property (nonatomic, strong) UIImageView *view2;
@property (nonatomic, strong) UIImageView *view3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view1 = [self createImageViewWithFrame:CGRectMake(20  , 20, 120, 120)];
    self.view2 = [self createImageViewWithFrame:CGRectMake(120, 20, 120, 120)];
    self.view3 = [self createImageViewWithFrame:CGRectMake(240, 20, 120, 120)];
    
    NSString *net1 = @"http://t2.27270.com/uploads/tu/201504299/1425006951_uxjwXXLD.jpg";
    NSString *net2 = @"http://t2.27270.com/uploads/tu/201504299/1425440874_IDCicuxi.jpg";
    NSString *net3 = @"http://t2.27270.com/uploads/tu/201504299/1425440952_iTMrhiCL.jpg";
    
    // 初始化信号量
    GCDSemaphore *semaphore = [[GCDSemaphore alloc] init];
    
    [GCDQueue executeInGlobalQueue:^{
        
        // 获取图片1
        UIImage *image1 = [self accessDataByNetString:net1];
        
        [GCDQueue executeInMainQueue:^{
            [UIView animateWithDuration:2.0f animations:^{
                self.view1.image = image1;
                self.view1.alpha = 1.f;
            } completion:^(BOOL finished) {
                
                // 信号量发送完毕消息
                [semaphore signal];
            }];
        }];
    }];
    
    [GCDQueue executeInGlobalQueue:^{
    
    // 获取图片2
    UIImage *image2 = [self accessDataByNetString:net2];
    
    // 信号量阻塞
        [semaphore wait];
        
    [GCDQueue executeInMainQueue:^{
        [UIView animateWithDuration:2.0f animations:^{
            self.view2.image = image2;
            self.view2.alpha = 1.f;
        } completion:^(BOOL finished) {
            
            // 信号量发送完毕消息
            [semaphore signal];
            
           }];
       }];
   }];

    [GCDQueue executeInGlobalQueue:^{
        
        // 获取图片3
        UIImage *image3 = [self accessDataByNetString:net3];
        
        // 信号量阻塞
        [semaphore wait];
        [GCDQueue executeInMainQueue:^{
            [UIView animateWithDuration:2.0f animations:^{
                self.view3.image = image3;
                self.view3.alpha = 1.f;
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];

}
// 创建view
- (UIImageView *)createImageViewWithFrame:(CGRect)frame {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.alpha        = 0.f;
    [self.view addSubview:imageView];

    return imageView;
}
// 获取网络图片
- (UIImage *)accessDataByNetString:(NSString *)string {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil ];
    return [UIImage imageWithData:data];
}
@end
