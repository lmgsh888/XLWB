//
//  CZGuideTool.m
//  传智微博
//
//  Created by mac on 2018/1/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZGuideTool.h"
#import "CZNewFeatureController.h"
@implementation CZGuideTool

+ (void)guideRootViewController:(UIWindow *)window{
    //切换控制器
    CZNewFeatureController *featureVc = [[CZNewFeatureController alloc] init];
   
    window.rootViewController = featureVc;
}

@end
