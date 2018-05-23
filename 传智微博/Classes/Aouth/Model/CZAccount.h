//
//  CZAccount.h
//  传智微博
//
//  Created by mac on 2018/1/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZAccount : NSObject<NSCoding>

/**
 *  获取授权后的access token
 */
@property (nonatomic, copy) NSString *access_token;
/**
 *  有效期
 */
@property (nonatomic, copy) NSString *expires_in;
/**
 *  当前授权用户的UID
 */
@property (nonatomic, copy) NSString *uid;


/**
 字段转模型
 */
+(instancetype)accountWithDict:(NSDictionary *)dict;



@end
