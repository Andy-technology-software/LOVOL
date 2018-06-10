//
//  MarginChargePlanTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "MarginChargePlanTableViewCell.h"

#import "MarginChargePlanModel.h"
@interface MarginChargePlanTableViewCell()
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UILabel* perL;
@property(nonatomic,strong)UILabel* moneyL;
@property(nonatomic,strong)UILabel* desL;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIView* lineView1;

@end
@implementation MarginChargePlanTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.timeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.timeL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(15);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeL);
        make.right.mas_equalTo(self.timeL);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.timeL.mas_bottom).mas_offset(10);
    }];
    
    self.perL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.perL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.perL];
    
    [self.perL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeL);
        make.top.mas_equalTo(self.lineView1.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    self.moneyL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.moneyL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.moneyL];
    
    [self.moneyL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.timeL);
        make.centerY.mas_equalTo(self.perL.mas_centerY);
        make.left.mas_equalTo(self.perL.mas_right);
    }];
    
    self.desL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.desL.textColor = [MyController colorWithHexString:CFontColor2];
    self.desL.numberOfLines = 0;
    [self.contentView addSubview:self.desL];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.moneyL);
        make.top.mas_equalTo(self.perL.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.perL);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.desL.mas_bottom).mas_offset(15);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(MarginChargePlanModel *)model {
    self.timeL.text = model._time;
    self.perL.text = model._percentage;
    self.moneyL.text = model._money;
    self.desL.text = model._des;
}

@end

