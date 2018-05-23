//
//  CZStatusTool.m
//  传智微博
//
//  Created by mac on 2018/1/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZStatusTool.h"
#import "CZHttpTool.h"
#import "CZStatusParam.h"
#import "CZAccountTool.h"
#import "CZAccount.h"
#import "CZStatusResult.h"
#import "MJExtension.h"
@implementation CZStatusTool

+(void)newStatusesWithSinceID:(NSUInteger)SinceID success:(void (^)(NSArray *statuses))success failure:(void (^)(NSError *))failure{
    CZStatusParam *params = [[CZStatusParam alloc] init];
    params.access_token =[CZAccountTool getAccount].access_token;
    params.since_id = SinceID;

    
    [CZHttpTool get:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params.mj_keyValues success:^(id responseObject) {

        //微博字典数组
        /*
        NSArray *dictArray = responseObject[@"statuses"];
        //将字典转化成微博模型数组
        NSArray *statuses = (NSMutableArray *)[CZStatus mj_objectArrayWithKeyValuesArray:dictArray];
         */
        
        CZStatusResult *result = [CZStatusResult mj_objectWithKeyValues:responseObject];
        if(success){
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}


+(void)moreStatusWithMaxID:(NSUInteger)MaxID success:(void (^)(NSArray *statuses))success failure:(void (^)(NSError *))failure{
    
    CZStatusParam *params = [[CZStatusParam alloc] init];
    params.access_token = [CZAccountTool getAccount].access_token;
    params.max_id = MaxID;
    [CZHttpTool get:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params.mj_keyValues success:^(id responseObject) {
        
        /*
        NSArray *dictArray = responseObject[@"statuses"];
        //将字典转化成微博模型数组
        NSArray *statuses = (NSMutableArray *)[CZStatus mj_objectArrayWithKeyValuesArray:dictArray];
         
         */
        
        //将结果字典转成结果模型
        CZStatusResult *result = [CZStatusResult mj_objectWithKeyValues:responseObject];

        if(success){
            success(result.statuses);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}
    

@end
