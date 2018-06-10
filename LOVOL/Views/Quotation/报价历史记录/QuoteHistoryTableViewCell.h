//
//  QuoteHistoryTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/11.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuoteHistoryModel;
@protocol QuoteHistoryTableViewCellDelegate <NSObject>
- (void)sendBackCheckZujinPayList:(NSInteger)rowIndex;
@end
@interface QuoteHistoryTableViewCell : UITableViewCell
- (void)configCellWithModel:(QuoteHistoryModel *)model;
@property(nonatomic,weak)id<QuoteHistoryTableViewCellDelegate>QuoteHistoryTableViewCellDelegate;
@property(nonatomic,assign)NSInteger rowIndex;
@end
