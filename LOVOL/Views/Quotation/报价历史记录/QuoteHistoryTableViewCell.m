//
//  QuoteHistoryTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/11.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "QuoteHistoryTableViewCell.h"

#import "QuoteHistoryModel.h"
@interface QuoteHistoryTableViewCell()
@property(nonatomic,strong)UILabel* titL;
@property(nonatomic,strong)UILabel* numL;
@property(nonatomic,strong)UILabel* payDayL;
@property(nonatomic,strong)UILabel* zuDayL;
@property(nonatomic,strong)UILabel* countMonthL;
@property(nonatomic,strong)UILabel* typeL;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIView* lineView1;
@property(nonatomic,strong)UIButton* zuListBtn;
@end
@implementation QuoteHistoryTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.numL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.numL.textColor = [MyController colorWithHexString:CFontColor2];
    self.numL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.numL];
    
    [self.numL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(15);
    }];
    
    self.titL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.titL.textColor = [MyController colorWithHexString:CFontColor2];
    self.titL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.titL];
    
    [self.titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.numL.mas_left).mas_offset(-4);
        make.centerY.mas_equalTo(self.numL.mas_centerY);
        make.left.mas_equalTo(KNormalSpace);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titL);
        make.right.mas_equalTo(self.numL);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.titL.mas_bottom).mas_offset(10);
    }];
    
    self.payDayL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.payDayL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.payDayL];
    
    [self.payDayL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(KNormalSpace);
        make.width.mas_offset(80);
    }];
    
    self.zuDayL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.zuDayL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.zuDayL];
    
    [self.zuDayL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.payDayL.mas_centerY);
        make.left.mas_equalTo(self.payDayL.mas_right).mas_offset(10);
    }];
    
    self.countMonthL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.countMonthL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.countMonthL];
    
    [self.countMonthL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.payDayL);
        make.top.mas_equalTo(self.payDayL.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(self.payDayL);
    }];
    
    self.typeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.typeL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.typeL];
    
    [self.typeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.countMonthL.mas_centerY);
        make.left.mas_equalTo(self.countMonthL.mas_right).mas_offset(10);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.typeL.mas_bottom).mas_offset(15);
    }];
    
    self.zuListBtn = [MyController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(zuListBtnClick) Title:@"租金支付表"];
    [self.zuListBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    [self.zuListBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.zuListBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.zuListBtn];
    
    [self.zuListBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.centerY.mas_equalTo(self.typeL.mas_centerY);
        make.width.mas_offset(66);
        make.height.mas_offset(22);
    }];
    
    self.hyb_lastViewInCell = self.lineView1;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(QuoteHistoryModel *)model {
    self.titL.text = model._tit;
    self.numL.text = model._num;
    self.payDayL.text = model._payDay;
    self.zuDayL.text = model._zuDay;
    self.countMonthL.text = model._countMonth;
    self.typeL.text = model._type;
    
}

- (void)zuListBtnClick {
    [self.QuoteHistoryTableViewCellDelegate sendBackCheckZujinPayList:self.rowIndex];
}

@end
