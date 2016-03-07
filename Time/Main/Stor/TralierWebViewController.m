//
//  TralierWebViewController.m
//  Time
//
//  Created by bever on 16/3/5.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "TralierWebViewController.h"

@interface TralierWebViewController ()

@end

@implementation TralierWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
self.title= @"视频新闻";
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    NSURL *url = [NSURL URLWithString:@"http://www.iqiyi.com"];
    NSURLRequest *requst = [NSURLRequest requestWithURL:url];
    [web loadRequest:requst];
    
    [self.view addSubview:web];


}

@end
