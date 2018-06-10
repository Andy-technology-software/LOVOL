//
//  RentPayListTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RentPayListModel;
@interface RentPayListTableViewCell : UITableViewCell
- (void)configCellWithModel:(RentPayListModel *)model;

@end
