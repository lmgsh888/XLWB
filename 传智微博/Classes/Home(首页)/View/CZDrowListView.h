//
//  CZDrowListView.h
//  传智微博
//
//  Created by mac on 2017/12/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZDrowListView;

@protocol drowListViewDelegate <NSObject>

@optional
//下拉菜单显示
-(void)drowListViewShow:(CZDrowListView *)drowMenu;
//下拉菜单销毁
-(void)drowListViewDismiss:(CZDrowListView *)drowMenu;

@end

@interface CZDrowListView : UIView

@property(nonatomic,weak) id<drowListViewDelegate> delegage;

//添加显示的内容
@property(nonatomic,strong) UIView *content;

//添加显示的控制器
@property(nonatomic,strong) UIViewController *contentController;


//创建下拉
+(instancetype)menu;

//显示
-(void)showFrom:(UIView *)from;

//销毁
-(void)dismiss;



@end
