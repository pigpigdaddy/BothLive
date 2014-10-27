//
//  URDateTool.m
//  Steward
//
//  Created by shen zhen on 13-5-4.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import "URDateTool.h"

@implementation URDateTool

//函数作用 :date根据formatter转换成string
+(NSString*)dateToString:(NSString *)formatter date:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return[dateFormatter stringFromDate:date];
}

//函数作用 :date根据formatter转换成string
+(NSString*)dateToString:(NSString *)formatter sece:(NSTimeInterval)sece
{
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:sece];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return[dateFormatter stringFromDate:date];
}

//函数作用 :将日期字符串转换成date
+(NSDate *)stringToDate:(NSString *)formatter dateString:(NSString *)dateString{
	NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:formatter];
	return [dateFormatter dateFromString:dateString];
}

//函数作用 :将日期字符串转换成时间戳
+(NSTimeInterval)stringToTimeInterval:(NSString *)formatter dateString:(NSString *)dateString{
	NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:formatter];
	NSDate *date=[dateFormatter dateFromString:dateString];
    return [date timeIntervalSince1970];
}

@end
