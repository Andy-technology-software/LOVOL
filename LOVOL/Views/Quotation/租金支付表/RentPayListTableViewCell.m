//
//  RentPayListTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RentPayListTableViewCell.h"

#import "RentPayListModel.h"
@interface RentPayListTableViewCell()
@property(nonatomic,strong)UILabel* qishuL;

@property(nonatomic,strong)UIView* secV;
@property(nonatomic,strong)UIView* lineView;

@end
@implementation RentPayListTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.qishuL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.qishuL.textAlignment = NSTextAlignmentCenter;
    self.qishuL.textColor = [MyController colorWithHexString:CFontColor1];
    [self.contentView addSubview:self.qishuL];
    
    [self.qishuL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(40);
        make.height.mas_offset(50);
        make.top.mas_equalTo(0);
    }];
    
    self.secV = [MyController viewWithFrame:self.contentView.frame];
    self.secV.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.secV];
    
    [self.secV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.qishuL.mas_right);
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(self.qishuL.mas_centerY);
        make.height.mas_equalTo(self.qishuL);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(49.5);
    }];
    
    self.hyb_lastViewInCell = self.qishuL;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(RentPayListModel *)model {
    self.qishuL.text = model._qishu;
    
    float titWidth = ([MyController getScreenWidth] - 40) / 3;
    for (int i = 0; i < 3; i++) {
        UILabel* titL = [MyController createLabelWithFrame:CGRectMake(titWidth * i, 0, titWidth, 50) Font:CFontSize2 Text:model.titA[i]];
        titL.textAlignment = NSTextAlignmentCenter;
        titL.textColor = [MyController colorWithHexString:CFontColor1];
        [self.secV addSubview:titL];
    }
    
    for (int i = 0; i < 3; i++) {
        UIView* lineV = [MyController viewWithFrame:CGRectMake(titWidth * i, 0, 0.5, 50)];
        lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
        [self.secV addSubview:lineV];
    }
}

@end
