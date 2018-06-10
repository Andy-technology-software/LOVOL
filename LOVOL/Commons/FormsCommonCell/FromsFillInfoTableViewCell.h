//
//  FromsFillInfoTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/6/1.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FormsCommonCellModel;
@protocol FromsFillInfoTableViewCellDelegate <NSObject>
- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString*)content;
@end
@interface FromsFillInfoTableViewCell : UITableViewCell
- (void)configCellWithModel:(FormsCommonCellModel*)model;
@property(nonatomic,weak)id<FromsFillInfoTableViewCellDelegate>FromsFillInfoTableViewCellDelegate;
@property(nonatomic,assign)NSInteger rowIndex;
@property(nonatomic,assign)NSInteger sectionIndex;

@end
