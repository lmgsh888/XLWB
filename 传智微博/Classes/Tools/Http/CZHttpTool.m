//
//  CZHttpTool.m
//  传智微博
//
//  Created by mac on 2018/1/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZHttpTool.h"
#import "AFNetworking.h"
#import "CZAccount.h"
#import "CZAccountTool.h"
#import "MJExtension.h"
@implementation CZHttpTool

+(void)post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(success){
            success(responseObject);
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        if(failure){
            failure(error);
        }
    }];
}

+(void)get:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}
@end
