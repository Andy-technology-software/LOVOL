//
//  CreditPendingModel.h
//  LOVOL
//
//  Created by andyXu on 2018/5/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreditPendingModel : NSObject
@property(nonatomic,copy)NSString* _tit;
@property(nonatomic,copy)NSString* _kehu;
@property(nonatomic,copy)NSString* _num;
@property(nonatomic,copy)NSString* _time;
@property(nonatomic,copy)NSString* _sender;
@property(nonatomic,copy)NSString* _state;
@property(nonatomic,assign)BOOL _isRead;
@end
