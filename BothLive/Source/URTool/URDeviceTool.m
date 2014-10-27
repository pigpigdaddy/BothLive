//
//  URDeviceTool.m
//  CJSXY
//
//  Created by shen zhen on 13-7-18.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import "URDeviceTool.h"
#import <AdSupport/AdSupport.h>

@implementation URDeviceTool

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
+ (UIDeviceResolution) currentResolution {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
            if (result.height <= 480.0f)
                return UIDevice_iPhoneStandardRes;
            return (result.height > 960 ? UIDevice_iPhoneTallerHiRes : UIDevice_iPhoneHiRes);
        } else
            return UIDevice_iPhoneStandardRes;
    } else
        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ? UIDevice_iPadHiRes : UIDevice_iPadStandardRes);
}

//获取屏幕高度
+(CGFloat)screenHeight{
    return [[UIScreen mainScreen] bounds].size.height-20;
}


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
+ (BOOL)isRunningOniPhone5{
    if ([self currentResolution] == UIDevice_iPhoneTallerHiRes) {
        return YES;
    }
    return NO;
}

/******************************************************************************
 函数名称 : + (BOOL)isRunningOniPhone
 函数描述 : 当前是否运行在iPhone端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}


/**
 *  获取设备的名字
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)deviceName{
    UIDevice *device=[UIDevice currentDevice];
    return [device name];
}

/**
 *  获取设备的类型
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)deviceModel{
    UIDevice *device=[UIDevice currentDevice];
    return [device model];
}

/**
 *  获取设备的系统的名字
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)systemName{
    UIDevice *device=[UIDevice currentDevice];
    return [device systemName];
}

/**
 *  获取设备的系统的版本号
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)systemVersion{
    UIDevice *device=[UIDevice currentDevice];
    return [device systemVersion];
}

/**
 *  获取设备的系统的版本号
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)identifier{
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return adId;
}


/**
 *  TODO:获取当前设备的类型，是iphone还是ipad
 *
 *  @return UIUserInterfaceIdiom
 *
 *  @author 沈桢
 *  @since
 */
+(UIUserInterfaceIdiom)userInterfaceIdiom{
    UIDevice *device=[UIDevice currentDevice];
    UIUserInterfaceIdiom iom=[device userInterfaceIdiom];
    return iom;
}


/**
 *  TODO:获取应用程序的名称
 *
 *  @return
 *
 *  @author 沈桢
 *  @since
 */
+(NSString *)appName{
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    NSString *projectName = [dict objectForKey:@"CFBundleDisplayName"];
    return projectName;
}

@end
