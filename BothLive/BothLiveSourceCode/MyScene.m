//
//  MyScene.m
//  BothLive
//
//  Created by pigpigdaddy on 14-7-22.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor whiteColor];
        
        [self createBabyImageArray];
        [self createBaby];
//
        self.physicsWorld.gravity = CGVectorMake(0,0);
        self.physicsWorld.contactDelegate = self;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if (self.isCrash) {
        return;
    }
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if (location.y<self.size.height/2) {
            [self downBabyJump];
        }else{
            [self upBabyJump];
        }
    }
}

- (void)createBaby
{
    [self createUpBaby];
    [self createDownBaby];
}

- (void)createBabyImageArray
{
    // 跑
    SKTextureAtlas *babyRunAnimatedAtlas = [SKTextureAtlas atlasNamed:@"babyRun"];
    /* 创建存放每一帧图片的数组 */
    self.babyRunFrames = [NSMutableArray array];
    /* 将每一帧图片加进数组 */
    for (int i=1; i <= babyRunAnimatedAtlas.textureNames.count; i++) {
        NSString *textureName = [NSString stringWithFormat:@"r%d@2x.png", i];
        SKTexture *temp = [babyRunAnimatedAtlas textureNamed:textureName];
        [self.babyRunFrames addObject:temp];
    }
    
    // 跳
    SKTextureAtlas *babyJumpAnimatedAtlas = [SKTextureAtlas atlasNamed:@"babyJump"];
    /* 创建存放每一帧图片的数组 */
    self.babyJumpFrames = [NSMutableArray array];
    /* 将每一帧图片加进数组 */
    for (int i=1; i <= babyJumpAnimatedAtlas.textureNames.count; i++) {
        NSString *textureName = [NSString stringWithFormat:@"j%d@2x.png", i];
        SKTexture *temp = [babyJumpAnimatedAtlas textureNamed:textureName];
        [self.babyJumpFrames addObject:temp];
    }
    
    // 撞墙
    SKTextureAtlas *babyCrashAnimatedAtlas = [SKTextureAtlas atlasNamed:@"babyCrash"];
    /* 创建存放每一帧图片的数组 */
    self.babyCrashFrames = [NSMutableArray array];
    /* 将每一帧图片加进数组 */
    for (int i=1; i <= babyCrashAnimatedAtlas.textureNames.count; i++) {
        NSString *textureName = [NSString stringWithFormat:@"c%d@2x.png", i];
        SKTexture *temp = [babyCrashAnimatedAtlas textureNamed:textureName];
        [self.babyCrashFrames addObject:temp];
    }
    
    // 墙
    SKTextureAtlas *obstacleAnimatedAtlas = [SKTextureAtlas atlasNamed:@"obstacle"];
    /* 创建存放每一帧图片的数组 */
    self.obstacleFrames = [NSMutableArray array];
    /* 将每一帧图片加进数组 */
    for (int i=1; i <= obstacleAnimatedAtlas.textureNames.count; i++) {
        NSString *textureName = [NSString stringWithFormat:@"o%d@2x.png", i];
        SKTexture *temp = [obstacleAnimatedAtlas textureNamed:textureName];
        [self.obstacleFrames addObject:temp];
    }
}

- (void)createUpBaby
{
    SKTexture *temp = self.babyRunFrames[0];
    self.upBaby = [SKSpriteNode spriteNodeWithTexture:temp];
    self.upBaby.position = CGPointMake(BABY_X_POSITION, self.size.height/2+30);
    [self addChild:self.upBaby];
    
    /* 跑的动画 */
    SKAction *runAction = [SKAction repeatActionForever:
                           [SKAction animateWithTextures:self.babyRunFrames
                                            timePerFrame:0.05f
                                                  resize:NO
                                                 restore:YES]];
    [self.upBaby runAction:runAction withKey:BABY_ACTION_RUN];
    
    self.upBaby.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.upBaby.size.width/2];
    self.upBaby.physicsBody.dynamic = YES;
    self.upBaby.physicsBody.categoryBitMask = babyCategory;
    self.upBaby.physicsBody.contactTestBitMask = obstacleCategory;
    self.upBaby.physicsBody.collisionBitMask = 0;
    self.upBaby.physicsBody.usesPreciseCollisionDetection = YES;
}

