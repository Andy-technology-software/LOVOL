//
//  PageFirstIndex0TableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/2.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PageFirstIndex0Model;
@protocol PageFirstIndex0TableViewCellDelegate <NSObject>
- (void)sendBackS0More;
@end
@interface PageFirstIndex0TableViewCell : UITableViewCell
- (void)configCellWithModel:(PageFirstIndex0Model *)model;
@property(nonatomic,weak)id<PageFirstIndex0TableViewCellDelegate>PageFirstIndex0TableViewCellDelegate;

@end
