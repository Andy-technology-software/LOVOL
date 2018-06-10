//
//  LeaseItemAddListModel.h
//  LOVOL
//
//  Created by andyXu on 2018/5/25.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeaseItemAddListModel : NSObject
@property(nonatomic,copy)NSString* _zlwlx;//租赁物类型
@property(nonatomic,copy)NSString* _xh;//型号
@property(nonatomic,copy)NSString* _ccbh;//出厂编号
@property(nonatomic,copy)NSString* _fdjbh;//发动机编号
@property(nonatomic,copy)NSString* _sbjk;//设备价款
@property(nonatomic,copy)NSString* _cjdj;//成交单价
@property(nonatomic,copy)NSString* _sl;//数量
@property(nonatomic,copy)NSString* _id;//id
@end
