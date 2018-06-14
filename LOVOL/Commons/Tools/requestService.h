//
//  requestService.h
//  WhereAreYou
//
//  Created by lingnet on 2017/7/5.
//  Copyright © 2017年 徐仁强. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XRQRequestClient.h"
@interface requestService : NSObject

/**
 1.登录
 @param userName 用户名
 @param pw 密码
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postLoginWithUserName:(NSString*)userName pw:(NSString*)pw complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;








@end
