//
//  CZStatus.h
//  传智微博
//
//  Created by mac on 2018/1/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZUser.h"
@interface CZStatus : NSObject
/*微博创建时间*/
@property(nonatomic,copy) NSString *created_at;
/*字符串型的微博ID*/
@property(nonatomic,copy) NSString *idstr;
/*微博信息内容*/
@property(nonatomic,copy) NSString *text;
/*微博来源*/
@property(nonatomic,copy) NSString *source;
/*
 缩略图片地址，没有时不返回此字段
 */

@property(nonatomic,copy) NSString *thumbnail_pic;
/*
中等尺寸图片地址，没有时不返回此字段 
 */

@property(nonatomic,copy) NSString *bmiddle_pic;
/*原始图片地址，没有时不返回此字段*/

@property(nonatomic,copy) NSString *original_pic;
/**
 *  微博作者的用户信息
 */
@property (nonatomic, strong) CZUser *user;

/**
 *  被转发的原微博信息字段，当该微博为转发微博时返回 详细
 */
@property (nonatomic, strong) CZStatus *retweeted_status;

/** 自定义的方便修改昵称值*/
@property(nonatomic,copy) NSString *retweetedName;

/**
 *  转发数
 */
@property (nonatomic, assign) NSUInteger *reposts_count;

/**
 *  评论数
 */
@property (nonatomic, assign) NSUInteger *comments_count;

/**
 *  表态数
 */
@property (nonatomic, assign) NSUInteger *attitudes_count;

/**
 *  微博配图地址
 */
@property (nonatomic, strong) NSArray *pic_urls;

@end
