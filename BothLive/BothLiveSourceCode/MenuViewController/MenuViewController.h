//
//  MenuViewController.h
//  BothLive
//
//  Created by 林峰 on 14-10-22.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

/*!
 *  @Author pigpigdaddy, 14-10-22 16:10:11
 *
 *  @brief  菜单界面的控制器
 */

#import <UIKit/UIKit.h>
#import "MenuView.h"

@protocol MenuViewControllerDelegate <NSObject>

//

@end

@interface MenuViewController : UIViewController

@property (nonatomic, strong)MenuView *menuView;
@property (nonatomic, assign)id<MenuViewControllerDelegate>delegate;

@end
