//
//  NoticeTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NoticeModel;
@interface NoticeTableViewCell : UITableViewCell
- (void)configCellWithModel:(NoticeModel *)model;

@end
