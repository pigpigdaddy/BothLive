//
//  MenuAnimationView.m
//  BothLive
//
//  Created by linfeng on 14-10-29.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import "MenuAnimationView.h"

#define LIGHT_ANI_KEY            @"LightAnimation_Key"
#define BIG_CLOUD_ANI_KEY        @"BigCloudAnimation_Key"
#define SMALL_CLOUD_ANI_KEY      @"SmallCloudAnimation_Key"
#define UFO_ANI_KEY              @"UfoAnimationKey"
#define NAME_BIG_ANI_KEY         @"BigNameAnimationKey"


@interface MenuAnimationView()

@property (nonatomic, strong)UIImageView *imageViewLight;
@property (nonatomic, strong)UIImageView *imageViewBoy;
@property (nonatomic, strong)UIImageView *imageViewBigCloud;
@property (nonatomic, strong)UIImageView *imageViewSmallCloud;
@property (nonatomic, strong)UIImageView *imageViewUfo;
@property (nonatomic, strong)UIImageView *imageViewEngName;
@property (nonatomic, strong)UIImageView *imageViewChiNameBig;
@property (nonatomic, strong)UIImageView *imageViewChiNameSmall;
@property (nonatomic, strong)UIImageView *imageViewReflect;

@end

@implementation MenuAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self initView];
    }
    return self;
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:05
 *
 *  @brief  初始化界面
 */
- (void)initView
{
    [self initBGView];
    [self initClouds];
    [self initUFO];
    [self initBoy];
    [self initReflact];
    [self initName];
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:14
 *
 *  @brief  初始化倒影
 */
- (void)initReflact
{
    UIImage *image = [UIImage imageNamed:@"menu_animationView_reflact.png"];
    self.imageViewReflect = [[UIImageView alloc] initWithImage:image];
    self.imageViewReflect.frame = CGRectMake(self.center.x-160, self.center.y+25, image.size.width+4, image.size.height);
    [self addSubview:self.imageViewReflect];
    self.imageViewReflect.alpha = 0.0;
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:13
 *
 *  @brief  初始化app名
 */
- (void)initName
{
    UIImage *imagePao = [UIImage imageNamed:@"menu_animationView_letter_pao.png"];
    self.imageViewChiNameBig = [[UIImageView alloc] initWithImage:imagePao];
    self.imageViewChiNameBig.frame = CGRectMake(self.center.x-130, self.center.y-49+imagePao.size.height, imagePao.size.width, 1);
    [self addSubview:self.imageViewChiNameBig];
    
    UIImage *imageSmallName = [UIImage imageNamed:@"menu_animationView_letter_khjy.png"];
    self.imageViewChiNameSmall = [[UIImageView alloc] initWithImage:imageSmallName];
    self.imageViewChiNameSmall.frame = CGRectMake(self.center.x-43, self.center.y-9+imageSmallName.size.height, imageSmallName.size.width, 1);
    [self addSubview:self.imageViewChiNameSmall];
    
    UIImage *imageEngName = [UIImage imageNamed:@"menu_animationView_letter_eng.png"];
    self.imageViewEngName = [[UIImageView alloc] initWithImage:imageEngName];
    self.imageViewEngName.frame = CGRectMake(self.center.x+35, self.center.y-29, imageEngName.size.width, imageEngName.size.height);
    [self addSubview:self.imageViewEngName];
    self.imageViewEngName.alpha = 0.0;
    
    [self showNameAnimation];
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:23
 *
 *  @brief  初始化小人
 */
- (void)initBoy
{
    UIImage *imageBoy = [UIImage imageNamed:@"run1.png"];
    self.imageViewBoy = [[UIImageView alloc] initWithFrame:CGRectMake(self.center.x-15, self.center.y-63, imageBoy.size.width+15, imageBoy.size.height+24)];
    self.imageViewBoy.image = imageBoy;
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i<=20; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"run%d.png", i]]];
    }
    self.imageViewBoy.animationImages = images;
    [self addSubview:self.imageViewBoy];
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:29
 *
 *  @brief  初始化UFO
 */
