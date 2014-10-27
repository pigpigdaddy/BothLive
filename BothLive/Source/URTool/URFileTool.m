//
//  URFileTool.m
//  Steward
//
//  Created by shen zhen on 13-5-4.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import "URFileTool.h"
#import "URDeviceTool.h"

@implementation URFileTool

#pragma mark
#pragma mark==================================================
#pragma mark====================获取文件大小====================
#pragma mark==================================================

+(long long)getFileSize:(NSString *)filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

#pragma mark
#pragma mark==================================================
#pragma mark====================获取文件名称====================
#pragma mark==================================================
/*
 * 函数作用: 根据文件地址获取文件名称
 * 函数参数: filePath  文件路径
 * 函数返回值: 返回文件名称
 */
+(NSString *)getFileFullNameByPath:(NSString *)filePath{
    if (filePath==nil || filePath.length==0) return nil;
    
    NSArray *array=[filePath componentsSeparatedByString:@"/"];
    if (array.count==0) return filePath;
    
    NSString *name=[array objectAtIndex:array.count-1];
    return name;
}

/*
 * 函数作用: 根据文件地址获取文件名称
 * 函数参数: filePath  文件路径
 * 函数返回值: 返回文件类型
 */
+(NSString *)getFileTypeByPath:(NSString *)filePath{
    NSString *name=[self getFileFullNameByPath:filePath];
    if (name==nil) return nil;
    
    NSArray *array=[name componentsSeparatedByString:@"."];
    if (array.count==0) return nil;
    
    NSString *type=[array objectAtIndex:array.count-1];
    return type;
}

/*
 * 函数作用: 根据文件地址获取文件名称
 * 函数参数: filePath  文件路径
 * 函数返回值: 返回文件类型
 */
+(NSString *)getFileNameByPath:(NSString *)filePath{
    NSString *name=[self getFileFullNameByPath:filePath];
    if (name==nil) return nil;
    
    NSArray *array=[name componentsSeparatedByString:@"."];
    if (array.count==0) return name;
    
    NSString *value=[array objectAtIndex:0];
    return value;
}

#pragma mark
#pragma mark==================================================
#pragma mark====================获取文件地址====================
#pragma mark==================================================

/*
 * 函数作用: 根据文件名称获取资源文件路径
 * 函数参数: filename  文件名称
 * 函数返回值: 返回资源文件路径
 */
+(NSString *)getBundleFile:(NSString *)fileName bundle:(NSBundle *)bundle{
	return [bundle pathForResource:fileName ofType:nil];
}

/*
 * 函数作用: 根据文件名称获取资源文件路径
 * 函数参数: filename  文件名称
 *          bundleFilePath--bundle文件地址
 * 函数返回值: 返回资源文件路径
 */
+(NSString *)getBundleFile:(NSString *)fileName bundleFilePath:(NSString *)bundleFilePath{
    NSBundle *bundle=[NSBundle bundleWithPath:bundleFilePath];
    [bundle load];
	return [bundle pathForResource:fileName ofType:nil];
}

/*
 * 函数作用: 根据文件名称获取资源文件路径
 * 函数参数: filename  文件名称
 * 函数返回值: 返回资源文件路径
 */
+(NSString *)getResourcesFile:(NSString *)fileName{
    NSString *filePath=nil;
    filePath=[[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    
    return filePath;
}


/*
 * 函数作用: 根据文件名称获取Doc目录中文件路径
 * 函数参数: fileName  文件名称
 * 函数返回值: 返回Doc目录中文件路径
 */
+(NSString *)getLocalFilePath:(NSString *) fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
	return [NSString stringWithFormat:@"%@/%@", docDir,fileName];
}

/*
 * 函数作用: 根据文件名称获取缓存目录中文件路径
 * 函数参数: fileName  文件名称
 * 函数返回值: 返回Doc目录中文件路径
 */
+(NSString *)getCacheFilePath:(NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    return [NSString stringWithFormat:@"%@/%@",cachesDir,fileName];
}

/*
 * 函数作用: 根据文件名称获取临时目录中文件路径
 * 函数参数: fileName  文件名称
 * 函数返回值: 返回Doc目录中文件路径
 */
+(NSString *)getTempFilePath:(NSString *)fileName{
    NSString *tmpDir =  NSTemporaryDirectory();
    return [NSString stringWithFormat:@"%@/%@",tmpDir,fileName];
}

#pragma mark
#pragma mark==================================================
#pragma mark====================删除文件=======================
#pragma mark==================================================
/*
 * 函数作用:  删除文件
 * 函数参数:  filepath 文件路径
 * 函数返回值: N/A
 */
+(void)removeFileByPath:(NSString *)filepath{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm removeItemAtPath:filepath error:nil];
}

/*
 * 函数作用:  删除本地文件
 * 函数参数:  fileName 文件目录名称
 * 函数返回值: N/A
 */
+(void)removeLocalFileByName:(NSString *)fileName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm removeItemAtPath:[self getLocalFilePath:fileName] error:nil];
}

