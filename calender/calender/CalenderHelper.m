//
//  CalenderHelper.m
//  calender
//
//  Created by 董诗磊 on 16/6/1.
//  Copyright © 2016年 董诗磊. All rights reserved.
//

#import "CalenderHelper.h"

@implementation CalenderHelper
+(CalenderHelper *)calende
{
    static CalenderHelper * helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[CalenderHelper alloc]init];
    });
    return helper;

}
- (NSRange)HowManyDayinThisMonth:(NSCalendar *)cleadar Date:(id )dateStr
{
    
    if ([dateStr isKindOfClass:[NSString class]]) {
        NSDate * newDate = [self FormatDateStr:dateStr];
       NSRange ThisMonth = [cleadar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:newDate];
        return ThisMonth;
    }else{
     NSRange ThisMonth = [cleadar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:dateStr];
    
        return ThisMonth;
    
    }
    
}
- (NSDate *)FormatDateStr:(NSString *)dateStr
{
    if (dateStr != nil) {
        NSDateFormatter * formart = [[NSDateFormatter alloc]init];
        [formart setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate * date =  [formart dateFromString:dateStr];
        return date;
    }
    return 0;
}

- (NSInteger)getIndexinMoutn:(NSCalendar *)cleadar Date:(id)dateStr
{
    if ([dateStr isKindOfClass:[NSString class]])
    {
        NSDate * newDate = [self FormatDateStr:dateStr];
        
        NSInteger Index = [cleadar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:newDate];
        
        return Index;
    }else{
        NSInteger Index = [cleadar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:dateStr];
        
        return Index;

    
    
    }


    return 0;

}
//计算给定月份第一天是星期几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)inputDate with:(NSString*)datestr
{
    
    if (datestr != nil)
    {
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        inputDate = [formatter dateFromString:datestr];
    }
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:inputDate];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    NSLog(@"---WOMENSADFDSFDSFDSFAS---%ld",firstWeekday - 1);
    
    return firstWeekday - 1;
   
    
    
}





















@end
