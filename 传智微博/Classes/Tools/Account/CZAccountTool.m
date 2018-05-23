//
//  CZAccountTool.m
//  传智微博
//
//  Created by mac on 2018/1/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZAccountTool.h"
#import "CZConst.h"
#import "CZHttpTool.h"
#import "CZAccountParam.h"
#import "MJExtension.h"
#import "CZAccount.h"

#define AccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]
@implementation CZAccountTool


+(void)saveAccount:(CZAccount *)account{
    
    [NSKeyedArchiver archiveRootObject:account toFile:AccountPath];
    //NSLog(@"path %@",AccountPath);
    
}

+(CZAccount *)getAccount{
    // 加载模型
    CZAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountPath];
    
    //NSLog(@"account :%@ path %@",account,AccountPath);
    return account;
}

#pragma mark - 用授权码获取access_token
+ (void)accessTokenWithCode:(NSString *)code success:(void (^)())success failure:(void (^)(NSError *))failure{
//    NSMutableDictionary *dictParams = [[NSMutableDictionary alloc] init];
//    dictParams[@"client_id"] = AppKey;
//    dictParams[@"client_secret"]=AppSecret;
//    dictParams[@"grant_type"] =@"authorization_code";
//    dictParams[@"code"] = code;
//    dictParams[@"redirect_uri"] = RedirectURI;
    
    CZAccountParam *params = [[CZAccountParam alloc] init];
    params.client_id = AppKey;
    params.client_secret = AppSecret;
    params.grant_type =@"authorization_code";
    params.code =code;
    params.redirect_uri = RedirectURI;
    

    [CZHttpTool post:@"https://api.weibo.com/oauth2/access_token" parameters:params.mj_keyValues success:^(id responseObject) {
        
        
//         CZAccount *account = [CZAccount mj_objectWithKeyValues:responseObject];
        
        CZAccount *account = [CZAccount accountWithDict:responseObject];
        
        //保存账号
        [CZAccountTool saveAccount:account];

        if(success){
            success();
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}

@end
