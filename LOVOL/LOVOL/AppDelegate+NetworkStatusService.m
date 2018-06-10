//
//  AppDelegate+NetworkStatusService.m
//  LOVOL
//
//  Created by andyXu on 2018/4/26.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "AppDelegate+NetworkStatusService.h"

@implementation AppDelegate (NetworkStatusService)
- (void)getNetWorkStatus {
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType status) {
        switch (status) {
            case PPNetworkStatusUnknown:          //未知网络
                DLog(@"未知网络");
                break;
            case PPNetworkStatusNotReachable:    //无网络
                DLog(@"无网络");
                break;
            case PPNetworkStatusReachableViaWWAN://手机网络
                DLog(@"手机网络");
                break;
            case PPNetworkStatusReachableViaWiFi://WIFI
                DLog(@"WIFI网络");
                break;
        }
    }];
}
@end
