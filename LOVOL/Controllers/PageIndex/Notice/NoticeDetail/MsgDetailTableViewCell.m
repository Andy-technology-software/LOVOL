
//
//  MsgDetailTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "MsgDetailTableViewCell.h"

#import "MsgDetailModel.h"
@interface MsgDetailTableViewCell()
@property(nonatomic,strong)UILabel* titL;
@property(nonatomic,strong)UILabel* desL;
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UILabel* reasonL;
@property(nonatomic,strong)UIView* lineView;

@end
@implementation MsgDetailTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
   
    self.titL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.titL.textColor = [MyController colorWithHexString:CFontColor0];
    self.titL.numberOfLines = 1;
    self.titL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.titL];
    
    [self.titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(15);
    }];
    
    self.timeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.timeL.textColor = [MyController colorWithHexString:CFontColor2];
    self.timeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.titL.mas_right);
        make.top.mas_equalTo(self.titL.mas_bottom).mas_offset(10);
    }];
    
    self.desL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.desL.textColor = [MyController colorWithHexString:CFontColor0];
    self.desL.numberOfLines = 1;
    self.desL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.desL];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titL);
        make.right.mas_equalTo(self.timeL);
        make.centerY.mas_equalTo(self.timeL.mas_centerY);
    }];
    
    self.reasonL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.reasonL.textColor = [MyController colorWithHexString:CFontColor0];
    self.reasonL.numberOfLines = 0;
    self.reasonL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.reasonL];
    
    [self.reasonL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.desL);
        make.right.mas_equalTo(self.timeL);
        make.top.mas_equalTo(self.desL.mas_bottom).mas_offset(10);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.reasonL.mas_bottom).mas_offset(15);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(MsgDetailModel *)model {
    self.titL.text = model.tit;
    
    self.desL.text = model.des;
    
    self.timeL.text = model.time;
    
    self.reasonL.text = model.reason;
}

@end

