//
//  GameSceneViewController.m
//  BothLive
//
//  Created by 林峰 on 14-10-23.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import "GameSceneViewController.h"
#import "MyScene.h"

@interface GameSceneViewController ()<MySceneDelegate>

@property (nonatomic, strong)SKView *skView;
@property (nonatomic, strong)MyScene *scene;
@property (nonatomic, assign)float timeCount;
@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation GameSceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startGame
{
    self.skView = [[SKView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.skView];
    
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

- (void)startTime
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(addTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    //
    //
    //    uint64_t interval = 0.01 * NSEC_PER_SEC;
    //    dispatch_queue_t queue = dispatch_queue_create("my queue", 0);
    //    _timers = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //    dispatch_source_set_timer(_timers, dispatch_time(DISPATCH_TIME_NOW, 0), interval, 0);
    //    __weak ViewController *blockSelf = self;
    //    dispatch_source_set_event_handler(_timers, ^()
    //    {
    //        [blockSelf addTime];
    //    });
    //    dispatch_resume(_timers);
    
    
    //    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(newThread) object:nil];
    //    [thread start];
}

- (void)addTime{
    self.timeCount++;
    self.label.text = [NSString stringWithFormat:@"%.2f", self.timeCount/100];
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //        self.label.text = [NSString stringWithFormat:@"%.2f", self.timeCount/100];
    //    });
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
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(runningCrash:totalTime:)]) {
        [self.delegate runningCrash:1 totalTime:self.label.text];
    }
}

@end
