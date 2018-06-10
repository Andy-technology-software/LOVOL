
//
//  litigationProgressInquiryTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "litigationProgressInquiryTableViewCell.h"

#import "litigationProgressInquiryModel.h"
@interface litigationProgressInquiryTableViewCell()
@property(nonatomic,strong)UILabel* czrL;
@property(nonatomic,strong)UILabel* fhzlwL;
@property(nonatomic,strong)UILabel* zjbhL;
@property(nonatomic,strong)UILabel* cpjxL;
@property(nonatomic,strong)UIView* lineView1;
@end
@implementation litigationProgressInquiryTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.fhzlwL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.fhzlwL.textColor = [MyController colorWithHexString:CFontColor2];
    self.fhzlwL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.fhzlwL];
    
    [self.fhzlwL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
    }];
    
    self.czrL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.czrL.numberOfLines = 1;
    self.czrL.lineBreakMode = NSLineBreakByTruncatingTail;
    self.czrL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.czrL];
    
    [self.czrL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.fhzlwL.mas_centerY);
        make.right.mas_equalTo(self.fhzlwL.mas_left).mas_offset(-2);
    }];
    
    self.cpjxL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.cpjxL.textAlignment = NSTextAlignmentRight;
    self.cpjxL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.cpjxL];
    
    [self.cpjxL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.fhzlwL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.fhzlwL);
    }];
    
    self.zjbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.zjbhL.textColor = [MyController colorWithHexString:CFontColor2];
    self.zjbhL.numberOfLines = 1;
    self.zjbhL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.zjbhL];
    
    [self.zjbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.cpjxL.mas_left);
        make.left.mas_equalTo(self.czrL);
        make.centerY.mas_equalTo(self.cpjxL.mas_centerY);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.zjbhL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.hyb_lastViewInCell = self.lineView1;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(litigationProgressInquiryModel *)model {
    self.czrL.text = [NSString stringWithFormat:@"承租人:%@",model._czr];
    
    self.fhzlwL.text = model._fhzlw;
    
    self.zjbhL.text = [NSString stringWithFormat:@"整机编号:%@",model._zjbh];
    
    self.cpjxL.text = [NSString stringWithFormat:@"产品机型:%@",model._cpjx];
    
}

@end

