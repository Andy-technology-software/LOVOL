//
//  AppDelegate+AppService.m
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "AppDelegate+AppService.h"

#import "PageFirstIndexViewController.h"

#import "QuotationIndexViewController.h"

#import "BusinessIndexViewController.h"

#import "WorkIndexViewController.h"

#import "MineIndexViewController.h"

#import "LoginPageViewController.h"

#import "FeeCollectionPlanViewController.h"//费用收取计划

#import "MarginChargePlanViewController.h"//保证金收取计划

#import "QuoteHistoryViewController.h"//报价历史记录
@implementation AppDelegate (AppService)

#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [[UIButton appearance] setExclusiveTouch:YES];
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    if ([MyController returnStr:[MyController getUserid]].length) {
        [self setRootVC];
    }else {
//        [self setRootVC];
        [self setLoginRoot];
    }
    
}

+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)setupViewControllers{

    PageFirstIndexViewController *pageFirstIndexViewController = [[PageFirstIndexViewController alloc] init];
    UINavigationController *pageFirstNavigationController = [[UINavigationController alloc]
                                                         initWithRootViewController:pageFirstIndexViewController];

//    QuotationIndexViewController *quotationIndexViewController = [[QuotationIndexViewController alloc] init];
//    UINavigationController *quotationNavigationController = [[UINavigationController alloc]
//                                                                          initWithRootViewController:quotationIndexViewController];
    slideMenu = [[LYSSlideMenuController alloc] init];
    slideMenu.title = @"快速报价";
    slideMenu.isShowLiftBack = YES;
    
    UIButton* rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,25,25)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"历史报价"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(QuoteHistoryList)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    slideMenu.navigationItem.leftBarButtonItem = rightItem;
    
    
    UIButton* rightButton1 = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,25)];
    [rightButton1 setTitle:@"保存" forState:UIControlStateNormal];
    rightButton1.titleLabel.font = [UIFont systemFontOfSize:13];
    [rightButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightButton1 addTarget:self action:@selector(saveQuotationClick)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem1 = [[UIBarButtonItem alloc] initWithCustomView:rightButton1];
    slideMenu.navigationItem.rightBarButtonItem = rightItem1;
    
    QuotationIndexViewController *oneVC = [[QuotationIndexViewController alloc] init];
    FeeCollectionPlanViewController *twoVC = [[FeeCollectionPlanViewController alloc] init];
    MarginChargePlanViewController *threeVC = [[MarginChargePlanViewController alloc] init];
    
    slideMenu.controllers = @[oneVC,twoVC,threeVC];
    slideMenu.titles = @[@"基础信息",@"费用收取计划",@"保证金收取计划"];
    slideMenu.bottomLineWidth = 60;
    slideMenu.bottomLineHeight = 2;
    slideMenu.bottomLineColor = [MyController colorWithHexString:CNavBgColor];
    slideMenu.titleColor = [MyController colorWithHexString:@"9d9ea3"];
    slideMenu.titleSelectColor = [MyController colorWithHexString:CNavBgColor];
    UINavigationController *quotationNavigationController = [[UINavigationController alloc] initWithRootViewController:slideMenu];


    BusinessIndexViewController *businessIndexViewController = [[BusinessIndexViewController alloc] init];
    UINavigationController *businessIndexNavigationController = [[UINavigationController alloc]
                                                                     initWithRootViewController:businessIndexViewController];

    WorkIndexViewController *workIndexViewController = [[WorkIndexViewController alloc] init];
    UINavigationController *workIndexNavigationController = [[UINavigationController alloc]
                                                                   initWithRootViewController:workIndexViewController];

    MineIndexViewController *mineIndexViewController = [[MineIndexViewController alloc] init];
    UINavigationController *mineIndexNavigationController = [[UINavigationController alloc]
                                                             initWithRootViewController:mineIndexViewController];

    tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController.tabBar setHeight:[MyController tabBarHeight]];
    [tabBarController setViewControllers:@[pageFirstNavigationController,quotationNavigationController,
                                           businessIndexNavigationController,workIndexNavigationController,
                                           mineIndexNavigationController]];
    self.viewController = tabBarController;

    [self customizeTabBarForController:tabBarController];
}

#pragma mark - 保存快速报价响应
- (void)saveQuotationClick {
    DLog(@"保存快速报价信息");
    [HUD success:@"保存成功"];
}

#pragma mark - 快速报价历史
- (void)QuoteHistoryList {
    QuoteHistoryViewController* vc = [[QuoteHistoryViewController alloc] init];
    vc.title = @"快速报价历史";
    [slideMenu.navigationController pushViewController:vc animated:YES];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarControllers {
    UIImage *backgroundImage = [UIImage imageNamed:@"矩形-23"];
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"首页",@"报价",@"业务",@"工作",@"我的"];
//    NSArray *titleArr = @[@"首页",@"文化活动",@"智慧场馆",@"个人中心",@"个人中心"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarControllers tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@-触发",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = @"";
        index++;
        [item setBackgroundSelectedImage:backgroundImage withUnselectedImage:backgroundImage];

        item.selectedTitleAttributes=@{NSForegroundColorAttributeName:[MyController colorWithHexString:CNavBgColor]};
        item.unselectedTitleAttributes=@{NSForegroundColorAttributeName:[MyController colorWithHexString:@"525354"]};
        item.titlePositionAdjustment=UIOffsetMake(0, 5);
        [item setBackgroundColor:[MyController colorWithHexString:@"FFFFFF"]];

    }
}

- (void)setRootVC{
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        
        self.window.rootViewController = nil;
        self.viewController = nil;
        [self setupViewControllers];
        [self.window setRootViewController:self.viewController];
        
        [self.window makeKeyAndVisible];
        
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)setLoginRoot{
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userId"];
        [XRQJPush setAlias:@"" AndSeqNum:0];
        [[XRQJPush shareJPushManager] setBadge:0];
        LoginPageViewController* vc = [[LoginPageViewController alloc] init];
        self.window.rootViewController = vc;//[[UINavigationController alloc] initWithRootViewController:vc];
        
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        
    }];
}

@end

