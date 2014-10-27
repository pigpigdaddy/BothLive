//
//  URDeviceTool.h
//  CJSXY
//
//  Created by shen zhen on 13-7-18.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 iOS 设备现有的分辨率如下：
 iPhone/iPod Touch
 普通屏                         　 320像素 x 480像素       iPhone 1、3G、3GS，iPod Touch 1、2、3
 3：2 Retina 屏           　　640像素 x 960像素        iPhone 4、4S，iPod Touch 4
 16：9 Retina 屏               640像素 x 1136像素      iPhone 5，iPod Touch 5
 
 iPad
 普通屏         　　　　　　   768像素 x 1024像素      iPad 1， iPad2，iPad mini
 Retina屏     　　　　         1536像素 x 2048像素     New iPad，iPad 4
 UIDevice+Resolutions.h
 */

enum {
    // iPhone 1,3,3GS 标准分辨率(320x480px)
    UIDevice_iPhoneStandardRes      = 1,
    // iPhone 4,4S 高清分辨率(640x960px)
    UIDevice_iPhoneHiRes            = 2,
    // iPhone 5 高清分辨率(640x1136px)
    UIDevice_iPhoneTallerHiRes      = 3,
    // iPad 1,2 标准分辨率(1024x768px)
    UIDevice_iPadStandardRes        = 4,
    // iPad 3 High Resolution(2048x1536px)
    UIDevice_iPadHiRes              = 5
}; typedef NSUInteger UIDeviceResolution;

@interface URDeviceTool : NSObject

#pragma mark
#pragma mark==================================================
#pragma mark====================屏幕信息====================
#pragma mark==================================================

/******************************************************************************
 函数名称 : + (UIDeviceResolution) currentResolution
 函数描述 : 获取当前分辨率
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (UIDeviceResolution) currentResolution;

//获取屏幕高度
+(CGFloat)screenHeight;

#pragma mark
#pragma mark==================================================
#pragma mark====================设备信息=======================
#pragma mark==================================================

/******************************************************************************
 函数名称 : + (UIDeviceResolution) currentResolution
 函数描述 : 当前是否运行在iPhone5端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone5;
/******************************************************************************
 函数名称 : + (BOOL)isRunningOniPhone
 函数描述 : 当前是否运行在iPhone端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone;

/**
 *  获取设备的名字
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)deviceName;

/**
 *  获取设备的类型
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)deviceModel;

/**
 *  获取设备的系统的名字
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)systemName;
/**
 *  获取设备的系统的版本号
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)systemVersion;

/**
 *  获取设备的系统的版本号
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)identifier;


/**
 *  TODO:获取当前设备的类型，是iphone还是ipad
 *
 *  @return UIUserInterfaceIdiom
 *
 *  @author 沈桢
 *  @since
 */
+(UIUserInterfaceIdiom)userInterfaceIdiom;

/**
 *  TODO:获取应用程序的名称
 *
 *  @return
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)appName;

@end
