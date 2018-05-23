//
//  CZOriginalStatusView.m
//  传智微博
//
//  Created by mac on 2018/1/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZOriginalStatusView.h"
#import "CZStatusFrame.h"
#import "CZStatus.h"
#import "UIImageView+WebCache.h"
#import "CZConst.h"

@interface CZOriginalStatusView ()
// 头像
@property (nonatomic, weak) UIImageView *iconView;


// 昵称
@property (nonatomic, weak) UILabel *nameView;


// vip
@property (nonatomic, weak) UIImageView *vipView;


// 时间
@property (nonatomic, weak) UILabel *timeView;

// 来源
@property (nonatomic, weak) UILabel *sourceView;


// 正文
@property (nonatomic, weak) UILabel *textView;

@end

@implementation CZOriginalStatusView


-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        [self setUpAllChildView];
    }
    
    return self;
}

#pragma mark - 初始化所有子控件
-(void)setUpAllChildView{
    
    
    //头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    //昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = CZNameFont;
    nameView.textColor = CZColor(253, 150, 53);
    [self addSubview:nameView];
    _nameView = nameView;
    
    //vip
    UIImageView *vipView = [[UIImageView alloc] init];
    [self addSubview:vipView];
    _vipView = vipView;
    
    //时间
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = CZTimeFont;
    timeView.textColor = CZColor(253, 150, 53);
    [self addSubview:timeView];
    _timeView = timeView;
    
    //来源
    UILabel *sourceView = [[UILabel alloc] init];
    sourceView.font = CZSourceFont;
    sourceView.textColor = CZColor(139,139,139);
    [self addSubview:sourceView];
    _sourceView = sourceView;
    
    
    //正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = CZTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
}

#pragma mark - set方法
-(void)setStatusF:(CZStatusFrame *)statusF{
    
    _statusF = statusF;
    
    [self setUpStatusFrame];
    
    [self setUpStatusData];
}

#pragma mark - 设置frame
-(void)setUpStatusFrame{
    
 
    //头像
    _iconView.frame = _statusF.originalIconFrame;
    
    //昵称
    _nameView.frame = _statusF.originalNameFrame;
    
    if(_statusF.status.user.vip){
        //vip
        _vipView.hidden = NO; //是vip时显示vip控件
        _vipView.frame = _statusF.originalVipFrame;
    }else{
        _vipView.hidden = YES; //隐藏vip控件
    }
   
    
    //时间
   // _timeView.frame = _statusF.originalTimeFrame;
    
    CGFloat timeX = _statusF.originalNameFrame.origin.x;
    CGFloat timeY = CGRectGetMaxY(_statusF.originalNameFrame) + CZStatusCellMargin * 0.5;
    NSMutableDictionary *timeDict = [NSMutableDictionary dictionary];
    timeDict[NSFontAttributeName] = CZTimeFont;
    CGSize timeSize = [_statusF.status.created_at sizeWithAttributes:timeDict];
   _timeView.frame= (CGRect){{timeX,timeY},timeSize};
    
    if ([_statusF.status.created_at isEqualToString:@"刚刚"]) {
        _timeView.textColor = [UIColor orangeColor];
    }else{
        _timeView.textColor = [UIColor lightGrayColor];
    }
    
    //来源
    _sourceView.frame = _statusF.originalSourceFrame;
    
    //正文
    _textView.frame = _statusF.originalTextFrame;
    

    
}

#pragma mark - 设置数据
-(void)setUpStatusData{
    
    CZStatus *status =_statusF.status;
    //头像
    [_iconView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    //昵称
    _nameView.text = status.user.name;
    
    //vip
    if(status.user.isVip){
        
        NSString *imageName = [NSString stringWithFormat:@"common_icon_membership_level%d",status.user.mbrank];
        _vipView.image = [UIImage imageNamed:imageName];
    }
    
    //时间
    _timeView.text = status.created_at;
    
    //来源
    _sourceView.text = status.source;     
    //正文
    _textView.text = status.text;
    
    
}
@end
