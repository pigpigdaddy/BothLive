//
//  MenuListView.m
//  BothLive
//
//  Created by 林峰 on 14-10-27.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import "MenuListView.h"
#import "MenuListViewCell.h"

@interface MenuListView()<UITableViewDelegate, UITableViewDataSource, MenuListViewCellDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *currentListArray;

@end

@implementation MenuListView
#pragma mark
#pragma mark ============life circle============
/*!
 *  @Author pigpigdaddy, 14-10-27 09:10:57
 *
 *  @brief  初始化
 *
 *  @param frame
 *  @param delegate 回调对象
 *  @param data     数据
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id<MenuListViewDelegate>)delegate withData:(NSArray *)data
{
    self = [super init];
    if (self) {
        //
        [self initData:data];
        [self initView];
    }
    return self;
}

- (void)initData:(NSArray *)array
{
    self.data = array;
    self.currentListArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in self.data) {
        [self.currentListArray addObject:[[dict allKeys] firstObject]];
    }
    [self.currentListArray addObject:[NSString stringWithFormat:@"%d", MENU_LIST_BUTTON_NAME_RANK_LIST]];
}

- (void)initView
{
    [self initTableView];
}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"MenuListViewCell" bundle:nil] forCellReuseIdentifier:@"MenuListViewCell"];
    [self addSubview:self.tableView];
}

#pragma mark
#pragma mark ============ UITableViewDelegate, UITableViewDataSource ============

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.currentListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuListViewCell" forIndexPath:indexPath];
    
    cell.delegate = self;
    [cell loadData:[[self.currentListArray objectAtIndex:indexPath.row] intValue]];
    
    return cell;
}

#pragma mark
#pragma mark ============ MenuListViewCellDelegate ============
/*!
 *  @Author pigpigdaddy, 14-10-27 14:10:39
 *
 *  @brief  菜单按钮点击了
 *
 *  @param index 点击的index
 */
- (void)menuListCellButtonDidTouched:(int)index
{
    switch (index) {
        case MENU_LIST_BUTTON_NAME_START:
        {
            // 点击了“开始” 进入下一级菜单
            [self.currentListArray removeAllObjects];
            NSDictionary *dict = [self.data firstObject];
            NSArray *array = [[dict allValues] firstObject];
            [self.currentListArray addObjectsFromArray:array];
            [self.currentListArray addObject:[NSString stringWithFormat:@"%d", MENU_LIST_BUTTON_NAME_BACK_TO_TOP]];
            
            [self.tableView reloadData];
        }
            break;
        case MENU_LIST_BUTTON_NAME_BACK_TO_TOP:
        {
            // 点击了“返回” 返回首级菜单
            [self.currentListArray removeAllObjects];
            for (NSDictionary *dict in self.data) {
                [self.currentListArray addObject:[[dict allKeys] firstObject]];
            }
            [self.tableView reloadData];
        }
            break;
        case MENU_LIST_BUTTON_NAME_GAME_NORMAL:
        {
            // 点击了“普通模式” 进入普通游戏
            if (self.delegate && [self.delegate respondsToSelector:@selector(buttonSelectAtIndex:)]) {
                [self.delegate buttonSelectAtIndex:MENU_LIST_BUTTON_NAME_GAME_NORMAL];
            }
        }
            break;
        case MENU_LIST_BUTTON_NAME_RANK_LIST:
        {
            // 点击了“排行榜” 进入普通游戏
            if (self.delegate && [self.delegate respondsToSelector:@selector(buttonSelectAtIndex:)]) {
                [self.delegate buttonSelectAtIndex:MENU_LIST_BUTTON_NAME_RANK_LIST];
            }
        }
            break;
            
        default:
            break;
    }
}


@end
