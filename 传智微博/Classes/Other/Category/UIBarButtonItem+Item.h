//
//  UIBarButtonItem+Item.h
//  传智微博
//
//  Created by mac on 2017/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+(UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(nullable id)target action:(SEL)action ;

@end