- (void)createDownBaby
{
    SKTexture *temp = self.babyRunFrames[0];
    self.downBaby = [SKSpriteNode spriteNodeWithTexture:temp];
    self.downBaby.position = CGPointMake(BABY_X_POSITION, 30);
    [self addChild:self.downBaby];
    
//    /* 跑的动画 */
    SKAction *runAction = [SKAction repeatActionForever:
                           [SKAction animateWithTextures:self.babyRunFrames
                                            timePerFrame:0.05f
                                                  resize:NO
                                                 restore:YES]];
    [self.downBaby runAction:runAction withKey:BABY_ACTION_RUN];
    
    self.downBaby.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.downBaby.size.width/2];
    self.downBaby.physicsBody.dynamic = YES;
    self.downBaby.physicsBody.categoryBitMask = babyCategory;
    self.downBaby.physicsBody.contactTestBitMask = obstacleCategory;
    self.downBaby.physicsBody.collisionBitMask = 0;
    self.downBaby.physicsBody.usesPreciseCollisionDetection = YES;
}

#pragma mark
#pragma mark ============ handle jump event ============
- (void)downBabyJump
{
    if (self.isDownBabyAction) {
        return;
    }
    self.isDownBabyAction = YES;
    
    // 删除跑的动画
    [self.downBaby removeAllActions];
    
    /* 跳的动画 */
    SKAction *jumpAction = [SKAction animateWithTextures:self.babyJumpFrames
                                            timePerFrame:0.04f
                                                  resize:NO
                                                 restore:YES];
    float duration = 0.8;
    /* 向上移动的动画 */
    SKAction *moveUpAction = [SKAction moveTo:CGPointMake(self.downBaby.position.x, self.downBaby.position.y+BABY_JUMP_HEIGHT) duration:duration/2-0.04];
    SKAction *holdAction = [SKAction waitForDuration:0.08];
    SKAction *moveDownAction = [SKAction moveTo:CGPointMake(self.downBaby.position.x, self.downBaby.position.y) duration:duration/2-0.04];
    
    __weak MyScene *blockSelf = self;
    [self.downBaby runAction:[SKAction group:@[jumpAction, [SKAction sequence:@[moveUpAction, holdAction, moveDownAction]]]] completion:^{
        blockSelf.isDownBabyAction = NO;
        
        SKAction *runAction = [SKAction repeatActionForever:
                               [SKAction animateWithTextures:blockSelf.babyRunFrames
                                                timePerFrame:0.05f
                                                      resize:NO
                                                     restore:YES]];
        [blockSelf.downBaby runAction:runAction withKey:BABY_ACTION_RUN];
    }];
}

- (void)upBabyJump
{
    if (self.isUpBabyAction) {
        return;
    }
    self.isUpBabyAction = YES;
    
    // 删除跑的动画
    [self.upBaby removeAllActions];
    
    /* 跳的动画 */
    SKAction *jumpAction = [SKAction animateWithTextures:self.babyJumpFrames
                                            timePerFrame:0.04f
                                                  resize:NO
                                                 restore:YES];
    float duration = 0.8;
    /* 向上移动的动画 */
    SKAction *moveUpAction = [SKAction moveTo:CGPointMake(self.upBaby.position.x, self.upBaby.position.y+BABY_JUMP_HEIGHT) duration:duration/2-0.04];
    SKAction *holdAction = [SKAction waitForDuration:0.08];
    SKAction *moveDownAction = [SKAction moveTo:CGPointMake(self.upBaby.position.x, self.upBaby.position.y) duration:duration/2-0.04];
    
    __weak MyScene *blockSelf = self;
    [self.upBaby runAction:[SKAction group:@[jumpAction, [SKAction sequence:@[moveUpAction, holdAction, moveDownAction]]]] completion:^{
        blockSelf.isUpBabyAction = NO;
        /* 跑的动画 */
        SKAction *runAction = [SKAction repeatActionForever:
                               [SKAction animateWithTextures:blockSelf.babyRunFrames
                                                timePerFrame:0.05f
                                                      resize:NO
                                                     restore:YES]];
        [blockSelf.upBaby runAction:runAction withKey:BABY_ACTION_RUN];
    }];
}

