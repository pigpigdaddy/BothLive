//
//  MenuListViewCell.m
//  BothLive
//
//  Created by 林峰 on 14-10-27.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import "MenuListViewCell.h"

@implementation MenuListViewCell

- (void)awakeFromNib {
    // Initialization code
    self.btnChoose.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*!
 *  @Author pigpigdaddy, 14-10-27 13:10:56
 *
 *  @brief  加载数据
 *
 *  @param data  数据
 */
- (void)loadData:(int)data
{
    self.index = data;
    UIImage *image = nil;
    switch (self.index) {
        case MENU_LIST_BUTTON_NAME_START:
        {
            image = [UIImage imageNamed:@"menu_view_list_btn_start.png"];
        }
            break;
        case MENU_LIST_BUTTON_NAME_BACK_TO_TOP:
        {
            image = [UIImage imageNamed:@""];
        }
            break;
        case MENU_LIST_BUTTON_NAME_GAME_NORMAL:
        {
            image = [UIImage imageNamed:@""];
        }
            break;
        case MENU_LIST_BUTTON_NAME_RANK_LIST:
        {
            image = [UIImage imageNamed:@"menu_view_list_btn_top.png"];
        }
            break;
            
        default:
            break;
    }
    
    [self.btnChoose setImage:image forState:UIControlStateNormal];
}

- (IBAction)buttonAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuListCellButtonDidTouched:)]) {
        [self.delegate menuListCellButtonDidTouched:self.index];
    }
}

@end
