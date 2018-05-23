//
//  CZStatusCell.m
//  传智微博
//
//  Created by mac on 2018/1/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZStatusCell.h"
#import "CZOriginalStatusView.h"
#import "CZRetweetStatusView.h"
#import "CZToolBarView.h"
#import "CZStatusFrame.h"

@interface CZStatusCell()

/** 原创视图*/
@property(nonatomic,weak) CZOriginalStatusView *originalView;

/** 转发微博*/
@property(nonatomic,weak) CZRetweetStatusView *retweetView;

/** 工具条*/
@property(nonatomic,weak) CZToolBarView *toolBarView;

@end

@implementation CZStatusCell


#pragma mark - 初始化
// 注意：cell是用initWithStyle初始化

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        //清除cell 的点击效果
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self setUpAllChildView];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark - 初始化所有视图
-(void)setUpAllChildView{
    
    //原创微博
    CZOriginalStatusView *originalView = [[CZOriginalStatusView alloc] init];
    [self addSubview:originalView];
    _originalView = originalView;
    //转发微博
    CZRetweetStatusView *retweetView = [[CZRetweetStatusView alloc] init];
    [self addSubview:retweetView];
    _retweetView = retweetView;
    
    //工具条
    CZToolBarView *toolBarView = [[CZToolBarView alloc] init];
    [self addSubview:toolBarView];
    _toolBarView = toolBarView;
}

#pragma mark - 设置视图的frame
-(void)setStatusFrame:(CZStatusFrame *)statusFrame{
    
    _statusFrame = statusFrame;
    //原创微博Frame
    _originalView.frame = _statusFrame.originalViewFrame;
    //原创微博子控件frame
    _originalView.statusF = _statusFrame;
    
    //转发微博Frame
    _retweetView.frame = _statusFrame.retweetedViewFrame;
    _retweetView.statusF = _statusFrame;
    
    //工具条Frame
    _toolBarView.frame = _statusFrame.toolBarFrame;
    
}

+(instancetype)cellWithTableView:(UITableView *)tableView{

    static NSString *ID = @"cell";
    CZStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}
@end
