
//
//  FromsDisplayInfoTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/31.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "FromsDisplayInfoTableViewCell.h"

#import "FormsCommonCellModel.h"
@interface FromsDisplayInfoTableViewCell()
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIView* lineView1;

@property(nonatomic,strong)UILabel* leftTitLable;
@property(nonatomic,strong)UILabel* rightL;

@end
@implementation FromsDisplayInfoTableViewCell

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
    
    self.rightL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.rightL.numberOfLines = 0;
    [self.contentView addSubview:self.rightL];
    
    [self.rightL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftTitLable.mas_right).mas_offset(4);
        make.top.mas_equalTo(self.leftTitLable);
        make.right.mas_equalTo(-KNormalSpace);
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
    
    self.rightL.text = model._rightContent;
    
//    self.rightContentTF.placeholder = model._placeholder;
    if ([MyController returnStr:model._rightContent].length) {
        [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_offset(0.5);
            make.top.mas_equalTo(self.rightL.mas_bottom).mas_offset(15);
        }];
    }else {
        [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_offset(0.5);
            make.top.mas_equalTo(self.leftTitLable.mas_bottom).mas_offset(15);
        }];
    }
}

@end


