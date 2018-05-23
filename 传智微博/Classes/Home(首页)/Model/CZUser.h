//
//  CZUser.h
//  传智微博
//
//  Created by mac on 2018/1/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZUser : NSObject
/**
 *  友好显示名称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  用户头像地址
 */
@property (nonatomic, strong) NSURL *profile_image_url;

/** 会员类型 > 2代表是会员 */
@property (nonatomic, assign) int mbtype;
/** 会员等级 */
@property (nonatomic, assign) int mbrank;

/*是否是vip*/
@property (nonatomic, assign,getter=isVip) BOOL vip;
@end
