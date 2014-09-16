//
//  ViewController.m
//  BothLive
//
//  Created by pigpigdaddy on 14-7-22.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@interface ViewController()<MySceneDelegate, UIAlertViewDelegate>
{
    dispatch_source_t _timers;
}

@property (nonatomic, strong)MyScene *scene;
@property (nonatomic, strong)UIView *welcomeView;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, assign)float timeCount;
@property (nonatomic, strong)SKView *skView;

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
    
    self.skView = [[SKView alloc] initWithFrame:self.view.bounds];
    [self.view insertSubview:self.skView belowSubview:self.welcomeView];
    
    self.scene = [MyScene sceneWithSize:self.skView.bounds.size];
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    self.scene.delegate = self;
    
    // Present the scene.
    [self.skView presentScene:self.scene];
    
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
    self.label.text = @"0.00";
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
//    if (self.timer) {
//        [self.timer invalidate];
//        self.timer = nil;
//    }
//    self.timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(addTime) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    NSLog(@"主线程 %@", [NSThread currentThread]);
    //间隔还是2秒
    uint64_t interval = 0.01 * NSEC_PER_SEC;
    //创建一个专门执行timer回调的GCD队列
    dispatch_queue_t queue = dispatch_queue_create("my queue", 0);
    //创建Timer
    _timers = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //使用dispatch_source_set_timer函数设置timer参数
    dispatch_source_set_timer(_timers, dispatch_time(DISPATCH_TIME_NOW, 0), interval, 0);
    //设置回调
    __weak ViewController *blockSelf = self;
    dispatch_source_set_event_handler(_timers, ^()
    {
        NSLog(@"Timer %@", [NSThread currentThread]);
        [blockSelf addTime];
    });
    //dispatch_source默认是Suspended状态，通过dispatch_resume函数开始它
    dispatch_resume(_timers);
}

- (void)addTime{
    self.timeCount++;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.label.text = [NSString stringWithFormat:@"%.2f", self.timeCount/100];
    });
}

/*!
 *  TODO:撞了
 *
 *  @author pigpigdaddy
 */
- (void)crash
{
    // 停止计时
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    // 显示选择框 分享/取消
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"哇塞！简直不敢相信" message:[NSString stringWithFormat:@"你竟然坚持了 %@ 秒", self.label.text] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"分享到微信朋友圈", @"分享给微信好友", nil];
    [alert show];

    // 显示主界面
    self.welcomeView.hidden = NO;
    [self.skView removeFromSuperview];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(sendToWXTimeLine:)]) {
                [self.delegate sendToWXTimeLine:[NSString stringWithFormat:@"《跑酷好基友》哇塞！你坚持了 %@ 秒！！", self.label.text]];
            }
        }
            break;
        case 2:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(sendToWXFriend:)]) {
                [self.delegate sendToWXFriend:[NSString stringWithFormat:@"《跑酷好基友》哇塞！你坚持了 %@ 秒！！", self.label.text]];
            }
        }
            break;
            
        default:
            break;
    }
}



@end
