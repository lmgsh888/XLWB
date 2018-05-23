//
//  CZRetweetStatusView.m
//  传智微博
//
//  Created by mac on 2018/1/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZRetweetStatusView.h"
#import "CZStatusFrame.h"
#import "CZStatus.h"
#import "CZConst.h"
#import "UIImage+Image.h"
@interface CZRetweetStatusView ()

/** 转发微博昵称*/
@property(nonatomic,weak) UILabel *nameView;

/** 转发微博正文*/
@property(nonatomic,weak) UILabel *textView;

@end

@implementation CZRetweetStatusView

#pragma mark - 初始化
-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
       // self.backgroundColor = [UIColor darkGrayColor];
        self.image = [UIImage imageWithOriginalName:@"timeline_retweet_background"];
        [self setUpAllChildView];
        
    }
    return self;
}

-(void)setUpAllChildView{
    
    //昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = CZNameFont;
    nameView.textColor = CZColor(73, 105, 108);
    [self addSubview:nameView];
    _nameView = nameView;
    
    //正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = CZTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
}



-(void)setStatusF:(CZStatusFrame *)statusF{
    
    _statusF = statusF;
    
    CZStatus *status = statusF.status;
    // 昵称

    _nameView.frame = statusF.retweetedNameFrame;
    
    /** 昵称在实体中自定义*/
    //    NSString *retweetedName =[NSString stringWithFormat:@"@%@",status.retweeted_status.user.name];
    //_nameView.text = retweetedName;
    
    // retweetedName  自定义的
    
    _nameView.text = _statusF.status.retweetedName;
    
    // 正文
    _textView.frame = statusF.retweetedTextFrame;
    _textView.text = status.retweeted_status.text;
    
}




@end
