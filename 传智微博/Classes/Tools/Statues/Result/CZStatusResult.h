//
//  CZStatusResult.h
//  传智微博
//
//  Created by mac on 2018/1/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface CZStatusResult : NSObject<MJKeyValue>

/**
 *  用户的微博数组（CZStatus）
 */
@property(nonatomic,strong) NSArray *statuses;
@end
