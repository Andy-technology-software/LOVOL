//
//  FormsSelectedTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

/**
 选择的cell
 */

#import <UIKit/UIKit.h>
@class FormsCommonCellModel;
@interface FormsSelectedTableViewCell : UITableViewCell
- (void)configCellWithModel:(FormsCommonCellModel*)model;
@end
