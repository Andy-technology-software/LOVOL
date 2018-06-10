
//
//  DealerAccessPendingTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/11.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "DealerAccessPendingTableViewCell.h"

#import "DealerAccessPendingModel.h"
@interface DealerAccessPendingTableViewCell()
@property(nonatomic,strong)UILabel* lcbhL;
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UILabel* jxsL;
@property(nonatomic,strong)UILabel* sqrL;
@property(nonatomic,strong)UIView* lineView1;
@end
@implementation DealerAccessPendingTableViewCell

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
    
    self.lcbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.lcbhL.numberOfLines = 1;
    self.lcbhL.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lcbhL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.lcbhL];
    
    [self.lcbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.timeL.mas_centerY);
        make.right.mas_equalTo(self.timeL.mas_left).mas_offset(-2);
    }];
    
    self.sqrL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.sqrL.textColor = [MyController colorWithHexString:CFontColor2];
    self.sqrL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.sqrL];
    
    [self.sqrL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.timeL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self.jxsL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.jxsL.textColor = [MyController colorWithHexString:CFontColor2];
    self.jxsL.numberOfLines = 1;
    self.jxsL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.jxsL];
    
    [self.jxsL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.sqrL.mas_centerY);
        make.right.mas_equalTo(self.sqrL.mas_left).mas_offset(-2);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.jxsL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.hyb_lastViewInCell = self.lineView1;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(DealerAccessPendingModel *)model {
    self.lcbhL.text = [NSString stringWithFormat:@"流程编号:%@",model._lcbh];
    
    self.timeL.text = model._time;
    
    self.jxsL.text = [NSString stringWithFormat:@"经销商:%@",model._jxs];
    
    self.sqrL.text = [NSString stringWithFormat:@"申请人:%@",model._sqr];
    
}

@end
