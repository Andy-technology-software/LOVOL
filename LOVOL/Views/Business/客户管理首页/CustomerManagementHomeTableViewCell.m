
//
//  CustomerManagementHomeTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/18.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "CustomerManagementHomeTableViewCell.h"

#import "CustomerManagementHomeModel.h"
@interface CustomerManagementHomeTableViewCell()
@property(nonatomic,strong)UILabel* nameL;
@property(nonatomic,strong)UILabel* typeL;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIButton* editImageView;
@property(nonatomic,strong)UIButton* editImageView1;
@end
@implementation CustomerManagementHomeTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.editImageView = [MyController createButtonWithFrame:self.contentView.frame ImageName:@"客户编辑" Target:self Action:@selector(editImageViewClick:) Title:nil];
    [self.contentView addSubview:self.editImageView];
    
    [self.editImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.mas_offset(20);
        make.height.mas_offset(20);
    }];
    
    self.editImageView1 = [MyController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(editImageViewClick:) Title:nil];
    [self.contentView addSubview:self.editImageView1];
    
    [self.editImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_offset(50);
    }];
    
    self.nameL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.nameL.textColor = [MyController colorWithHexString:CFontColor0];
    [self.contentView addSubview:self.nameL];
    
    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(self.editImageView.mas_left).mas_offset(-KNormalSpace);
        make.top.mas_equalTo(15);
    }];
    
    self.typeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.typeL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.typeL];
    
    [self.typeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameL);
        make.right.mas_equalTo(self.nameL);
        make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(10);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.typeL.mas_bottom).mas_offset(15);
    }];
    
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(CustomerManagementHomeModel *)model {
    self.nameL.text = model._name;
    
    self.typeL.text = model._type;
    
}

- (void)editImageViewClick:(UIButton*)btn {
    [self.CustomerManagementHomeTableViewCellDelegate sendBackSelectIndex:self.cellRow];
    
}

@end

