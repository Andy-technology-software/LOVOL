//
//  LoanProgressInquiryTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "LoanProgressInquiryTableViewCell.h"

#import "LoanProgressInquiryModel.h"
@interface LoanProgressInquiryTableViewCell()
@property(nonatomic,strong)UILabel* czrL;
@property(nonatomic,strong)UILabel* dqjdL;
@property(nonatomic,strong)UILabel* htbhL;
@property(nonatomic,strong)UILabel* fkrzeL;
@property(nonatomic,strong)UILabel* dlsL;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIView* lineView1;
@end
@implementation LoanProgressInquiryTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.dqjdL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.dqjdL.textColor = [MyController colorWithHexString:CFontColor2];
    self.dqjdL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.dqjdL];
    
    [self.dqjdL mas_makeConstraints:^(MASConstraintMaker *make) {
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
        make.centerY.mas_equalTo(self.dqjdL.mas_centerY);
        make.right.mas_equalTo(self.dqjdL.mas_left).mas_offset(-2);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.czrL.mas_left);
        make.right.mas_equalTo(self.dqjdL.mas_right);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.czrL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.htbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.htbhL.numberOfLines = 1;
    self.htbhL.lineBreakMode = NSLineBreakByTruncatingTail;
    self.htbhL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.htbhL];
    
    [self.htbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lineView.mas_left);
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self.fkrzeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.fkrzeL.textColor = [MyController colorWithHexString:CFontColor2];
    self.fkrzeL.numberOfLines = 1;
    self.fkrzeL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.fkrzeL];
    
    [self.fkrzeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.htbhL);
        make.left.mas_equalTo(self.htbhL);
        make.top.mas_equalTo(self.htbhL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.dlsL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.dlsL.numberOfLines = 1;
    self.dlsL.lineBreakMode = NSLineBreakByTruncatingTail;
    self.dlsL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.dlsL];
    
    [self.dlsL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fkrzeL.mas_left);
        make.top.mas_equalTo(self.fkrzeL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.fkrzeL.mas_right);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.dlsL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.hyb_lastViewInCell = self.lineView1;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(LoanProgressInquiryModel *)model {
    self.czrL.text = [NSString stringWithFormat:@"承租人:%@",model._czr];
    
    self.dqjdL.text = model._dqjd;
    
    self.htbhL.text = [NSString stringWithFormat:@"合同编号:%@",model._htbh];
    
    self.fkrzeL.text = [NSString stringWithFormat:@"放款融资额:%@",model._fkrze];
    
    self.dlsL.text = [NSString stringWithFormat:@"代理商:%@",model._dls];
    
}

@end

