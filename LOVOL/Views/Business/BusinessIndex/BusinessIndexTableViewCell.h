//
//  BusinessIndexTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/3.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BusinessIndexModel;
@protocol BusinessIndexTableViewCellDelegate <NSObject>
- (void)sendBackSelectedTagValue:(NSInteger)tagValue;
@end
@interface BusinessIndexTableViewCell : UITableViewCell
- (void)configCellWithModel:(BusinessIndexModel*)model;
@property(nonatomic,weak)id<BusinessIndexTableViewCellDelegate>BusinessIndexTableViewCellDelegate;

@end
