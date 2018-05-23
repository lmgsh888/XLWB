//
//  CZAccount.m
//  传智微博
//
//  Created by mac on 2018/1/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZAccount.h"
#import "MJExtension.h"

#define accessToken @"access_token"
#define expiresIn @"expires_in"
#define Uid @"uid"


@implementation CZAccount

+(instancetype)accountWithDict:(NSDictionary *)dict{
    CZAccount *account = [[self alloc] init];
    
    [account setValuesForKeysWithDictionary:dict];
    
    return account;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.access_token forKey:accessToken];
    [aCoder encodeObject:self.expires_in forKey:expiresIn];
    [aCoder encodeObject:self.uid forKey:Uid];
}

//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if(self = [super init]){
        self.access_token = [aDecoder decodeObjectForKey:accessToken];
        self.expires_in = [aDecoder decodeObjectForKey:expiresIn];
        self.uid = [aDecoder decodeObjectForKey:Uid];
    }
    return self;
}


@end
