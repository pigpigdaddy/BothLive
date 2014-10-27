//
//  MenuListViewCell.h
//  BothLive
//
//  Created by 林峰 on 14-10-27.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuListViewCellDelegate <NSObject>

/*!
 *  @Author pigpigdaddy, 14-10-27 14:10:39
 *
 *  @brief  菜单按钮点击了
 *
 *  @param index 点击的index
 */
- (void)menuListCellButtonDidTouched:(int)index;

@end

@interface MenuListViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btnChoose;
@property (nonatomic, assign) int index;

@property (nonatomic, assign) id<MenuListViewCellDelegate> delegate;

/*!
 *  @Author pigpigdaddy, 14-10-27 13:10:56
 *
 *  @brief  加载数据
 *
 *  @param data  数据
 */
- (void)loadData:(int)data;

@end
