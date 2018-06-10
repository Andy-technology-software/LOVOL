//
//  LoanProgressInquiryConditionViewController.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RootViewController.h"
@protocol LoanProgressInquiryConditionViewControllerDelegate <NSObject>
- (void)sendBackHTBH:(NSString*)htbh czr:(NSString*)czr;
@end
@interface LoanProgressInquiryConditionViewController : RootViewController
@property(nonatomic,weak)id<LoanProgressInquiryConditionViewControllerDelegate>LoanProgressInquiryConditionViewControllerDelegate;

@end
