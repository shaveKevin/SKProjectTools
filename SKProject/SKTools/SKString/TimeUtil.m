//
//  TimeUtil.m
//
//
//  Created by shaveKevin on unknown.
//  Copyright (c) 2014年 shaveKevin. All rights reserved.
//

#import "TimeUtil.h"

@implementation TimeUtil


+(BOOL)isMoreThanSeconds:(NSInteger)secondsCount{
    
     NSString *thistime=[NSString stringWithFormat:@"%f",(double)[[NSDate date] timeIntervalSince1970]*1000];
    
    NSString *lasttime=[[NSUserDefaults standardUserDefaults] objectForKey:@"lastReceive"];

    if([thistime doubleValue]-[lasttime doubleValue]>secondsCount){
        [[NSUserDefaults standardUserDefaults] setObject:thistime forKey:@"lastReceive"];
        return YES;
    }
    return NO;
}


+(NSString *)NowTimeString{
    NSDate *now = [[NSDate alloc] init];
    return [self Date2String:now];
}

+(NSString *)Date2String:(NSDate *)date{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* timeString = [dateFormat stringFromDate:date];
    return timeString;
}

+(NSDate *)String2Date:(NSString *)strDate{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
//    NSDate *destDate= [dateFormatter dateFromString:strDate];
//    return destDate;
    if ([strDate length] < 17) {
        return [self String2Date:strDate formatter:@"yyyy-MM-dd HH:mm"];
    }
    return [self String2Date:strDate formatter:@"yyyy-MM-dd HH:mm:ss"];
}

