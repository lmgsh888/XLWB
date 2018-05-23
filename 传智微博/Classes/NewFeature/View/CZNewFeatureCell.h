//
//  CZNewFeatureCell.h
//  传智微博
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZNewFeatureCell : UICollectionViewCell

@property(nonatomic,strong) UIImage *image;

-(void)setIndexPath:(NSIndexPath *)indexPath count:(NSUInteger)count;
@end
