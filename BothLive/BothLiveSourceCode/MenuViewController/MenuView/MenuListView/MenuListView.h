//
//  MenuListView.h
//  BothLive
//
//  Created by 林峰 on 14-10-27.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

/*!
 *  @Author pigpigdaddy, 14-10-27 09:10:51
 *
 *  @brief  菜单选择界面
 */

#import <UIKit/UIKit.h>

@protocol MenuListViewDelegate <NSObject>

/*!
 *  @Author pigpigdaddy, 14-10-27 15:10:54
 *
 *  @brief  列表点击了某个按钮
 *
 *  @param menuIndex 按钮index
 */
- (void)buttonSelectAtIndex:(MENU_LIST_BUTTON_NAME)menuIndex;

@end

@interface MenuListView : UIView

@property (nonatomic, strong)NSArray *data;
@property (nonatomic, assign)id<MenuListViewDelegate> delegate;

/*!
 *  @Author pigpigdaddy, 14-10-27 09:10:57
 *
 *  @brief  初始化 （数据默认为两层结构，尚不支持三层结构）
 *
 *  @param frame
 *  @param delegate 回调对象
 *  @param data     数据
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id<MenuListViewDelegate>)delegate withData:(NSArray *)data;

@end
