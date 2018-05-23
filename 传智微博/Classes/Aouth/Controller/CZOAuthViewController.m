//
//  CZOAuthViewController.m
//  传智微博
//
//  Created by mac on 2018/1/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZOAuthViewController.h"
#import "CZConst.h"
#import "CZAccountTool.h"
#import "CZAccount.h"
#import "CZGuideTool.h"
#import "MBProgressHUD+MJ.h"

@interface CZOAuthViewController ()<UIWebViewDelegate>

@end

@implementation CZOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    
    [self.view addSubview:webView];
    
    
    NSString *baseUrl =@"https://api.weibo.com/oauth2/authorize";
    NSString *strUrl = [baseUrl stringByAppendingFormat:@"?client_id=%@&redirect_uri=%@",AppKey,RedirectURI];
    
    //NSLog(@"%@",strUrl);
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestUrl];
    
}


#pragma mark - UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //NSLog(@"url =%@",request.URL.absoluteString);
    //https://m.baidu.com/?code=5f8f2c75a51d5c70aa9f5b7efe8a2a0b&from=844b&vit=fps
    
    NSString *urlStr = request.URL.absoluteString;
    //先判断是否存在code =
    NSRange range = [urlStr rangeOfString:@"code="];
    if(range.length > 0){
        //从code= 开始截取到最后
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        //获取accessToken
        [self accessTokenWithCode:code];
        
        return NO;
    }
    
    return true;
}

//开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showMessage:@"正在登录..."];
}

//加载完成时
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUD];
}

//加载失败时
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUD];
}


#pragma mark - 用授权码获取access_token
-(void)accessTokenWithCode:(NSString *)code{
   

    [CZAccountTool accessTokenWithCode:(code) success:^{
        //切换控制器
        [CZGuideTool guideRootViewController:CZKeyWindow];

    
    } failure:^(NSError *error){
        
    }];

}

#pragma mark - 内存警告处理
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
