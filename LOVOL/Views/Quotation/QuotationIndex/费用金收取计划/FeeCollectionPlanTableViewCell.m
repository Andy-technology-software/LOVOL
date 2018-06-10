//
//  FeeCollectionPlanTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "FeeCollectionPlanTableViewCell.h"

#import "FeeCollectionPlanModel.h"
@interface FeeCollectionPlanTableViewCell()
@property(nonatomic,strong)UILabel* monthDayL;
@property(nonatomic,strong)UILabel* yearL;
@property(nonatomic,strong)UILabel* perL;
@property(nonatomic,strong)UILabel* moneyL;
@property(nonatomic,strong)UILabel* desL;
@property(nonatomic,strong)UILabel* otherL;
@property(nonatomic,strong)UILabel* typeL;
@property(nonatomic,strong)UIView* lineView;

@end
@implementation FeeCollectionPlanTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.monthDayL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.monthDayL.textColor = [MyController colorWithHexString:CFontColor2];
    self.monthDayL.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.monthDayL];
    
    [self.monthDayL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(15);
        make.width.mas_offset(80);
    }];
    
    self.yearL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.yearL.textColor = [MyController colorWithHexString:CFontColor2];
    self.yearL.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.yearL];
    
    [self.yearL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.monthDayL);
        make.top.mas_equalTo(self.monthDayL.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(self.monthDayL);
    }];
    
    self.perL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.perL.textColor = [MyController colorWithHexString:CFontColor2];
    self.perL.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.perL];
    
    [self.perL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.yearL);
        make.top.mas_equalTo(self.yearL.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(self.yearL);
    }];
    
    self.typeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.typeL.textColor = [MyController colorWithHexString:CFontColor2];
    self.typeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.typeL];
    
    [self.typeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(self.monthDayL);
    }];
    
    self.moneyL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.moneyL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.moneyL];
    
    [self.moneyL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.typeL.mas_left).mas_offset(-4);
        make.centerY.mas_equalTo(self.monthDayL);
        make.left.mas_equalTo(self.monthDayL.mas_right).mas_offset(4);
    }];
    
    self.desL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.desL.textColor = [MyController colorWithHexString:CFontColor2];
    self.desL.numberOfLines = 1;
    self.desL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.desL];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.typeL);
        make.top.mas_equalTo(self.moneyL.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.moneyL);
    }];
    
    self.otherL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.otherL.textColor = [MyController colorWithHexString:CFontColor2];
    self.otherL.numberOfLines = 1;
    self.otherL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.otherL];
    
    [self.otherL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.desL);
        make.top.mas_equalTo(self.desL.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.desL);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.perL.mas_bottom).mas_offset(15);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(FeeCollectionPlanModel *)model {
    self.monthDayL.text = model._monthAndDay;
    self.yearL.text = model._year;
    self.perL.text = model._percentage;
    self.moneyL.text = model._money;
    self.desL.text = model._des;
    self.otherL.text = model._other;
    self.typeL.text = model._type;
}

@end
