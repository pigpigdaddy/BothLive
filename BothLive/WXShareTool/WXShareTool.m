//
//  WXShareTool.m
//  Firefly
//
//  Created by pigpigdaddy on 14-5-27.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "WXShareTool.h"

@implementation WXShareTool
#pragma mark
#pragma mark ============life circle============
/*!
 *  TODO:初始化
 *
 *  @param delegate
 *  @param appID    app的ID
 *  @param description 描述
 *
 *  @return
 *
 *  @author pigpigdaddy
 */
- (id)initWithDelegate:(id)delegate registerAppID:(NSString *)appID withDescription:(NSString *)description
{
    self = [super init];
    if (self) {
        //
        [self registerWXApp:appID withDescription:description];
    }
    return self;
}

#pragma mark
#pragma mark ============注册相关============
/*!
 *  TODO:注册
 *
 *  @param appID @"wx6c6c98aa69d50ff0"
 *
 *  @author pigpigdaddy
 */
- (void)registerWXApp:(NSString *)appID withDescription:(NSString *)description
{
    [WXApi registerApp:appID withDescription:description];
}

#pragma mark
#pragma mark ============application============
/*!
 *  TODO:appDelegate中调用函数 设置回调和url
 *
 *  @param url
 *
 *  @return
 *
 *  @author pigpigdaddy
 */
- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark
#pragma mark ============WXApiDelegate============
/*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
 *
 * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
 * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
 * @param req 具体请求内容，是自动释放的
 */
-(void)onReq:(BaseReq*)req
{
    
}

/*! @brief 发送一个sendReq后，收到微信的回应
 *
 * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
 * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
 * @param resp具体的回应内容，是自动释放的
 */
-(void)onResp:(BaseResp*)resp
{
    
}

#pragma mark
#pragma mark ============发送消息相关============
/*!
 *  TODO:发送文字
 *
 *  @param text  文字内容
 *  @param sence 发到何处
 *
 *  @author pigpigdaddy
 */
- (void)sendTextContent:(NSString *)text withSence:(WXSHARE_SENCE_TYPE)sence
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.text = text;
    req.bText = YES;
    req.scene = sence;
    
    [WXApi sendReq:req];
}

/*!
 *  TODO:发送图片
 *
 *  @param imageData 图片data
 *  @param sence     发到何处
 *
 *  @author pigpigdaddy
 */
- (void)sendImageContent:(NSData *)imageData withSence:(WXSHARE_SENCE_TYPE)sence
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageWithData:imageData]];
    
    WXImageObject *ext = [WXImageObject object];
    ext.imageData = imageData;
    
    UIImage* image = [UIImage imageWithData:ext.imageData];
    ext.imageData = UIImagePNGRepresentation(image);
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = sence;
    
    [WXApi sendReq:req];
}

/*!
 *  TODO:发送链接
 *
 *  @param title        链接标题
 *  @param description  简单描述
 *  @param imageData    缩略图
 *  @param url          链接地址
 *  @param sence        发到何处
 *
 *  @author pigpigdaddy
 */
- (void)sendLinkContent:(NSString *)title description:(NSString *)description thumbImage:(NSData *)imageData linkURL:(NSString *)url scene:(WXSHARE_SENCE_TYPE)scene
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:[UIImage imageWithData:imageData]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = url;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    
    [WXApi sendReq:req];
}


@end
