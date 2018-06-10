//
//  FeeCollectionPlanModel.h
//  LOVOL
//
//  Created by andyXu on 2018/5/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeeCollectionPlanModel : NSObject
@property(nonatomic,copy)NSString* _monthAndDay;
@property(nonatomic,copy)NSString* _year;
@property(nonatomic,copy)NSString* _percentage;
@property(nonatomic,copy)NSString* _money;
@property(nonatomic,copy)NSString* _des;
@property(nonatomic,copy)NSString* _other;
@property(nonatomic,copy)NSString* _type;
@end
