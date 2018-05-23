//
//  CZTabBarController.m
//  传智微博
//
//  Created by apple on 15-3-4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CZTabBarController.h"
#import "UIImage+Image.h"
#import "CZTabBar.h"

#import "CZHomeViewController.h"
#import "CZDiscoverViewController.h"
#import "CZMessageViewController.h"
#import "CZProfileViewController.h"
#import "CZNavigationViewController.h"
//#import <objc/message.h>

@interface CZTabBarController ()<CZTabBardDelegate>

@end

@implementation CZTabBarController

+ (void)initialize
{

    // self -> CZTabBarController
    // 获取当前这个类下面的所有tabBarItem
//    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    // 创建属性字典
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
   
    // 设置模型的标题属性修改控件的文字颜色
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加所有子控制器
    [self setUpAllChildViewController];
    
    // 自定义tabBar
    CZTabBar *tabBar = [[CZTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.delegate = self;

    // 利用KVC把readly的属性改
    [self setValue:tabBar forKeyPath:@"tabBar"];
//    objc_msgSend(self, @selector(setTabBar:),tabBar);

}
#pragma mark - 添加所有的子控制器
- (void)setUpAllChildViewController
{
    // 首页
    CZHomeViewController *home = [[CZHomeViewController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];
    //home.view.backgroundColor = [UIColor greenColor];
    
    // 消息
    CZMessageViewController *message = [[CZMessageViewController alloc] init];
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"消息"];
    message.view.backgroundColor = [UIColor blueColor];
    
    // 发现
    CZDiscoverViewController *discover = [[CZDiscoverViewController alloc] init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"发现"];
    discover.view.backgroundColor = [UIColor purpleColor];
    

    // 我
    CZProfileViewController *profile = [[CZProfileViewController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我"];
    profile.view.backgroundColor = [UIColor lightGrayColor];

}

#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    
    vc.tabBarItem.badgeValue = @"10";
    vc.tabBarItem.selectedImage = selectedImage;

    
    //给每一个tabbar添加nav
    CZNavigationViewController *nav = [[CZNavigationViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
   //[self addChildViewController:vc];
}

#pragma mark - 加号事件
-(void)tabBarDidPlusButtonClick:(CZTabBar *)tabBar{
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
   [self presentViewController:vc animated:YES completion:nil];
}
@end
