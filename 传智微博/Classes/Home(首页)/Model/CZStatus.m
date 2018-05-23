//
//  CZStatuses.m
//  传智微博
//
//  Created by mac on 2018/1/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CZStatus.h"
#import "NSDate+MJ.h"
@implementation CZStatus

//<a href="http://app.weibo.com/t/feed/3auC5p" rel="nofollow">
//皮皮时光机</a>
-(void)setSource:(NSString *)source{
    
    NSLog(@"%@",source);
    
    NSString *sourse = @"";
    if([source isEqualToString:@""]){
        sourse =[NSString stringWithFormat:@"来自 %@",@"其它"];
        
    }else{
        NSRange range = [source rangeOfString:@">"];
        if(range.location !=NSNotFound && range.length !=0){
            
        NSString *leftString = [source substringFromIndex:range.location + range.length];
        NSUInteger toIndex = [leftString rangeOfString:@"<"].location;
        sourse =[NSString stringWithFormat:@"来自 %@",[leftString substringToIndex:toIndex]];
        
        }
    }
    _source = sourse;
    
}

//修改创建时间
-(NSString *)created_at{
    
    //日期格式字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSDate *create_at = [fmt dateFromString:_created_at];
    
    //是今年
    if([create_at isThisYear]){
        
        if([create_at isToday]){ //今天
            
            //计算当前时差
            NSDateComponents *cmp = [create_at deltaWithNow];
            if(cmp.hour >= 1){//几小时前
                
                return [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
            }else if(cmp.minute > 1){ //几分钟前

                return [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];
            }else{ //刚刚
                
                return @"刚刚";
            }
            
        }else if([create_at isYesterday]){ //昨天  HH:mm
            
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:create_at];
        }else{ //前天
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:create_at];
        }
        
    }else{ //非今年  yyyy-mm-dd HH:mm
      
        fmt.dateFormat = @"yyyy-mm-dd HH:mm";
        return [fmt stringFromDate:create_at];
        
    }
}




-(void)setRetweeted_status:(CZStatus *)retweeted_status{
    
    _retweeted_status = retweeted_status;
    
    _retweetedName = [NSString stringWithFormat:@"@%@",_retweeted_status.user.name];

}
@end
