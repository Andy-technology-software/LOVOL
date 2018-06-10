//
//  WorkIndexTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/3.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WorkIndexModel;
@protocol WorkIndexTableViewCellDelegate <NSObject>
- (void)sendBackSelectedTagValue:(NSInteger)tagValue;
@end
@interface WorkIndexTableViewCell : UITableViewCell
- (void)configCellWithModel:(WorkIndexModel*)model;
@property(nonatomic,weak)id<WorkIndexTableViewCellDelegate>WorkIndexTableViewCellDelegate;
@end
