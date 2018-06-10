//
//  ApprovalRecordTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/18.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ApprovalRecordModel;
@interface ApprovalRecordTableViewCell : UITableViewCell
- (void)configCellWithModel:(ApprovalRecordModel *)model;

@end
