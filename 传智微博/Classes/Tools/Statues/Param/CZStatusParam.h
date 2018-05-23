//
//  CZStatusParam.h
//  传智微博
//
//  Created by mac on 2018/1/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZStatusParam : NSObject

@property(nonatomic,copy) NSString *access_token;

/*若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0*/
@property(nonatomic,assign) NSUInteger since_id;

/*若指定此参数，则返回ID小于或等于max_id的微博，默认为0*/
@property(nonatomic,assign) NSUInteger max_id;

@end
