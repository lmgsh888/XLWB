//
//  CZTitleButton.m
//  传智微博
//
//  Created by mac on 2017/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CZTitleButton.h"
#import "UIImage+Image.h"
#import "UIView+Frame.h"
@implementation CZTitleButton

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage stretchableImageWithImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
               
    }
    return self;
}
  int i = 1;
-(void)layoutSubviews{
    [super layoutSubviews];
    
//    NSLog(@"------%@",ns);
  NSLog(@"titel %f image %f",self.titleLabel.x,self.imageView.x);
  
    self.titleLabel.x = 0;
    //    NSLog(@"%@",self.imageView);
////    
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    
    
    // 1 0.000000 37.000000
    //   37.000000 74.000000
    NSLog(@"%@ image %f min %f",NSStringFromCGRect(self.titleLabel.frame),self.imageView.x,self.titleLabel.x);

 }

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}

@end
