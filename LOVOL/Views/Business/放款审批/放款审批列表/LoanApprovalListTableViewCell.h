//
//  LoanApprovalListTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/30.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoanApprovalListModel;
@interface LoanApprovalListTableViewCell : UITableViewCell
- (void)configCellWithModel:(LoanApprovalListModel *)model;

@end
