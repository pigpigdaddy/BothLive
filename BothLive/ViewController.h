//
//  ViewController.h
//  BothLive
//

//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewControllerDelegate <NSObject>

- (void)sendToWXTimeLine:(NSString *)text;

- (void)sendToWXFriend:(NSString *)text;

@end

@interface ViewController : UIViewController

@property (nonatomic, weak)id<MainViewControllerDelegate> delegate;

/*!
 *  @Author pigpigdaddy, 14-10-30 15:10:24
 *
 *  @brief  重新开启主界面动画
 */
- (void)restartMenuViewAnimation;

@end
