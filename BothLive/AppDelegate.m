//
//  AppDelegate.m
//  BothLive
//
//  Created by pigpigdaddy on 14-7-22.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self registerWX];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *viewController = [[ViewController alloc] init];
    viewController.delegate = self;
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if ([self.window.rootViewController isKindOfClass:[ViewController class]]) {
        ViewController *viewController = (ViewController *)self.window.rootViewController;
        [viewController restartMenuViewAnimation];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark
#pragma mark ============ 社交分享 ============
/*!
 *  TODO:初始化微信分享工具
 *
 *  @author pigpigdaddy
 */
- (void)registerWX
{
    self.wxShareTool = [[WXShareTool alloc] initWithDelegate:self registerAppID:@"wxf4407a5089187214" withDescription:@"BothLive"];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [self.wxShareTool handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [self.wxShareTool handleOpenURL:url];
}

- (void)sendToWXTimeLine:(NSString *)text
{
    [self.wxShareTool sendLinkContent:text description:@"狂戳此链接下载本游戏" thumbImage:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Icon_120" ofType:@"png"]] linkURL:@"https://itunes.apple.com/us/app/pao-ku-hao-ji-you/id914554369?mt=8" scene:WXSHARE_SENCE_TYPE_TIMELINE];
}

- (void)sendToWXFriend:(NSString *)text
{
    [self.wxShareTool sendLinkContent:text description:@"狂戳此链接下载本游戏" thumbImage:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Icon_120" ofType:@"png"]] linkURL:@"https://itunes.apple.com/us/app/pao-ku-hao-ji-you/id914554369?mt=8" scene:WXSHARE_SENCE_TYPE_SESSION];
}

@end
