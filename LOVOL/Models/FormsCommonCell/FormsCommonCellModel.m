//
//  FormsCommonCellModel.m
//  LOVOL
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "FormsCommonCellModel.h"

@implementation FormsCommonCellModel
//解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self._leftTitle = [aDecoder decodeObjectForKey:@"_leftTitle"];
        self._rightUnit = [aDecoder decodeObjectForKey:@"_rightUnit"];
        self._rightContent = [aDecoder decodeObjectForKey:@"_rightContent"];
        self._placeholder = [aDecoder decodeObjectForKey:@"_placeholder"];
        self._isMust = [aDecoder decodeObjectForKey:@"_isMust"];
        
    } return self;
    
}

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self._leftTitle forKey:@"_leftTitle"];
    [aCoder encodeObject:self._rightUnit forKey:@"_rightUnit"];
    [aCoder encodeObject:self._rightContent forKey:@"_rightContent"];
    [aCoder encodeObject:self._placeholder forKey:@"_placeholder"];
    [aCoder encodeObject:self._isMust forKey:@"_isMust"];
    
}

@end
