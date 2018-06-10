//
//  CustomerManagementHomeTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/18.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomerManagementHomeModel;
@protocol CustomerManagementHomeTableViewCellDelegate <NSObject>
- (void)sendBackSelectIndex:(NSInteger)rowIndex;
@end
@interface CustomerManagementHomeTableViewCell : UITableViewCell
- (void)configCellWithModel:(CustomerManagementHomeModel *)model;
@property(nonatomic,weak)id<CustomerManagementHomeTableViewCellDelegate>CustomerManagementHomeTableViewCellDelegate;
@property(nonatomic,assign)NSInteger cellRow;
@end