+(NSDate *)String2Date:(NSString *)strDate formatter:(NSString *)dateFromatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: dateFromatter];
    NSDate *destDate= [dateFormatter dateFromString:strDate];
    return destDate;
}
/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
+(NSString *) DateShowTime:(NSDate*) date
//
{
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

+(NSUInteger)DateToNow:(NSDate *)date{
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    return timeInterval;
}

+(NSString *)convertNumber2Date:(NSString *)number{
    if(number == nil || [number isEqual:[NSNull null]])
        return @"";

    if ([number length]<10) {
        return @"";
    }
    //去前10位
    NSString *numTime = [number substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[numTime doubleValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+(NSString *)convertNumber2ShowDate:(NSString *)number{
    if(number == nil || [number isEqual:[NSNull null]])
        return @"";
    
    if ([number length]<10) {
        return @"";
    }
    //去前10位
    NSString *numTime = [number substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[numTime doubleValue]];
    return [self ShowDate:confromTimesp];

}

+(NSString *)convertNumber2ShowDate:(NSString *)number Style:(NSInteger)style{
    if(number == nil || [number isEqual:[NSNull null]])
        return @"";
    
    if ([number length]<10) {
        return @"";
    }
    //去前10位
    NSString *numTime = [number substringToIndex:10];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[numTime doubleValue]];
    return [self ShowDate:confromTimesp Style:style];
}

//转时间戳
+(NSString *)date2Stmp:(NSDate *)date{
    NSTimeInterval ti = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld",(long)ti];
}

+(NSDate *)now{
    return [[NSDate alloc] init];
}

+(NSDate *)stampToDate:(NSString *)stmp{
    if(stmp == nil || [stmp isEqual:[NSNull null]])
        return nil;
    
    if ([stmp length]<10) {
        return nil;
    }
    //去前10位
    NSString *numTime = [stmp substringToIndex:10];
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[numTime doubleValue]];
    return confromTimesp;
}

//当时间超长时：style:0 只显示日期，1:只显示时间.2:显示日期和时间
+(NSString *)ShowDate:(NSDate *)date Style:(NSInteger)style{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDate *dayAfterYesterday = [cal dateByAddingComponents:components toDate: yesterday options:0];
    
//    NSTimeZone* localzone = [NSTimeZone localTimeZone];
//    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:localzone];
    //    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    NSString *strToday = [formatter stringFromDate:today];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    NSString *strDayafterYesterday = [formatter stringFromDate:dayAfterYesterday];
    
    NSString *strDay = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    if ([strDay isEqualToString:strToday]) {
        return time;
    } else if([strDay isEqualToString:strYesterday]){
        return [NSString stringWithFormat:@"昨天%@",time];
    }else if([strDay isEqualToString:strDayafterYesterday]){
        return [NSString stringWithFormat:@"前天%@",time];
    }else{
        if (style == 0) {
            [formatter setDateFormat:@"yyyy-MM-dd"];
        }else if(style == 1){
            [formatter setDateFormat:@"HH:mm"];
        }else{
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        }
        
        return [formatter stringFromDate:date];
    }
}

+(NSString *)ClassZoneShowDate:(NSDate *)date NewDate:(NSDate *)nowDate Style:(NSInteger)style
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDate *dayAfterYesterday = [cal dateByAddingComponents:components toDate: yesterday options:0];
    
//    NSTimeZone* localzone = [NSTimeZone localTimeZone];
//    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:localzone];
    //    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    NSString *strToday = [formatter stringFromDate:today];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    NSString *strDayafterYesterday = [formatter stringFromDate:dayAfterYesterday];
    
    NSString *strDay = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    if ([strDay isEqualToString:strToday]) {
        long dd = (long)([nowDate  timeIntervalSince1970] - [date timeIntervalSince1970]);
        if ( dd < 300) {
            return @"刚刚";
        }else if (dd >= 300 && dd <= 900){
            return [NSString stringWithFormat:@"%ld分钟前", dd/60];
        }else{
            return [NSString stringWithFormat:@"今天%@",time];
        }
    } else if([strDay isEqualToString:strYesterday]){
        return [NSString stringWithFormat:@"昨天%@",time];
    }else if([strDay isEqualToString:strDayafterYesterday]){
        return @"前天";
    }else{
        if (style == 0) {
            [formatter setDateFormat:@"yyyy-MM-dd"];
        }else if(style == 1){
            [formatter setDateFormat:@"HH:mm"];
        }else{
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        }
        
        return [formatter stringFromDate:date];
    }



}
+(NSString *)ShowDate:(NSDate *)date{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24];                                 
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDate *dayAfterYesterday = [cal dateByAddingComponents:components toDate: yesterday options:0];
    
//    NSTimeZone* localzone = [NSTimeZone localTimeZone];
//    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:localzone];
    //    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    NSString *strToday = [formatter stringFromDate:today];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    NSString *strDayafterYesterday = [formatter stringFromDate:dayAfterYesterday];
    
    NSString *strDay = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    if ([strDay isEqualToString:strToday]) {
        return time;
    } else if([strDay isEqualToString:strYesterday]){
        return [NSString stringWithFormat:@"昨天%@",time];
    }else if([strDay isEqualToString:strDayafterYesterday]){
        return [NSString stringWithFormat:@"前天%@",time];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        return [formatter stringFromDate:date];
    }
}

+(NSString *)dateToShowTime:(NSString *)strDate{
    NSDate *date = [TimeUtil String2Date:strDate];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDate *dayAfterYesterday = [cal dateByAddingComponents:components toDate: yesterday options:0];
    
//    NSTimeZone* localzone = [NSTimeZone localTimeZone];
//    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setTimeZone:localzone];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    NSString *strToday = [formatter stringFromDate:today];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    NSString *strDayafterYesterday = [formatter stringFromDate:dayAfterYesterday];
    
    NSString *strDay = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    
    if ([strDay isEqualToString:strToday]) {
        return time;
    } else if([strDay isEqualToString:strYesterday]){
        return [NSString stringWithFormat:@"昨天%@",time];
    }else if([strDay isEqualToString:strDayafterYesterday]){
        return [NSString stringWithFormat:@"前天%@",time];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        return [formatter stringFromDate:date];
    }
}

+(NSString *)getTimeStmp{
    //产生一个TaskId，时间戳，精确到微秒
    static NSObject *taskTimeObj = nil;
    static dispatch_once_t taskOnceToken;
    dispatch_once(&taskOnceToken, ^{
        taskTimeObj = [[NSObject alloc] init];
    });
    
    @synchronized(taskTimeObj){
        UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
        NSString *taskId = [NSString stringWithFormat:@"%llu",recordTime];
        return taskId;
    }
}
@end
