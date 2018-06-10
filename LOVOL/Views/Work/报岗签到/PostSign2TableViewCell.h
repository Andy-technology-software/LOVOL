//
//  PostSign2TableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/15.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PostSign2Model;
@protocol PostSign2TableViewCellDelegate <NSObject>
- (void)sendBackAddImage;
- (void)sendBackSelectImage:(NSInteger)index;
- (void)sendBackDeleImage:(NSInteger)index;
@end
@interface PostSign2TableViewCell : UITableViewCell
@property(nonatomic,weak)id<PostSign2TableViewCellDelegate>PostSign2TableViewCellDelegate;
- (void)configCellWithModel:(PostSign2Model *)model;

@end
