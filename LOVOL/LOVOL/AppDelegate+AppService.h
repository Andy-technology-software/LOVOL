//
//  AppDelegate+AppService.h
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate (AppService)
+ (AppDelegate *)shareAppDelegate;
-(void)initWindow;
- (void)setRootVC;
- (void)setLoginRoot;
@end
