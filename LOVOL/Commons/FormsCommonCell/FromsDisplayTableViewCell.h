//
//  FromsDisplayTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

/**
 展示内容的cell
 */

#import <UIKit/UIKit.h>
@class FormsCommonCellModel;
@interface FromsDisplayTableViewCell : UITableViewCell
- (void)configCellWithModel:(FormsCommonCellModel*)model;

@end
