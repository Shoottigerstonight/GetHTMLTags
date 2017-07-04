//
//  ViewController.m
//  GetHTMLTags
//
//  Created by 今晚打老虎 on 2017/7/4.
//  Copyright © 2017年 今晚打老虎. All rights reserved.
//

#import "ViewController.h"
#import "GetHTMLTags.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    web.scalesPageToFit = YES;
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.cflac.org.cn/wyw_sj/wlyw/"]]];
    web.scrollView.bounces = NO;
    [web setDelegate:self];
    [self.view addSubview:web];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *string = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.innerHTML"];
    
    NSMutableArray *htmlArray = [GetHTMLTags GetMainTagIn:string mainTag:@"<dl class=\"Relevantbox1\">"];
    NSMutableArray *urlArray = [GetHTMLTags GetlittleTag:htmlArray littleTag:@[@"href=\""] smallTag:@"\""];
    NSLog(@"获取到的网址数组为：%@",urlArray);
    NSMutableArray *titleArray = [GetHTMLTags GetlittleTag:htmlArray littleTag:@[@"<dd>",@"href=\"",@">"] smallTag:@"</a></p>"];
    NSLog(@"获取到的标题数组为：%@",titleArray);
    NSMutableArray *imageArray = [GetHTMLTags GetlittleTag:htmlArray littleTag:@[@"class=\"fl_all",@"img src=\""] smallTag:@"\""];
    NSLog(@"获取到的图片数组为：%@",imageArray);
    
    
}
@end
