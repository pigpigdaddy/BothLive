//
//  URSoundTool.m
//  XueBa
//
//  Created by shen zhen on 13-10-1.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import "URSoundTool.h"
#import <AudioToolbox/AudioToolbox.h> 

@implementation URSoundTool

/**   函数名称 :
 **   函数作用 :播放声音
 **   函数参数 :
 **   函数返回值:
 **/
+(void) playSound:(NSString *)name{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&soundID);
    AudioServicesPlaySystemSound(soundID);
}

@end
