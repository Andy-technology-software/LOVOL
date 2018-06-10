//
//  AppDelegate.h
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LYSSlideMenuController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    RDVTabBarController *tabBarController;
    LYSSlideMenuController *slideMenu;
}
@property (strong, nonatomic)UIViewController *viewController;
@property (strong, nonatomic)UIWindow *window;

@end


