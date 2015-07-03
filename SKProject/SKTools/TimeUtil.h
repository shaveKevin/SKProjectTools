//
//  TimeUtil.h
//  
//
//  Created by shaveKevin on unknown.
//  Copyright (c) 2014年 shaveKevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtil : NSObject
+(NSString *)NowTimeString;
+(NSString *)Date2String:(NSDate *)date;
+(NSDate *)String2Date:(NSString *)strDate;
+(NSString *) DateShowTime:(NSDate*) date;
//与当前时间比较,返回分钟数
+(NSUInteger)DateToNow:(NSDate *)date;
//将一长串数字转为时间字符串

+(NSString *)convertNumber2Date:(NSString *)number;

//当时间超长时：style:0 只显示日期，1:只显示时间.2:显示日期和时间
+(NSString *)convertNumber2ShowDate:(NSString *)number Style:(NSInteger)style;
+(NSString *)convertNumber2ShowDate:(NSString *)number;
+(NSString *)date2Stmp:(NSDate *)date;
+(NSDate *)now;
+(NSDate *)stampToDate:(NSString *)stmp;
+(NSString *)ShowDate:(NSDate *)date Style:(NSInteger)style;
//班级圈时间显示
+(NSString *)ClassZoneShowDate:(NSDate *)date NewDate:(NSDate *)nowDate Style:(NSInteger)style;

+(NSString *)dateToShowTime:(NSString *)strDate;
+(BOOL)isMoreThanSeconds:(NSInteger)secondsCount;
+(NSString *)getTimeStmp;   //产生一个时间戳，精确到微秒，原子操作，保证在程序中每次得到的时间戳都不一样
@end
