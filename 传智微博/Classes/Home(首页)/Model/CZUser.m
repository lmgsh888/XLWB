//
//  CZUser.m
//  传智微博
//
//  Created by mac on 2018/1/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZUser.h"

@implementation CZUser


-(void)setMbtype:(int)mbtype{
    
    _mbtype = mbtype;
    
    //>2 是会员
    self.vip = mbtype > 2;
}
@end
