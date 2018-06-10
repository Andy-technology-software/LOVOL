//
//  FormsCommonCellModel.h
//  LOVOL
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormsCommonCellModel : NSObject<NSCoding>
@property(nonatomic,copy)NSString* _leftTitle;//左边标题
@property(nonatomic,copy)NSString* _rightUnit;//右边单位
@property(nonatomic,copy)NSString* _rightContent;//右边内容
@property(nonatomic,copy)NSString* _placeholder;//填写内容提示信息
@property(nonatomic,copy)NSString* _isMust;//是不是必填项
@property(nonatomic,copy)NSString* _selectRightImg;//是不是必填项
@end
