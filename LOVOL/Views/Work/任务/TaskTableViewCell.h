//
//  TaskTableViewCell.h
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/31.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskModel;
@interface TaskTableViewCell : UITableViewCell
- (void)configCellWithModel:(TaskModel *)model;

@end
