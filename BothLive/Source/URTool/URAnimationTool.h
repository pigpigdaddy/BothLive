//
//  URAnimationTool.h
//  Steward
//
//  Created by shen zhen on 13-5-5.
//  Copyright (c) 2013年 沈桢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URAnimationTool : NSObject

+ (void)animationWithScale:(UIView *)view
                      time:(float)time
                startScale:(float)startScale
                  endScale:(float)endScale
                  selector:(SEL)selector
                  delegate:(id)delegate;

/**   函数名称 animationWithAlpha
 **   函数作用 :改变view的明暗
 **   函数参数 :
 **   函数返回值:
 **/

+ (void)animationWithAlpha:(UIView *)view
                      time:(float)time
                startAlpha:(float)startAlpha
                  endAlpha:(float)endAlpha
                  selector:(SEL)selector
                  delegate:(id)delegate;


/**   函数名称 :animationChangeFrameView:time:DestBounds:selector:delegate:
 **   函数作用 :改变view的Bounds 动画
 **   函数参数 : view：需要改变bounds的view time：动画时间 destBounds:view的最终bounds大小
 selector：动画结束后调用的方法 delegate:代理对象
 **   函数返回值:
 **/

+ (void)animationChangeFrameView:(UIView *)view
                            time:(float)time
                       DestFrame:(CGRect)destFrame
                        selector:(SEL)selector
                        delegate:(id)delegate;

@end
