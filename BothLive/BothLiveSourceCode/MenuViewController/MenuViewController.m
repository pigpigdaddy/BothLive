//
//  MenuViewController.m
//  BothLive
//
//  Created by 林峰 on 14-10-22.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong)NSArray *listDataArray;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData
{
    [self initMenuListData];
}

- (void)initView
{
    
}

- (void)initMenuListData
{
    self.listDataArray = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", MENU_LIST_BUTTON_NAME_GAME_NORMAL], nil], [NSString stringWithFormat:@"%d", MENU_LIST_BUTTON_NAME_START], nil], [NSDictionary dictionaryWithObjectsAndKeys:[NSArray array], [NSString stringWithFormat:@"%d", MENU_LIST_BUTTON_NAME_RANK_LIST], nil], nil];
}

@end
