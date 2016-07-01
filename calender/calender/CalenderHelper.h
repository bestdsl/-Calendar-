//
//  CalenderHelper.h
//  calender
//
//  Created by 董诗磊 on 16/6/1.
//  Copyright © 2016年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalenderHelper : NSObject
@property(nonatomic,strong)NSArray * weekdys;
+(CalenderHelper*)calende;

#pragma mark - 计算给定日期所在月有多少天
- (NSRange)HowManyDayinThisMonth:(NSCalendar *)cleadar Date:(id )dateStr;

#pragma mark - 计算给定日期所在的这个月中的索引
//- (NSInteger)getIndexinmoutn:(NSCalendar *)cleadar Date:(id)dateStr;
#pragma mark - 对给定日期字符串进行格式化
-  (NSDate *)FormatDateStr:(NSString *)dateStr;

//计算给定月份第一天是星期几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date with:(NSString*)datestr;

@end
