//
//  ViewController.m
//  SZAdvertiseViewDemo
//
//  Created by styshy on 16/9/20.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "ViewController.h"
#import "SZAdvertiseView.h"

@interface ViewController ()<SZAdvertiseViewDelegate>

@property(nonatomic, weak) SZAdvertiseView *szAdvView;
@property(nonatomic, weak) UIWebView *szWebview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIWebView *szWebview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:szWebview];
    self.szWebview = szWebview;
    
    SZAdvertiseView *szAdvView = [[SZAdvertiseView alloc] initWithFrame:self.view.bounds];
    
    szAdvView.delegate = self;
    
    szAdvView.advertiseImage = [UIImage imageNamed:@"shiyu_advertise"];
    
    szAdvView.logoImage = [UIImage imageNamed:@"shiyu_logo"];
    
    szAdvView.advertiseType = @"http://baike.baidu.com/link?url=3p-5kcHcjuvsMtl1vdTvbpra76FkATeJsmvh5s1n4mUMEuG31UcbDK3ivF1QfFuvQSh0-S8QKHcxhYENDS3FZq";
    
    szAdvView.logoType = @"https://www.baidu.com/link?url=rNf4tFHVJREsx6jH7_jNLo41xmy618rnB3Lwl9D7IAAZqSZW-KzivL2ACZnOc77hu2N-7Hy_No7plO3M66LaPK&wd=&eqid=96c8c0cd00011fe60000000557e0b181";
    
    [self.view addSubview:szAdvView];
    
    self.szAdvView = szAdvView;
}

- (void)advertiseClick:(NSString *)advType {
    [self.szWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:advType]]];
}

- (void)logoClick:(NSString *)logoType {
    [self.szWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:logoType]]];
}

- (void)countDownClick {
    [self.szWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://sz8023.github.io"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
