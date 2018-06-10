//
//  CustomerSearchConditionViewController.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/31.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RootViewController.h"
@protocol CustomerSearchConditionViewControllerDelegate <NSObject>
- (void)sendBackSelectInfoName:(NSString*)name jxs:(NSString*)jsx cxz:(NSString*)cxz sTime:(NSString*)sTime eTime:(NSString*)etime;
@end
@interface CustomerSearchConditionViewController : RootViewController
@property(nonatomic,weak)id<CustomerSearchConditionViewControllerDelegate>CustomerSearchConditionViewControllerDelegate;

@end
