//
//  MenuAnimationView.m
//  BothLive
//
//  Created by linfeng on 14-10-29.
//  Copyright (c) 2014年 林峰. All rights reserved.
//

#import "MenuAnimationView.h"

@interface MenuAnimationView()

@property (nonatomic, strong)UIImageView *imageViewLight;
@property (nonatomic, strong)UIImageView *imageViewBoy;
@property (nonatomic, strong)UIImageView *imageViewBigCloud;
@property (nonatomic, strong)UIImageView *imageViewSmallCloud;
@property (nonatomic, strong)UIImageView *imageViewUfo;
@property (nonatomic, strong)UIImageView *imageViewEngName;
@property (nonatomic, strong)UIImageView *imageViewChiNameBig;
@property (nonatomic, strong)UIImageView *imageViewChiNameSmall;

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

- (void)initView
{
    [self initBGView];
}

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
 *  @Author pigpigdaddy, 14-10-29 22:10:27
 *
 *  @brief  开始动画
 */
- (void)startAnimation
{
    
}

/*!
 *  @Author pigpigdaddy, 14-10-29 22:10:02
 *
 *  @brief  停止动画
 */
- (void)stopAnimation
{
    
}

@end
