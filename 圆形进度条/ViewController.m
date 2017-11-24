//
//  ViewController.m
//  圆形进度条
//
//  Created by 潘伟建 on 2017/11/23.
//  Copyright © 2017年 潘伟建. All rights reserved.
//

#import "ViewController.h"
#import "CircularProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CircularProgressView * circularView = [[CircularProgressView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    circularView.gradientColors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor];
    [self.view addSubview:circularView];
    
    //模拟获取网络数据返回设置进度Progress
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        circularView.progress = 0.8;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
