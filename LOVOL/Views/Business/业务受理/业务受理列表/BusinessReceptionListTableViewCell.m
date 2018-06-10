
//
//  BusinessReceptionListTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/29.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "BusinessReceptionListTableViewCell.h"

#import "BusinessReceptionListModel.h"
@interface BusinessReceptionListTableViewCell()
@property(nonatomic,strong)UILabel* numL;
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UILabel* lcNameL;
@property(nonatomic,strong)UILabel* senderL;
@property(nonatomic,strong)UILabel* kehuL;
@property(nonatomic,strong)UILabel* stateL;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIView* lineView1;
@end
@implementation BusinessReceptionListTableViewCell

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
    self.timeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
    }];
    
    self.numL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.numL.numberOfLines = 1;
    self.numL.lineBreakMode = NSLineBreakByTruncatingTail;
    self.numL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.numL];
    
    [self.numL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.timeL.mas_centerY);
        make.right.mas_equalTo(self.timeL.mas_left).mas_offset(-2);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.numL.mas_left);
        make.right.mas_equalTo(self.timeL.mas_right);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.numL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.senderL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.senderL.textColor = [MyController colorWithHexString:CFontColor2];
    self.senderL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.senderL];
    
    [self.senderL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.lineView.mas_right);
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.lcNameL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.lcNameL.numberOfLines = 1;
    self.lcNameL.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lcNameL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.lcNameL];
    
    [self.lcNameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lineView.mas_left);
        make.centerY.mas_equalTo(self.senderL.mas_centerY);
        make.right.mas_equalTo(self.senderL.mas_left).mas_offset(-2);
    }];
    
    self.stateL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.stateL.textColor = [MyController colorWithHexString:CFontColor2];
    self.stateL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.stateL];
    
    [self.stateL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.senderL.mas_right);
        make.top.mas_equalTo(self.senderL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.kehuL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.kehuL.numberOfLines = 1;
    self.kehuL.lineBreakMode = NSLineBreakByTruncatingTail;
    self.kehuL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.kehuL];
    
    [self.kehuL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lcNameL.mas_left);
        make.centerY.mas_equalTo(self.stateL.mas_centerY);
        make.right.mas_equalTo(self.stateL.mas_left).mas_offset(-2);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.kehuL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.hyb_lastViewInCell = self.lineView1;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(BusinessReceptionListModel *)model {
    self.numL.text = [NSString stringWithFormat:@"流程编号:%@",model._num];
    
    self.timeL.text = model._time;
    
    self.lcNameL.text = [NSString stringWithFormat:@"流程名称:%@",model._lcname];
    
    self.senderL.text = [NSString stringWithFormat:@"发起人:%@",model._sender];
    
    self.kehuL.text = [NSString stringWithFormat:@"客户:%@",model._kehu];
    
    self.stateL.text = model._state;
    
}

@end
