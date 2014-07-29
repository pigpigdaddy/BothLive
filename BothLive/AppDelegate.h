//
//  AppDelegate.h
//  BothLive
//
//  Created by pigpigdaddy on 14-7-22.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXShareTool.h"
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, WXShareToolDelegate, MainViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WXShareTool *wxShareTool;

@end
