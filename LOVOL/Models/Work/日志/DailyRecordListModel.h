//
//  DailyRecordListModel.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/31.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DailyRecordListModel : NSObject
@property(nonatomic,copy)NSString* _time;
@property(nonatomic,copy)NSString* _type;
@property(nonatomic,copy)NSString* _des;
@property(nonatomic,copy)NSString* _related;
@property(nonatomic,copy)NSString* _id;

@end
