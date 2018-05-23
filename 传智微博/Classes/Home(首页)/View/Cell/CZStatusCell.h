//
//  CZStatusCell.h
//  传智微博
//
//  Created by mac on 2018/1/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZStatusFrame;
@interface CZStatusCell : UITableViewCell

@property (nonatomic,strong) CZStatusFrame *statusFrame;


+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
