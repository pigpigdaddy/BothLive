//
//  WXShareTool.h
//  Firefly
//
//  Created by pigpigdaddy on 14-5-27.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

// 分享到微信到何处
///*! @brief 请求发送场景
// *
// */
//enum WXScene {
//    
//    WXSceneSession  = 0,        /**< 聊天界面    */
//    WXSceneTimeline = 1,        /**< 朋友圈      */
//    WXSceneFavorite = 2,        /**< 收藏       */
//};
typedef enum {
    WXSHARE_SENCE_TYPE_SESSION = 0,
    WXSHARE_SENCE_TYPE_TIMELINE,
    WXSHARE_SENCE_TYPE_FAVORITE,
}WXSHARE_SENCE_TYPE;

#import <Foundation/Foundation.h>
#import "WXApi.h"

@protocol WXShareToolDelegate <NSObject>



@end

@interface WXShareTool : NSObject<WXApiDelegate>
/************************** 初始化方法 **************************/
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
- (id)initWithDelegate:(id)delegate registerAppID:(NSString *)appID withDescription:(NSString *)description;

/************************** application **************************/
/*!
 *  TODO:appDelegate中调用函数 设置回调和url
 *
 *  @param url
 *
 *  @return
 *
 *  @author pigpigdaddy
 */
- (BOOL)handleOpenURL:(NSURL *)url;

/************************** 发送消息相关 **************************/
/*!
 *  TODO:发送文字
 *
 *  @param text  文字内容
 *  @param sence 发到何处
 *
 *  @author pigpigdaddy
 */
- (void)sendTextContent:(NSString *)text withSence:(WXSHARE_SENCE_TYPE)sence;

/*!
 *  TODO:发送图片
 *
 *  @param imageData 图片data
 *  @param sence     发到何处
 *
 *  @author pigpigdaddy
 */
- (void)sendImageContent:(NSData *)imageData withSence:(WXSHARE_SENCE_TYPE)sence;

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
- (void)sendLinkContent:(NSString *)title description:(NSString *)description thumbImage:(NSData *)imageData linkURL:(NSString *)url scene:(WXSHARE_SENCE_TYPE)scene;



@end
