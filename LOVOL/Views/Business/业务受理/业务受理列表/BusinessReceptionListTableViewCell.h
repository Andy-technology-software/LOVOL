//
//  BusinessReceptionListTableViewCell.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/29.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BusinessReceptionListModel;
@interface BusinessReceptionListTableViewCell : UITableViewCell
- (void)configCellWithModel:(BusinessReceptionListModel *)model;

@end
