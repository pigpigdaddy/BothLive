//
//  ViewController.m
//  BothLive
//
//  Created by 林峰 on 14-7-22.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@interface ViewController()<MySceneDelegate>
{
    
}

@property (nonatomic, strong)MyScene *scene;
@property (nonatomic, strong)UIView *welcomeView;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, assign)float timeCount;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
    [self showWelcomeView];
}

- (void)showWelcomeView
{
    if (!self.welcomeView) {
        self.welcomeView = [[UIView alloc] initWithFrame:self.view.bounds];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(60, 100, 200, 100);
        [button setTitle:@"开始！！！！！" forState:UIControlStateNormal];
        [self.welcomeView addSubview:button];
        [button addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.welcomeView];
        self.welcomeView.backgroundColor = [UIColor whiteColor];
    }
    self.welcomeView.hidden = NO;
}

- (void)startAction:(id)sender{
    [self startGame];
}

- (void)startGame
{
    self.welcomeView.hidden = YES;
    
    SKView * skView = (SKView *)self.view;
    self.scene = nil;
    
    self.scene = [MyScene sceneWithSize:skView.bounds.size];
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    self.scene.delegate = self;
    
    // Present the scene.
    [skView presentScene:self.scene];
    
    [self showTimeCount];
    self.timeCount = 0.0;
    [self startTime];
}

- (void)showTimeCount
{
    if (!self.label) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-100, 30, 100, 50)];
        [self.view addSubview:self.label];
    }
    self.label.text = @"0.0";
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)startTime
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(addTime) userInfo:nil repeats:YES];
}

- (void)addTime{
    self.timeCount++;
    self.label.text = [NSString stringWithFormat:@"%.1f", self.timeCount/10];
}

/*!
 *  TODO:撞了
 *
 *  @author 林峰
 */
- (void)crash
{
    // 停止计时
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    // 显示选择框 分享/取消
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"哇塞！简直不敢相信" message:[NSString stringWithFormat:@"你竟然坚持了 %@ 秒", self.label.text] delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"分享到微信", nil];
//    [alert show];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"哇塞！简直不敢相信" message:[NSString stringWithFormat:@"你竟然坚持了 %@ 秒", self.label.text] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];

    
    // 显示主界面
    self.welcomeView.hidden = NO;
}



@end