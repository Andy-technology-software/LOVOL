//
//  TrailerProgressInquiryConditionViewController.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RootViewController.h"
@protocol TrailerProgressInquiryConditionViewControllerDelegate <NSObject>
- (void)sendBackClzt:(NSString*)clzt cxtj:(NSString*)cxtj;
@end
@interface TrailerProgressInquiryConditionViewController : RootViewController
@property(nonatomic,weak)id<TrailerProgressInquiryConditionViewControllerDelegate>TrailerProgressInquiryConditionViewControllerDelegate;
@end
