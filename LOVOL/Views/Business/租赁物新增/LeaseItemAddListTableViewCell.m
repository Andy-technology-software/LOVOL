
//
//  LeaseItemAddListTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/25.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "LeaseItemAddListTableViewCell.h"

#import "LeaseItemAddListModel.h"
@interface LeaseItemAddListTableViewCell()
@property(nonatomic,strong)UILabel* zlwlxL;
@property(nonatomic,strong)UILabel* xhL;
@property(nonatomic,strong)UILabel* ccbhL;
@property(nonatomic,strong)UILabel* fdjbhL;
@property(nonatomic,strong)UILabel* sbjkL;
@property(nonatomic,strong)UILabel* cjdjL;
@property(nonatomic,strong)UILabel* slL;
@property(nonatomic,strong)UIView* lineView;
@end
@implementation LeaseItemAddListTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.zlwlxL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.zlwlxL.textColor = [MyController colorWithHexString:CFontColor0];
    [self.contentView addSubview:self.zlwlxL];
    
    [self.zlwlxL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self.xhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.xhL.textColor = [MyController colorWithHexString:CFontColor1];
    [self.contentView addSubview:self.xhL];
    
    [self.xhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.zlwlxL);
        make.top.mas_equalTo(self.zlwlxL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    self.ccbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.ccbhL.textColor = [MyController colorWithHexString:CFontColor1];
    [self.contentView addSubview:self.ccbhL];
    
    [self.ccbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_centerX).mas_offset(4);
        make.top.mas_equalTo(self.xhL);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self.fdjbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.fdjbhL.textColor = [MyController colorWithHexString:CFontColor1];
    [self.contentView addSubview:self.fdjbhL];
    
    [self.fdjbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.xhL);
        make.top.mas_equalTo(self.xhL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.xhL);
    }];
    
    self.sbjkL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.sbjkL.textColor = [MyController colorWithHexString:CFontColor1];
    [self.contentView addSubview:self.sbjkL];
    
    [self.sbjkL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.ccbhL);
        make.top.mas_equalTo(self.ccbhL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.ccbhL);
    }];
    
    self.cjdjL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.cjdjL.textColor = [MyController colorWithHexString:CFontColor1];
    [self.contentView addSubview:self.cjdjL];
    
    [self.cjdjL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fdjbhL);
        make.top.mas_equalTo(self.fdjbhL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.fdjbhL);
    }];
    
    self.slL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.slL.textColor = [MyController colorWithHexString:CFontColor1];
    [self.contentView addSubview:self.slL];
    
    [self.slL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.sbjkL);
        make.top.mas_equalTo(self.sbjkL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.sbjkL);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(1);
        make.top.mas_equalTo(self.slL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(LeaseItemAddListModel *)model {
    
    self.zlwlxL.text = [NSString stringWithFormat:@"租赁物类型:%@",model._zlwlx];
    
    self.xhL.text = [NSString stringWithFormat:@"型号:%@",model._xh];
    
    self.ccbhL.text = [NSString stringWithFormat:@"出厂编号:%@",model._ccbh];
    
    self.fdjbhL.text = [NSString stringWithFormat:@"发动机编号/电机编号:%@",model._fdjbh];
    
    self.sbjkL.text = [NSString stringWithFormat:@"设备价款:%@",model._sbjk];
    
    self.cjdjL.text = [NSString stringWithFormat:@"成交单价:%@",model._cjdj];
    
    self.slL.text = [NSString stringWithFormat:@"数量:%@",model._sl];
    
}

@end

