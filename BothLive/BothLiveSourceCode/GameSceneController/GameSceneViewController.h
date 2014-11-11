//
//  GameSceneViewController.h
//  BothLive
//
//  Created by 林峰 on 14-10-23.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

/*!
 *  @Author pigpigdaddy, 14-10-23 11:10:07
 *
 *  @brief  游戏场景控制器
 */

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@protocol GameSceneViewControllerDelegate <NSObject>

/*!
 *  @Author pigpigdaddy, 14-10-23 11:10:42
 *
 *  @brief  撞击了
 *
 *  @param position 撞击的跑酷小孩位置 从上到下index值 从1开始
 *  @param time     总持续时间
 */
- (void)runningCrash:(int)position totalTime:(NSString *)time;

@end

@interface GameSceneViewController : UIViewController

@property (nonatomic, assign)id<GameSceneViewControllerDelegate> delegate;



- (void)startGame;

- (void)stopGame;

@end
