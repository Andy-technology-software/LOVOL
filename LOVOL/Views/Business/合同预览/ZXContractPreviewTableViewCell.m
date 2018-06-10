//
//  ZXContractPreviewTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/6/4.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "ZXContractPreviewTableViewCell.h"

#import "ZXContractPreviewModel.h"
@interface ZXContractPreviewTableViewCell()
@property(nonatomic,strong)UILabel* _htlxL;
@property(nonatomic,strong)UILabel* _htbhL;
@property(nonatomic,strong)UILabel* _htjeL;
@property(nonatomic,strong)UILabel* _gysL;
@property(nonatomic,strong)UIView* lineView;
@end
@implementation ZXContractPreviewTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self._htlxL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self._htlxL.numberOfLines = 0;
    self._htlxL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self._htlxL];
    
    [self._htlxL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self._htbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self._htbhL.numberOfLines = 1;
    self._htbhL.lineBreakMode = NSLineBreakByTruncatingTail;
    self._htbhL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self._htbhL];
    
    [self._htbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._htlxL);
        make.top.mas_equalTo(self._htlxL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self._htlxL);
    }];
    
    self._htjeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self._htjeL.numberOfLines = 1;
    self._htjeL.lineBreakMode = NSLineBreakByTruncatingTail;
    self._htjeL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self._htjeL];
    
    [self._htjeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._htbhL);
        make.right.mas_equalTo(self._htbhL);
        make.top.mas_equalTo(self._htbhL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self._gysL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self._gysL.numberOfLines = 1;
    self._gysL.lineBreakMode = NSLineBreakByTruncatingTail;
    self._gysL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self._gysL];
    
    [self._gysL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._htjeL);
        make.top.mas_equalTo(self._htjeL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self._htjeL);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self._gysL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(0);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(ZXContractPreviewModel *)model {
    self._htlxL.text = model._htlx;
    self._htbhL.text = model._htbh;
    self._htjeL.text = model._htje;
    self._gysL.text = model._gys;
    
}

@end