/*
 * 函数作用:  删除缓存文件
 * 函数参数:  fileName 文件目录名称
 * 函数返回值: N/A
 */
+(void)removeCacheFileByName:(NSString *)fileName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm removeItemAtPath:[self getCacheFilePath:fileName] error:nil];
}

/*
 * 函数作用:  删除临时文件
 * 函数参数:  fileName 文件目录名称
 * 函数返回值: N/A
 */
+(void)removeTempFileByName:(NSString *)fileName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm removeItemAtPath:[self getTempFilePath:fileName] error:nil];
}

#pragma mark
#pragma mark==================================================
#pragma mark===================文件是否存在=====================
#pragma mark==================================================
/*
 * 函数作用: 根据文件路径判断是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsFilePath:(NSString *)filePath{
	NSFileManager *fm = [NSFileManager defaultManager];
	return [fm fileExistsAtPath:filePath];
}

/*
 * 函数作用: 判断本地文件是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsLocalFile:(NSString *)fileName{
	NSFileManager *fm = [NSFileManager defaultManager];
	return [fm fileExistsAtPath:[self getLocalFilePath:fileName]];
}

/*
 * 函数作用: 判断临时文件是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsTempFile:(NSString *)fileName{
	NSFileManager *fm = [NSFileManager defaultManager];
	return [fm fileExistsAtPath:[self getTempFilePath:fileName]];
}

/*
 * 函数作用: 判断缓存文件是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsCacheFile:(NSString *)fileName{
	NSFileManager *fm = [NSFileManager defaultManager];
	return [fm fileExistsAtPath:[self getCacheFilePath:fileName]];
}

/*
 * 函数作用: 判断资源文件是否存在
 * 函数参数: filePath 文件目录名称
 * 函数返回值: 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsResourcesFile:(NSString *)fileName{
	NSFileManager *fm = [NSFileManager defaultManager];
	return [fm fileExistsAtPath:[self getResourcesFile:fileName]];
}

#pragma mark
#pragma mark==================================================
#pragma mark====================拷贝文件操作====================
#pragma mark==================================================
/*
 * 函数作用:  拷贝文件
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)copyFile:(NSString *)srcPath desPath:(NSString *)desPath{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm copyItemAtPath:srcPath toPath:desPath error:nil];
}

/*
 * 函数作用:  拷贝文件到本地
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)copyFileToLocal:(NSString *)srcPath desName:(NSString *)desName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm copyItemAtPath:srcPath toPath:[self getLocalFilePath:desName] error:nil];
}

/*
 * 函数作用:  拷贝文件临时目录
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)copyFileToTemp:(NSString *)srcPath desName:(NSString *)desName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm copyItemAtPath:srcPath toPath:[self getTempFilePath:desName] error:nil];
}

/*
 * 函数作用:  拷贝文件到缓存目录
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)copyFileToCache:(NSString *)srcPath desName:(NSString *)desName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm copyItemAtPath:srcPath toPath:[self getCacheFilePath:desName] error:nil];
}

#pragma mark
#pragma mark==================================================
#pragma mark====================创建文件夹======================
#pragma mark==================================================
/*
 * 函数作用:  创建本地文件夹
 * 函数参数:
 * 函数返回值: N/A
 */
+(BOOL)createLocalDirectory:(NSString *)name{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *filePath=[self getLocalFilePath:name];
    if ([self isExistsFilePath:filePath]) {
        return NO;
    }
    
    return [fm createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
}

/*
 * 函数作用:  创建本地文件夹
 * 函数参数:
 * 函数返回值: N/A
 */
+(BOOL)createDirectory:(NSString *)path{
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([self isExistsFilePath:path]) {
        return NO;
    }
    
    return [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}

#pragma mark
#pragma mark==================================================
#pragma mark====================剪贴文件操作====================
#pragma mark==================================================
/*
 * 函数作用:  拷贝文件
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)moveFile:(NSString *)srcPath desPath:(NSString *)desPath{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm moveItemAtPath:srcPath toPath:desPath error:nil];
}

/*
 * 函数作用:  拷贝文件到本地
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)moveFileToLocal:(NSString *)srcPath desName:(NSString *)desName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm moveItemAtPath:srcPath toPath:[self getLocalFilePath:desName] error:nil];
}

/*
 * 函数作用:  拷贝文件临时目录
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)moveFileToTemp:(NSString *)srcPath desName:(NSString *)desName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm moveItemAtPath:srcPath toPath:[self getTempFilePath:desName] error:nil];
}

/*
 * 函数作用:  拷贝文件到缓存目录
 * 函数参数:
 * 函数返回值: N/A
 */
+(void)moveFileToCache:(NSString *)srcPath desName:(NSString *)desName{
	NSFileManager *fm = [NSFileManager defaultManager];
	[fm moveItemAtPath:srcPath toPath:[self getCacheFilePath:desName] error:nil];
}

@end
