//
//  URFileTool.h
//  Steward
//
//  Created by shen zhen on 13-5-4.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URFileTool : NSObject

#pragma mark
#pragma mark==================================================
#pragma mark====================获取文件大小====================
#pragma mark==================================================

/*!
 *  根据文件地址获取文件大小
 *
 *  @param filePath <#filePath description#>
 *
 *  @return <#return value description#>
 *
 *  @author gujun
 *  @since
 */
+(long long)getFileSize:(NSString *)filePath;

#pragma mark
#pragma mark==================================================
#pragma mark====================获取文件名称====================
#pragma mark==================================================
/*
 * 函数作用: 根据文件地址获取文件名称
 * 函数参数: filePath  文件路径
 * 函数返回值: 返回文件名称
 */
+(NSString *)getFileFullNameByPath:(NSString *)filePath;

/*
 * 函数作用: 根据文件地址获取文件名称
 * 函数参数: filePath  文件路径
 * 函数返回值: 返回文件类型
 */
+(NSString *)getFileTypeByPath:(NSString *)filePath;

/*
 * 函数作用: 根据文件地址获取文件名称
 * 函数参数: filePath  文件路径
 * 函数返回值: 返回文件类型
 */
+(NSString *)getFileNameByPath:(NSString *)filePath;

#pragma mark
#pragma mark==================================================
#pragma mark====================获取文件地址====================
#pragma mark==================================================

/*
 * 函数作用: 根据文件名称获取资源文件路径
 * 函数参数: filename  文件名称
 * 函数返回值: 返回资源文件路径
 */
+(NSString *)getBundleFile:(NSString *)fileName bundle:(NSBundle *)bundle;

/*
 * 函数作用: 根据文件名称获取资源文件路径
 * 函数参数: filename  文件名称
 *          bundleFilePath--bundle文件地址
 * 函数返回值: 返回资源文件路径
 */
+(NSString *)getBundleFile:(NSString *)fileName bundleFilePath:(NSString *)bundleFilePath;

/*
 * 函数作用: 根据文件名称获取资源文件路径
 * 函数参数: filename  文件名称
 * 函数返回值: 返回资源文件路径
 */
+(NSString *)getResourcesFile:(NSString *)fileName;
/*
 * 函数作用: 根据文件名称获取Doc目录中文件路径
 * 函数参数: fileName  文件名称
 * 函数返回值: 返回Doc目录中文件路径
 */
+(NSString *)getLocalFilePath:(NSString *) fileName;
/*
 * 函数作用: 根据文件名称获取缓存目录中文件路径
 * 函数参数: fileName  文件名称
 * 函数返回值: 返回Doc目录中文件路径
 */
+(NSString *)getCacheFilePath:(NSString *)fileName;
/*
 * 函数作用: 根据文件名称获取临时目录中文件路径
 * 函数参数: fileName  文件名称
 * 函数返回值: 返回Doc目录中文件路径
 */
+(NSString *)getTempFilePath:(NSString *)fileName;

#pragma mark
#pragma mark==================================================
#pragma mark====================删除文件=======================
#pragma mark==================================================
/*
 * 函数作用:  删除文件
 * 函数参数:  filepath 文件路径
 * 函数返回值: N/A
 */
+(void)removeFileByPath:(NSString *)filepath;

/*
 * 函数作用:  删除本地文件
 * 函数参数:  fileName 文件目录名称
 * 函数返回值: N/A
 */
+(void)removeLocalFileByName:(NSString *)fileName;

/*
 * 函数作用:  删除缓存文件
 * 函数参数:  fileName 文件目录名称
 * 函数返回值: N/A
 */
+(void)removeCacheFileByName:(NSString *)fileName;

/*
 * 函数作用:  删除临时文件
 * 函数参数:  fileName 文件目录名称
 * 函数返回值: N/A
 */
+(void)removeTempFileByName:(NSString *)fileName;

#pragma mark
#pragma mark==================================================
#pragma mark====================文件是否存在====================
#pragma mark==================================================
/*
 * 函数作用: 根据文件路径判断是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsFilePath:(NSString *)filePath;

/*
 * 函数作用: 判断本地文件是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsLocalFile:(NSString *)fileName;

/*
 * 函数作用: 判断临时文件是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsTempFile:(NSString *)fileName;

/*
 * 函数作用: 判断缓存文件是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsCacheFile:(NSString *)fileName;
/*
 * 函数作用: 判断资源文件是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsResourcesFile:(NSString *)fileName;

#pragma mark
#pragma mark==================================================
#pragma mark====================拷贝文件操作====================
#pragma mark==================================================
/*
 * 函数作用:  拷贝文件
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)copyFile:(NSString *)srcPath desPath:(NSString *)desPath;

/*
 * 函数作用:  拷贝文件到本地
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)copyFileToLocal:(NSString *)srcPath desName:(NSString *)desName;

/*
 * 函数作用:  拷贝文件临时目录
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)copyFileToTemp:(NSString *)srcPath desName:(NSString *)desName;

/*
 * 函数作用:  拷贝文件到缓存目录
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)copyFileToCache:(NSString *)srcPath desName:(NSString *)desName;

#pragma mark
#pragma mark==================================================
#pragma mark====================创建文件夹======================
#pragma mark==================================================
/*
 * 函数作用:  创建本地文件夹
 * 函数参数:
 * 函数返回值: N/A
 */
+(BOOL)createLocalDirectory:(NSString *)name;

/*
 * 函数作用:  创建本地文件夹
 * 函数参数:
 * 函数返回值: N/A
 */
+(BOOL)createDirectory:(NSString *)path;

#pragma mark
#pragma mark==================================================
#pragma mark====================剪贴文件操作====================
#pragma mark==================================================
/*
 * 函数作用:  拷贝文件
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)moveFile:(NSString *)srcPath desPath:(NSString *)desPath;

/*
 * 函数作用:  拷贝文件到本地
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)moveFileToLocal:(NSString *)srcPath desName:(NSString *)desName;

/*
 * 函数作用:  拷贝文件临时目录
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)moveFileToTemp:(NSString *)srcPath desName:(NSString *)desName;

/*
 * 函数作用:  拷贝文件到缓存目录
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)moveFileToCache:(NSString *)srcPath desName:(NSString *)desName;

@end
