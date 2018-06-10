//
//  litigationProgressInquiryConditionViewController.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RootViewController.h"
@protocol litigationProgressInquiryConditionViewControllerDelegate <NSObject>
- (void)sendBackCzr:(NSString*)czr;
@end
@interface litigationProgressInquiryConditionViewController : RootViewController
@property(nonatomic,weak)id<litigationProgressInquiryConditionViewControllerDelegate>litigationProgressInquiryConditionViewControllerDelegate;

@end
