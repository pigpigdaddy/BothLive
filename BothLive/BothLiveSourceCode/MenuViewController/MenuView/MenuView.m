//
//  MenuView.m
//  BothLive
//
//  Created by 林峰 on 14-10-22.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import "MenuView.h"
#import "MenuListView.h"

@interface MenuView()<MenuListViewDelegate>

@property (nonatomic, strong) NSArray *menuListData;
@property (nonatomic, strong) MenuListView *menuListView;

@end

@implementation MenuView

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
- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id<MenuViewDelegate>)delegate menuData:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.delegate = delegate;
        [self initData:array];
        [self initView];
    }
    return self;
}

- (void)initData:(NSArray *)data
{
    self.menuListData = data;
}

- (void)initView
{
    [self initBgView];
    [self initListView];
}

- (void)initBgView
{
    self.menuAnimationView = [[MenuAnimationView alloc] initWithFrame:self.bounds];
    [self addSubview:self.menuAnimationView];
}

- (void)initListView
{
    self.menuListView = [[MenuListView alloc] initWithFrame:CGRectMake(0, self.center.y+70, self.frame.size.width, self.frame.size.height/3) withDelegate:self withData:self.menuListData];
    [self addSubview:self.menuListView];
}

#pragma mark
#pragma mark ============ MenuListViewDelegate ============
/*!
 *  @Author pigpigdaddy, 14-10-27 15:10:54
 *
 *  @brief  列表点击了某个按钮
 *
 *  @param menuIndex 按钮index
 */
- (void)buttonSelectAtIndex:(MENU_LIST_BUTTON_NAME)menuIndex
{
    switch (menuIndex) {
        case MENU_LIST_BUTTON_NAME_GAME_NORMAL:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(beginGame:)]) {
                [self.delegate beginGame:MENU_LIST_BUTTON_NAME_GAME_NORMAL];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
