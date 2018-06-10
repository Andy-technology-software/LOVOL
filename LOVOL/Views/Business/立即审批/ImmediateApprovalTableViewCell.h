//
//  ImmediateApprovalTableViewCell.h
//  LOVOL
//
//  Created by andyXu on 2018/5/18.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRQTextview.h"
@protocol AdvancedExpandableTableViewDelegate <UITableViewDelegate, UITextViewDelegate>

@required
- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath;

@optional
- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath;
- (BOOL)tableView:(UITableView *)tableView textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)tableView:(UITableView *)tableView textViewDidChangeSelection:(UITextView*)textView;
- (void)tableView:(UITableView *)tableView textViewDidEndEditing:(UITextView*)textView;
@end
@interface ImmediateApprovalTableViewCell : UITableViewCell

@property (nonatomic) XRQTextview *textView;
@property (nonatomic, weak) UITableView *expandableTableView;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic) CGFloat cellHeight;

@property (nonatomic) int  maxCharacter;

@property(nonatomic,weak)id<AdvancedExpandableTableViewDelegate>ImmediateApprovalTableViewCellDelegate;

- (void)setText:(NSString*)text;

@end
@interface UITableView (AdvancedExpandableTextCell)

- (ImmediateApprovalTableViewCell *)advancedExpandableTextCellWithId2:(NSString*)cellId;
@end

