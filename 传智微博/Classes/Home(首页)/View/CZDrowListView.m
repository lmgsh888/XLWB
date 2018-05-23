//
//  CZDrowListView.m
//  传智微博
//
//  Created by mac on 2017/12/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CZDrowListView.h"
#import "UIImage+Image.h"
#import "UIView+Frame.h"

@interface CZDrowListView()

//用来显示具体内容的容器
@property(nonatomic,weak) UIImageView *containerView;

@end

@implementation CZDrowListView

-(UIImageView *)containerView{
    if(!_containerView){
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage stretchableImageWithImage:@"popover_background"];
        //开始交互
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+(instancetype)menu{
    return [[self alloc] init];
}

-(void)showFrom:(UIView *)from{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    //将自己添加到最上层的窗体上
    [window addSubview:self];
    //设置尺寸
    self.frame = window.bounds;
    
    //设置内容容器的位置
//    self.containerView.x = (self.width - self.containerView.width) * 0.5;
    //self.containerView.y = 50;
    
    //进行项目转换
    //将from的坐标转移到window
   CGRect newFrame = [from convertRect:from.bounds toView:window];
    self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.y = CGRectGetMaxY(newFrame);
    
    //通知外界，自己显示了
    if([self.delegage respondsToSelector:@selector(drowListViewShow:)]){
        [self.delegage drowListViewShow:self];
    }

}

-(void)dismiss{
    [self removeFromSuperview];
    
    // 通知外界，自己被销毁了
    if([self.delegage respondsToSelector:@selector(drowListViewDismiss:)]){
        [self.delegage drowListViewDismiss:self];
    }
}

//设置显示内容
-(void)setContent:(UIView *)content{
    _content = content;
    
    _content.x = 10;
    _content.y = 15;
    
    self.containerView.width = _content.width + 2 * _content.x;
    self.containerView.height = CGRectGetMaxY(content.frame) + 11;

    
    //将具体内容添加到内容容器总
    [self.containerView addSubview:_content];
    
}

-(void)setContentController:(UIViewController *)contentController{
    _contentController = contentController;
    
    self.content = _contentController.view;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}


@end
