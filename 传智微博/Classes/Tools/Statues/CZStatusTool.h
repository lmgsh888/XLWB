//
//  CZStatusTool.h
//  传智微博
//
//  Created by mac on 2018/1/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZStatusTool : NSObject

//获取用户最新发表的微博数据
+(void)newStatusesWithSinceID:(NSUInteger)SinceID success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;

//获取更多微博数据
+(void)moreStatusWithMaxID:(NSUInteger)MaxID
       success:(void(^)(NSArray *statuses))success
       failure:(void(^)(NSError *error))failure;


@end