- (void)addObstacle:(NSString *)upOrDown{
    // 创建怪物Sprite
    int i = (arc4random() % 8) + 1;
    SKTexture *temp = self.obstacleFrames[i-1];
    SKSpriteNode *obstacle = [SKSpriteNode spriteNodeWithTexture:temp];
    if (!self.obstacleNodes) {
        self.obstacleNodes = [NSMutableArray array];
    }
    [self.obstacleNodes addObject:obstacle];
    
    CGFloat yPoint = 0.0f;
    
    if ([upOrDown intValue] == 1) {
        // 上
        yPoint = self.frame.size.height/2+obstacle.size.height/2+15;
    }else{
        yPoint = obstacle.size.height/2+15;
    }
    obstacle.position = CGPointMake(self.frame.size.width + obstacle.size.width/2, yPoint);
    [self addChild:obstacle];
    
    // Create the actions
    SKAction * actionMove = [SKAction moveTo:CGPointMake(-obstacle.size.width/2, yPoint) duration:1.3];
    SKAction * actionMoveDone = [SKAction removeFromParent];
    __weak MyScene *blockSelf = self;
    [obstacle runAction:[SKAction sequence:@[actionMove, actionMoveDone]] completion:^{
        [blockSelf.obstacleNodes removeObject:obstacle];
        [obstacle removeFromParent];
    }];
    
    obstacle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:obstacle.size]; // 1
    obstacle.physicsBody.dynamic = YES; // 2
    obstacle.physicsBody.categoryBitMask = obstacleCategory; // 3
    obstacle.physicsBody.contactTestBitMask = babyCategory; // 4
    obstacle.physicsBody.collisionBitMask = 0; // 5
}

- (void)baby:(SKSpriteNode *)baby didCollideWithObstacle:(SKSpriteNode *)obstacle {
    NSLog(@"Hit");
    self.isCrash = YES;
    // 停止其他动画
    [self.downBaby removeAllActions];
    [self.upBaby removeAllActions];
    for (SKSpriteNode *node in self.obstacleNodes) {
        [node removeAllActions];
    }
    
//    // 展示撞击动画
//    SKAction *crashAction = [SKAction animateWithTextures:self.babyCrashFrames
//                                           timePerFrame:0.05f
//                                                 resize:NO
//                                                  restore:YES];
//    if (baby == self.upBaby) {
//        SKTexture *temp = self.babyCrashFrames[0];
////        self.upBaby= nil;
//        self.upBaby = [SKSpriteNode spriteNodeWithTexture:temp];
//        [self.upBaby runAction:crashAction];
//    }else{
//        SKTexture *temp = self.babyCrashFrames[0];
////        self.downBaby= nil;
//        self.downBaby = [SKSpriteNode spriteNodeWithTexture:temp];
//        [self.downBaby runAction:crashAction];
//    }
    
    
    // 回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(crash)]) {
        [self.delegate crash];
    }
}

- (void)didBeginContact:(SKPhysicsContact *)contact
{
    if (self.isCrash) {
        return;
    }
    SKPhysicsBody *firstBody, *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }

    if ((firstBody.categoryBitMask & obstacleCategory) != 0 && (secondBody.categoryBitMask & babyCategory) != 0)
    {
        [self baby:(SKSpriteNode *)secondBody.node didCollideWithObstacle:(SKSpriteNode *)firstBody.node];
    }
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 2) {
        self.lastSpawnTimeInterval = 0;
        
        // 决定两个障碍物在竖直方向上的出现时机 (从0.1s到0.9s)
        int secondSpace = (arc4random() % 9) + 1;
        float realSpace = (float)secondSpace/10;
        
        // 先上还是先下
        int upOrDown = (arc4random() % 2) + 1;
        if (upOrDown == 1) {
            [self addObstacle:@"1"];
            [self performSelector:@selector(addObstacle:) withObject:@"2" afterDelay:realSpace];
        }else{
            [self addObstacle:@"2"];
            [self performSelector:@selector(addObstacle:) withObject:@"1" afterDelay:realSpace];
        }
    }
}

- (void)update:(NSTimeInterval)currentTime {
    // Handle time delta.
    // If we drop below 60fps, we still want everything to move the same distance.
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    if (!self.isCrash) {
        [self updateWithTimeSinceLastUpdate:timeSinceLast];
    }
}

@end
