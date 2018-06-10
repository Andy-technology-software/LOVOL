//
//  XRQJPush.h
//  XRQJPush
//
//  Created by lingnet on 2017/10/16.
//  Copyright © 2017年 徐仁强. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface XRQJPush : NSObject

+(XRQJPush *)shareJPushManager;

//设置别名
+(void)setAlias:(NSString*)alias AndSeqNum:(NSInteger)seqNum;

//设置标签
+(void)setTags:(NSString*)tags AndSeqNum:(NSInteger)seqNum;

// 在应用启动的时候调用
- (void)setupWithOption:(NSDictionary *)launchingOption
                     appKey:(NSString *)appKey
                    channel:(NSString *)channel
           apsForProduction:(BOOL)isProduction
      advertisingIdentifier:(NSString *)advertisingId;

// 在appdelegate注册设备处调用
- (void)registerDeviceToken:(NSData *)deviceToken;

//设置角标
- (void)setBadge:(int)badge;

//获取注册ID
- (void)getRegisterIDCallBack:(void(^)(NSString *registerID))completionHandler;

//处理推送信息
- (void)handleRemoteNotification:(NSDictionary *)remoteInfo;

@end
