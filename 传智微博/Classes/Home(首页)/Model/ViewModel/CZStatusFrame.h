//
//  CZStatusFrame.h
//  传智微博
//
//  Created by mac on 2018/1/18.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 包含的内容是
 1.微博模型数据
 2.各个子控件的Frame
 3.cell的高度
 */
@class CZStatus;
@interface CZStatusFrame : NSObject


/**
 1.微博模型
 */

@property(nonatomic,strong) CZStatus *status;


/**
 2.子控件的Frame
 
 */

// 原创微博frame
@property (nonatomic, assign) CGRect originalViewFrame;

/**   ******原创微博子控件frame**** */
// 头像Frame
@property (nonatomic, assign) CGRect originalIconFrame;

// 昵称Frame
@property (nonatomic, assign) CGRect originalNameFrame;

// vipFrame
@property (nonatomic, assign) CGRect originalVipFrame;

// 时间Frame
@property (nonatomic, assign) CGRect originalTimeFrame;

// 来源Frame
@property (nonatomic, assign) CGRect originalSourceFrame;

// 正文Frame
@property (nonatomic, assign) CGRect originalTextFrame;


// 转发微博frame
@property (nonatomic, assign) CGRect retweetedViewFrame;
/**   ******转发微博子控件frame**** */
// 昵称Frame
@property (nonatomic, assign) CGRect retweetedNameFrame;

// 正文Frame
@property (nonatomic, assign) CGRect retweetedTextFrame;

// 工具条frame
@property (nonatomic, assign) CGRect toolBarFrame;

/**
 3.Cell的高度
 */
@property(nonatomic,assign) CGFloat cellHeight;

@end
