//
//  FromsDisplayTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "FromsDisplayTableViewCell.h"

#import "FormsCommonCellModel.h"
@interface FromsDisplayTableViewCell()
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIView* lineView1;

@property(nonatomic,strong)UILabel* leftTitLable;
@property(nonatomic,strong)UITextField* rightContentTF;

@end
@implementation FromsDisplayTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.leftTitLable = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.leftTitLable.numberOfLines = 0;
    [self.contentView addSubview:self.leftTitLable];
    
    [self.leftTitLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace + 10);
        make.top.mas_equalTo(15);
        make.width.mas_offset(100);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftTitLable.mas_right);
        make.width.mas_offset(1);
        make.height.mas_offset(30);
        make.centerY.mas_equalTo(self.leftTitLable.mas_centerY);
    }];
    
    self.rightContentTF = [MyController createTextFieldWithFrame:self.contentView.frame placeholder:nil passWord:NO leftImageView:nil rightImageView:nil Font:CFontSize1];
    self.rightContentTF.textColor = [MyController colorWithHexString:CFontColor1];
    self.rightContentTF.enabled = NO;
    [self.contentView addSubview:self.rightContentTF];
    
    [self.rightContentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftTitLable.mas_right).mas_offset(4);
        make.centerY.mas_equalTo(self.leftTitLable.mas_centerY);
        make.right.mas_equalTo(-KNormalSpace);
        make.height.mas_offset(40);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.leftTitLable.mas_bottom).mas_offset(15);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(FormsCommonCellModel *)model {
    self.leftTitLable.text = model._leftTitle;
    
    self.rightContentTF.text = model._rightContent;
    
    self.rightContentTF.placeholder = model._placeholder;
}

@end


