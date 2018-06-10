
//
//  TrailerProgressInquiryTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "TrailerProgressInquiryTableViewCell.h"

#import "TrailerProgressInquiryModel.h"
@interface TrailerProgressInquiryTableViewCell()
@property(nonatomic,strong)UILabel* cpmcL;
@property(nonatomic,strong)UILabel* lcztL;
@property(nonatomic,strong)UILabel* cpbhL;
@property(nonatomic,strong)UILabel* zllxL;
@property(nonatomic,strong)UILabel* gwbhL;
@property(nonatomic,strong)UILabel* czrL;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIView* lineView1;
@end
@implementation TrailerProgressInquiryTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.lcztL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.lcztL.textColor = [MyController colorWithHexString:CFontColor2];
    self.lcztL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.lcztL];
    
    [self.lcztL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
    }];
    
    self.cpmcL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.cpmcL.numberOfLines = 1;
    self.cpmcL.lineBreakMode = NSLineBreakByTruncatingTail;
    self.cpmcL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.cpmcL];
    
    [self.cpmcL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.lcztL.mas_centerY);
        make.right.mas_equalTo(self.lcztL.mas_left).mas_offset(-2);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.cpmcL.mas_left);
        make.right.mas_equalTo(self.lcztL.mas_right);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.cpmcL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.zllxL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.zllxL.textColor = [MyController colorWithHexString:CFontColor2];
    self.zllxL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.zllxL];
    
    [self.zllxL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self.cpbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.cpbhL.textColor = [MyController colorWithHexString:CFontColor2];
    self.cpbhL.numberOfLines = 1;
    self.cpbhL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.cpbhL];
    
    [self.cpbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.zllxL.mas_centerY);
        make.right.mas_equalTo(self.zllxL.mas_left).mas_offset(-2);
    }];
    
    self.czrL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.czrL.textAlignment = NSTextAlignmentRight;
    self.czrL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.czrL];
    
    [self.czrL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.zllxL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self.gwbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.gwbhL.textColor = [MyController colorWithHexString:CFontColor2];
    self.gwbhL.numberOfLines = 1;
    self.gwbhL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.gwbhL];
    
    [self.gwbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.czrL.mas_centerY);
        make.right.mas_equalTo(self.czrL.mas_left).mas_offset(-2);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.gwbhL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.hyb_lastViewInCell = self.lineView1;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(TrailerProgressInquiryModel *)model {
    self.cpmcL.text = [NSString stringWithFormat:@"产品名称:%@",model._cpmc];
    
    self.lcztL.text = model._lczt;
    
    self.cpbhL.text = [NSString stringWithFormat:@"产品编号:%@",model._cpbh];
    
    self.zllxL.text = [NSString stringWithFormat:@"租赁类型:%@",model._zllx];
    
    self.gwbhL.text = [NSString stringWithFormat:@"岗位编号:%@",model._gwbh];
    
    self.czrL.text = [NSString stringWithFormat:@"承租人:%@",model._czr];
    
}

@end

