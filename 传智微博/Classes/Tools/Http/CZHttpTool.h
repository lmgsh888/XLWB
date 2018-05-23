//
//  CZHttpTool.h
//  传智微博
//
//  Created by mac on 2018/1/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHttpTool : NSObject


+ (void)post:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

+(void)get:(NSString *)URLString
  parameters:(id)parameters
   success:(void(^)(id responseObject))success
   failure:(void(^)(NSError *error))failure;






@end
