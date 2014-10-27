//
//  URCommonTool.h
//  OnlineClassTest
//
//  Created by shen zhen on 13-6-21.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URCommonTool : NSObject

/*
 * 函数作用: 获取uuid
 * 函数参数:
 * 函数返回值: uuid
 */
+(NSString *)uuid;

/*
 * 函数作用: 压缩图片
 * 函数参数:
 * 函数返回值:
 */
+(UIImage *)compressImage:(UIImage *)image width:(float)width height:(float)height;

//将string转换成MD5格式数据,需引进库<CommonCrypto/CommonDigest.h>
+ (NSString *)stringToMD5Value:(NSString *)string;

/*!
 *  得到截屏图像
 *
 *  @param view         view description
 *  @param isFullScreen 是否全屏
 *
 *  @return <#return value description#>
 *
 *  @author gujun
 *  @since
 */
+(UIImage *)getScreenImage:(UIView *)view isFullScreen:(BOOL)isFullScreen;

/*!
 *  把秒换算成  天时分秒
 *
 *  @param second <#second description#>
 *
 *  @return <#return value description#>
 *
 *  @author gujun
 *  @since
 */
+(NSString *)getFormatTime:(int)second;

@end
