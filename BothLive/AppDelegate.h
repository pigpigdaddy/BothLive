//
//  AppDelegate.h
//  BothLive
//
//  Created by pigpigdaddy on 14-7-22.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXShareTool.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, WXShareToolDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WXShareTool *wxShareTool;

@end
