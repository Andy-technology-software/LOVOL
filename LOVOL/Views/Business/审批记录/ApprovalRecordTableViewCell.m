
//
//  ApprovalRecordTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/18.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "ApprovalRecordTableViewCell.h"

#import "ApprovalRecordModel.h"
@interface ApprovalRecordTableViewCell()
@property(nonatomic,strong)UILabel* fNameL;
@property(nonatomic,strong)UILabel* nameL;
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UILabel* desL;
@property(nonatomic,strong)UIView* lineView;
@end
@implementation ApprovalRecordTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.width.mas_offset(1);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    self.fNameL = [MyController createLabelWithFrame:self.contentView.frame Font:16 Text:nil];
    self.fNameL.textColor = [MyController colorWithHexString:CDefaultColor];
    self.fNameL.textAlignment = NSTextAlignmentCenter;
    self.fNameL.backgroundColor = [MyController colorWithHexString:CNavBgColor];
    //切圆角
    [self.fNameL.layer setCornerRadius:20];
    self.fNameL.layer.masksToBounds = YES;
    [self.contentView addSubview:self.fNameL];
    
    [self.fNameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.lineView.mas_centerX);
        make.top.mas_equalTo(20);
        make.width.mas_offset(40);
        make.height.mas_offset(40);
    }];
    
    self.timeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.timeL.textColor = [MyController colorWithHexString:CFontColor2];
    self.timeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(25);
    }];
    
    self.nameL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.nameL.textColor = [MyController colorWithHexString:CFontColor0];
    [self.contentView addSubview:self.nameL];
    
    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fNameL.mas_right).mas_offset(6);
        make.centerY.mas_equalTo(self.timeL.mas_centerY);
        make.right.mas_equalTo(self.timeL.mas_left).mas_offset(-KNormalSpace);
    }];
    
    self.desL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.desL.textColor = [MyController colorWithHexString:CFontColor2];
    self.desL.numberOfLines = 0;
    [self.contentView addSubview:self.desL];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameL);
        make.right.mas_equalTo(self.timeL);
        make.top.mas_equalTo(self.nameL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.hyb_lastViewInCell = self.desL;
    self.hyb_bottomOffsetToCell = KNormalSpace;
}

- (void)configCellWithModel:(ApprovalRecordModel *)model {
    if ([MyController returnStr:model._name].length) {
        self.fNameL.text = [model._name substringToIndex:1];
    }
    
    self.nameL.text = model._name;
    
    self.timeL.text = model._time;
    
    self.desL.text = model._des;
    
}

@end
