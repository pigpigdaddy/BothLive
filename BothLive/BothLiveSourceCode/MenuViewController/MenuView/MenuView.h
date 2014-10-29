//
//  MenuView.h
//  BothLive
//
//  Created by 林峰 on 14-10-22.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

/*!
 *  @Author pigpigdaddy, 14-10-22 16:10:57
 *
 *  @brief  菜单界面视图
 */

#import <UIKit/UIKit.h>
#import "MenuAnimationView.h"

@protocol MenuViewDelegate <NSObject>

/*!
 *  @Author pigpigdaddy, 14-10-27 15:10:06
 *
 *  @brief  开始游戏
 *
 *  @param gameType 游戏类型
 */
- (void)beginGame:(MENU_LIST_BUTTON_NAME)gameType;

@end

@interface MenuView : UIView

@property (nonatomic, assign) id<MenuViewDelegate> delegate;
@property (nonatomic, strong) MenuAnimationView *menuAnimationView;

/*!
 *  @Author pigpigdaddy, 14-10-27 15:10:15
 *
 *  @brief  初始化
 *
 *  @param frame
 *  @param delegate
 *  @param array    菜单数据
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id<MenuViewDelegate>)delegate menuData:(NSArray *)array;

@end
