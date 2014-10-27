//
//  URDateTool.h
//  Steward
//
//  Created by shen zhen on 13-5-4.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URDateTool : NSObject

//函数作用 :date根据formatter转换成string
+(NSString*)dateToString:(NSString *)formatter date:(NSDate *)date;

//函数作用 :date根据formatter转换成string
+(NSString*)dateToString:(NSString *)formatter sece:(NSTimeInterval)sece;

//函数作用 :将日期字符串转换成date
+(NSDate *)stringToDate:(NSString *)formatter dateString:(NSString *)dateString;

//函数作用 :将日期字符串转换成时间戳
+(NSTimeInterval)stringToTimeInterval:(NSString *)formatter dateString:(NSString *)dateString;

@end
