//
//  FromsFillTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

/**
 填写内容的cell
 */

#import <UIKit/UIKit.h>
@class FormsCommonCellModel;
@protocol FromsFillTableViewCellDelegate <NSObject>
- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString*)content;
@end
@interface FromsFillTableViewCell : UITableViewCell
- (void)configCellWithModel:(FormsCommonCellModel*)model;
@property(nonatomic,weak)id<FromsFillTableViewCellDelegate>FromsFillTableViewCellDelegate;
@property(nonatomic,assign)NSInteger rowIndex;
@property(nonatomic,assign)NSInteger sectionIndex;
@end
