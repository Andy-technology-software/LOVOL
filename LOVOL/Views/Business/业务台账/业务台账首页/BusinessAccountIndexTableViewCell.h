//
//  BusinessAccountIndexTableViewCell.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BusinessAccountIndexModel;
@interface BusinessAccountIndexTableViewCell : UITableViewCell
- (void)configCellWithModel:(BusinessAccountIndexModel *)model;

@end
