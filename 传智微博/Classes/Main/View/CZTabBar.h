//
//  CZTabBar.h
//  传智微博
//
//  Created by apple on 15-3-4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZTabBar;
//由于UITabBarDelegate 中也存在delegate代理所以需要实现
@protocol CZTabBardDelegate <UITabBarDelegate>

@optional
-(void)tabBarDidPlusButtonClick:(CZTabBar *)tabBar;

@end

@interface CZTabBar : UITabBar

@property(nonatomic,weak) id<CZTabBardDelegate> delegate;

@end
