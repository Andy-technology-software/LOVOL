//
//  MsgModel.h
//  LOVOL
//
//  Created by andyXu on 2018/5/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MsgModel : NSObject
@property(nonatomic,copy)NSString* _bh;
@property(nonatomic,copy)NSString* _xh;
@property(nonatomic,copy)NSString* _time;
@property(nonatomic,copy)NSString* _czr;
@property(nonatomic,copy)NSString* _id;
@property(nonatomic,assign)BOOL _isRead;
@end
