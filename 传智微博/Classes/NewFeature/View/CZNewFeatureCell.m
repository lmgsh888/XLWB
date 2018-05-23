//
//  CZNewFeatureCell.m
//  传智微博
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CZNewFeatureCell.h"
#import "UIImage+Image.h"
#import "UIView+Frame.h"
#import "CZTabBarController.h"

@interface CZNewFeatureCell()
@property (nonatomic,weak) UIImageView *imageView;

@property(nonatomic,weak) UIButton *sharedButton;
@property(nonatomic,weak) UIButton *startButton;

@end
@implementation CZNewFeatureCell

- (UIButton *)sharedButton
{
    if (_sharedButton == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"分享给大家" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        
        [btn addTarget:self action:@selector(sharedButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        _sharedButton = btn;
        
    }
    return _sharedButton;
}

- (UIButton *)startButton
{
    if (_startButton == nil) {
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [startBtn sizeToFit];
        [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:startBtn];
        _startButton = startBtn;
        
    }
    return _startButton;
}


-(UIImageView *)imageView{
    if(!_imageView){
        UIImageView *imageView = [[UIImageView alloc] init];
        
        _imageView = imageView;

        [self.contentView addSubview:imageView];
    }
    return _imageView;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    //分享按钮
    self.sharedButton.center = CGPointMake(self.width * 0.5, self.height * 0.8);
    //开始按钮
    self.startButton.center = CGPointMake(self.width *0.5, self.height * 0.85);

}

-(void)setImage:(UIImage *)image{
    
    _image = image;
    
    self.imageView.image = _image;
    
    
}

#pragma mark - 判断当前是否是最后一页
-(void)setIndexPath:(NSIndexPath *)indexPath count:(NSUInteger)count{
    
    if(indexPath.row == count - 1){
        self.sharedButton.hidden = NO;
        self.startButton.hidden = NO;
    }else{
        self.sharedButton.hidden = YES;
        self.startButton.hidden = YES;
    }
    
}

#pragma mark - startButtonClick
-(void)start{
      CZTabBarController *tabBarVc = [[CZTabBarController alloc] init];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = tabBarVc;
    
}

-(void)sharedButtonClick{
    //切换选中图片
    self.sharedButton.selected = !self.sharedButton.selected;
}



@end
