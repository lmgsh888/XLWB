//
//  CZStatusResult.m
//  传智微博
//
//  Created by mac on 2018/1/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZStatusResult.h"
#import "CZStatus.h"
@implementation CZStatusResult

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"statuses": [CZStatus class]};
    
    
}
@end
