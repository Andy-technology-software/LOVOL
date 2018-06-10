//
//  MsgDetailTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MsgDetailModel;
@interface MsgDetailTableViewCell : UITableViewCell
- (void)configCellWithModel:(MsgDetailModel *)model;

@end
