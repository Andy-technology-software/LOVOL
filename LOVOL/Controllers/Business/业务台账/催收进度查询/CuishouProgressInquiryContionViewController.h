//
//  CuishouProgressInquiryContionViewController.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RootViewController.h"
@protocol CuishouProgressInquiryContionViewControllerDelegate <NSObject>
- (void)sendBackHtbh:(NSString*)htbh czr:(NSString*)czr jxs:(NSString*)jxs;
@end
@interface CuishouProgressInquiryContionViewController : RootViewController
@property(nonatomic,weak)id<CuishouProgressInquiryContionViewControllerDelegate>CuishouProgressInquiryContionViewControllerDelegate;
@end
