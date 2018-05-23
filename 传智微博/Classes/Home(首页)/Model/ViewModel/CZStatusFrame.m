//
//  CZStatusFrame.m
//  传智微博
//
//  Created by mac on 2018/1/18.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZStatusFrame.h"
#import "CZConst.h"
#import "CZStatus.h"
@implementation CZStatusFrame

//代码折叠快捷键 option+command+向左的方向键
//代码打开折叠快捷键 option+command+向右的方向键
#pragma mark - 微博set方法
-(void)setStatus:(CZStatus *)status{
    
    _status = status;
    
    //1.原创微博Frame
    [self setUpOriginalStatusViewFrame];
    
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    //2.转发微博Frame
    if(_status.retweeted_status){
        
        [self setUpRetweetedStatusViewFrame];
        
        toolBarY = CGRectGetMaxY(_retweetedViewFrame);
    }
    //3.工具条Frame
     [self setUpToolBarFrame:toolBarY];
    
    //4.cell的高度
    
    _cellHeight = CGRectGetMaxY(_toolBarFrame);
}


#pragma mark - 计算原创微博的Frame
-(void)setUpOriginalStatusViewFrame{
    
    //头像
    CGFloat iconX = CZStatusCellMargin;
    CGFloat iconY = iconX;
    CGFloat iconWH = CZIconWH;
    _originalIconFrame =CGRectMake(iconX, iconY, iconWH, iconWH);
    //昵称
    CGFloat nameX = CGRectGetMaxX(_originalIconFrame) + CZStatusCellMargin;
    CGFloat nameY = iconY;

    CGSize nameSize =[self sizeWithText:_status.user.name font:CZNameFont];
    _originalNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    //会员
    if(_status.user.vip){
    CGFloat vipX = CGRectGetMaxX(_originalNameFrame) + CZStatusCellMargin;
    CGFloat vipY = iconY;
    CGFloat vipW = CZVipW;
    CGFloat vipH = nameSize.height;
    _originalVipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    }
    //时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_originalNameFrame) + CZStatusCellMargin * 0.5;
    CGSize timeSize = [self sizeWithText:_status.created_at font:CZTimeFont];
    
    _originalTimeFrame = (CGRect){{timeX,timeY},timeSize};

    //来源
    CGFloat soureX = CGRectGetMaxX(_originalTimeFrame) + CZStatusCellMargin;
    CGFloat soureY = timeY;
    CGSize soureSize = [self sizeWithText:_status.source font:CZSourceFont];
    
    _originalSourceFrame = (CGRect){{soureX,soureY},soureSize};
    //正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_originalIconFrame) + CZStatusCellMargin;
    CGFloat textW = CZScreenWidth - 2 * CZStatusCellMargin ;
    
    
    NSDictionary *textAttrs = @{NSFontAttributeName : CZTextFont};
    CGRect textRect = [_status.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin
        attributes:textAttrs context:nil];
    _originalTextFrame = CGRectMake(textX, textY, textW, textRect.size.height);

    
    //原微博frame
    CGFloat originalViewFrameX = 0;
    CGFloat originalViewFrameY = CZStatusCellMargin;
    CGFloat originalViewFrameW = CZScreenWidth;
    CGFloat originalViewFrameH =CGRectGetMaxY(_originalTextFrame) + CZStatusCellMargin;
    
    _originalViewFrame = CGRectMake(originalViewFrameX, originalViewFrameY, originalViewFrameW, originalViewFrameH);
 
    
}

#pragma mark - 计算转发微博的Frame
-(void)setUpRetweetedStatusViewFrame{
    
    //昵称
    CGFloat retweetedNameX = CZStatusCellMargin;
    CGFloat retweetedNameY = retweetedNameX;
//    NSString *retweetedName = [NSString stringWithFormat:@"@%@",_status.retweeted_status.user.name];
    CGSize retweetedNameSize = [self sizeWithText:_status.retweetedName font:CZNameFont];
    _retweetedNameFrame = (CGRect){{retweetedNameX,retweetedNameY},retweetedNameSize};
    
    //正文
    
    CGFloat retweetedTextX = CZStatusCellMargin;
    CGFloat retweetedTextY = CGRectGetMaxY(_retweetedNameFrame) + CZStatusCellMargin;
    CGFloat retweetedTextW = CZScreenWidth - 2 * CZStatusCellMargin;
    NSDictionary *textAttrs = @{NSFontAttributeName : CZTextFont};
    CGRect retweetedTextRect = [_status.retweeted_status.text boundingRectWithSize:CGSizeMake(retweetedTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin
                                                                        attributes:textAttrs context:nil];
    _retweetedTextFrame = CGRectMake(retweetedTextX,retweetedTextY,retweetedTextW, retweetedTextRect.size.height);
    
    //转发微博的frame
    CGFloat retweetX = 0;
    CGFloat retweetY = CGRectGetMaxY(_originalViewFrame);
    CGFloat retweetW = CZScreenWidth;
    CGFloat retweetH = CGRectGetMaxY(_retweetedTextFrame) + CZStatusCellMargin;
    _retweetedViewFrame  = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    
    

}

#pragma mark - 计算工具条的Frame
-(void)setUpToolBarFrame:(CGFloat)toolBarY{
    CGFloat toolBarX = 0;
    CGFloat toolBarW = CZScreenWidth;
    CGFloat toolBarH = CZToolBarH;
    
    _toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
}
#pragma mark - 设置文字的size
-(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font{
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize size = [text sizeWithAttributes:attrs];
    return size;
}




@end
