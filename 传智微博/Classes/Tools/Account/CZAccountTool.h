//
//  CZAccountTool.h
//  传智微博
//
//  Created by mac on 2018/1/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CZAccount;
@interface CZAccountTool : NSObject

+(void)saveAccount:(CZAccount *)account;
+(CZAccount *)getAccount;
//获取accessToken
+ (void)accessTokenWithCode:(NSString *)code success:(void (^)()) success failure:(void (^)(NSError *))failure;
@end
