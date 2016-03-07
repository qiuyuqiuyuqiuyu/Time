//
//  NewsViewController.m
//  Time
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()<UIWebViewDelegate>

@end

@implementation NewsViewController{
    UIWebView *webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];


    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 64)];
    webView.delegate = self;
    webView.scalesPageToFit = YES;//适应于屏幕
    [self.view addSubview:webView];
    [self loadDate];

}
-(void)loadDate{
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    
    NSDictionary *dic = [Json json:@"newsDetail2"];
    NSString *content = [dic objectForKey:@"content"];
    NSString *title = [dic objectForKey:@"title"];
    NSString *time = [dic objectForKey:@"time"];
    NSString *source = [dic objectForKey:@"source"];
    NSString *author = [dic objectForKey:@"author"];
    NSString *editor = [dic objectForKey:@"editor"];
    
    self.title = title;
    
    NSString *string = [NSString stringWithFormat:html,title,content,time,source,author,editor];
    
    
    [webView loadHTMLString:string baseURL:nil];
    
    
    
    
    
    
    
    
    
    
}


@end
