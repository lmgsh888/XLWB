//
//  CZAccountParam.h
//  传智微博
//
//  Created by mac on 2018/1/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZAccountParam : NSObject

//申请应用时分配的AppKey
@property(nonatomic,copy) NSString *client_id;
//申请应用时分配的AppSecret
@property(nonatomic,copy) NSString *client_secret;
//请求的类型，填写authorization_code
@property(nonatomic,copy) NSString *grant_type;
//授权后获得的code值
@property(nonatomic,copy) NSString *code;
//回调地址
@property(nonatomic,copy) NSString *redirect_uri;

@end