- (void)initUFO
{
    UIImage *imageBigUFO = [UIImage imageNamed:@"menu_animationView_ufo.png"];
    self.imageViewUfo = [[UIImageView alloc] initWithImage:imageBigUFO];
    self.imageViewUfo.frame = CGRectMake(self.center.x-85, self.center.y-115, imageBigUFO.size.width, imageBigUFO.size.height);
    [self addSubview:self.imageViewUfo];
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:36
 *
 *  @brief  初始化云
 */
- (void)initClouds
{
    UIImage *imageBigCloud = [UIImage imageNamed:@"menu_animationView_cloud_large.png"];
    self.imageViewBigCloud = [[UIImageView alloc] initWithImage:imageBigCloud];
    self.imageViewBigCloud.frame = CGRectMake(-imageBigCloud.size.width, 110, imageBigCloud.size.width, imageBigCloud.size.height);
    [self addSubview:self.imageViewBigCloud];
    
    UIImage *imageSmallCloud = [UIImage imageNamed:@"menu_animationView_cloud_small.png"];
    self.imageViewSmallCloud = [[UIImageView alloc] initWithImage:imageSmallCloud];
    self.imageViewSmallCloud.frame = CGRectMake(self.bounds.size.width+imageSmallCloud.size.width, 160, imageSmallCloud.size.width, imageSmallCloud.size.height);
    [self addSubview:self.imageViewSmallCloud];
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:45
 *
 *  @brief  初始化背景图
 */
- (void)initBGView
{
    UIImage *imageSky = [UIImage imageNamed:@"menu_animationView_sky.png"];
    UIImageView *imageViewSky = [[UIImageView alloc] initWithImage:imageSky];
    imageViewSky.frame = self.bounds;
    [self addSubview:imageViewSky];
    
    UIImage *imageLight = [UIImage imageNamed:@"menu_animationView_light.png"];
    self.imageViewLight = [[UIImageView alloc] initWithImage:imageLight];
    self.imageViewLight.frame = CGRectMake(0, 0, imageLight.size.width, imageLight.size.height);
    self.imageViewLight.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2+30);
    [self addSubview:self.imageViewLight];
    
    UIImage *imageGround = [UIImage imageNamed:@"menu_animationView_ground.png"];
    UIImageView *imageViewGround = [[UIImageView alloc] initWithImage:imageGround];
    imageViewGround.frame = self.bounds;
    [self addSubview:imageViewGround];
}

/*!
 *  @Author pigpigdaddy, 14-10-30 16:10:15
 *
 *  @brief  应用名称的第一次展示，使用动画
 */
- (void)showNameAnimation
{
    __weak MenuAnimationView *BlockSelf = self;
    [UIView animateWithDuration:0.6 animations:^{
        //
        UIImage *imagePao = [UIImage imageNamed:@"menu_animationView_letter_pao.png"];
        BlockSelf.imageViewChiNameBig.frame = CGRectMake(BlockSelf.imageViewChiNameBig.frame.origin.x, BlockSelf.center.y-49, BlockSelf.imageViewChiNameBig.frame.size.width, imagePao.size.height);
        
        UIImage *imageSmallName = [UIImage imageNamed:@"menu_animationView_letter_khjy.png"];
        BlockSelf.imageViewChiNameSmall.frame = CGRectMake(BlockSelf.imageViewChiNameSmall.frame.origin.x, BlockSelf.center.y-9, BlockSelf.imageViewChiNameSmall.frame.size.width, imageSmallName.size.height);
    } completion:^(BOOL finished) {
        //
        [UIView animateWithDuration:0.6 animations:^{
            //
            BlockSelf.imageViewEngName.alpha = 1.0;
            BlockSelf.imageViewReflect.alpha = 1.0;
        } completion:^(BOOL finished) {
            //
        }];
    }];
}

/*!
 *  @Author pigpigdaddy, 14-10-29 22:10:27
 *
 *  @brief  开始动画
 */
- (void)startAnimation
{
    [self stopAnimation];
    [self.imageViewBoy startAnimating];
    [self startCloudAnimation:YES];
    [self startLightAnimation:YES];
    [self startUFOAnimation:YES];
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:23
 *
 *  @brief  开始或关闭 射线的动画
 *
 *  @param start 是否开始
 */
- (void)startLightAnimation:(BOOL)start
{
    if (start) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.toValue=[NSNumber numberWithFloat:-M_PI*2];
        
        // 设置其他动画属性
        animation.duration=6.0;
        animation.repeatCount=HUGE_VALF;
        
        [self.imageViewLight.layer addAnimation:animation forKey:LIGHT_ANI_KEY];
    }else{
        [self.imageViewLight.layer removeAllAnimations];
    }
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:17
 *
 *  @brief  开始或关闭 云朵的动画
 *
 *  @param start 是否开始
 */
- (void)startCloudAnimation:(BOOL)start
{
    if (start) {
        // 大云
        CABasicAnimation *animationBig = [CABasicAnimation animationWithKeyPath:@"position"];
        animationBig.toValue=[NSValue valueWithCGPoint:CGPointMake(self.imageViewBigCloud.layer.position.x+self.bounds.size.width+self.imageViewBigCloud.frame.size.width, self.imageViewBigCloud.layer.position.y)];
        
        // 设置其他动画属性
        animationBig.duration=10.0;
        animationBig.repeatCount=HUGE_VALF;
        
        [self.imageViewBigCloud.layer addAnimation:animationBig forKey:BIG_CLOUD_ANI_KEY];
        
        // 小云
        CABasicAnimation *animationSmall = [CABasicAnimation animationWithKeyPath:@"position"];
        animationSmall.toValue=[NSValue valueWithCGPoint:CGPointMake(0-self.imageViewSmallCloud.frame.size.width, self.imageViewSmallCloud.layer.position.y)];
        
        // 设置其他动画属性
        animationSmall.duration=5.0;
        animationSmall.repeatCount=HUGE_VALF;
        
        [self.imageViewSmallCloud.layer addAnimation:animationSmall forKey:SMALL_CLOUD_ANI_KEY];
    }else{
        [self.imageViewBigCloud.layer removeAllAnimations];
        [self.imageViewSmallCloud.layer removeAllAnimations];
    }
}

/*!
 *  @Author pigpigdaddy, 14-10-30 13:10:04
 *
 *  @brief  开始或关闭 UFO的动画
 *
 *  @param start 是否开始
 */
- (void)startUFOAnimation:(BOOL)start
{
    if (start) {
        CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        // 四个关键帧
        NSValue *key1=[NSValue valueWithCGPoint:self.imageViewUfo.layer.position];// 对于关键帧动画初始值不能省略
        NSValue *key2=[NSValue valueWithCGPoint:CGPointMake(self.imageViewUfo.layer.position.x, self.imageViewUfo.layer.position.y-12)];
        NSValue *key3=[NSValue valueWithCGPoint:CGPointMake(self.imageViewUfo.layer.position.x, self.imageViewUfo.layer.position.y+12)];
        NSValue *key4=[NSValue valueWithCGPoint:self.imageViewUfo.layer.position];
        NSArray *values=@[key1,key2,key3,key4];
        keyframeAnimation.values=values;
        // 设置其他属性
        keyframeAnimation.duration=2.0;
        keyframeAnimation.repeatCount=HUGE_VALF;
        
        // 添加动画到图层，添加动画后就会执行动画
        [self.imageViewUfo.layer addAnimation:keyframeAnimation forKey:UFO_ANI_KEY];
    }else{
        [self.imageViewUfo.layer removeAllAnimations];
    }
}

/*!
 *  @Author pigpigdaddy, 14-10-29 22:10:02
 *
 *  @brief  停止动画
 */
- (void)stopAnimation
{
    [self.imageViewBoy stopAnimating];
    [self startCloudAnimation:NO];
    [self startLightAnimation:NO];
    [self startUFOAnimation:NO];
}

@end
