//
//  BusinessAccountIndexTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "BusinessAccountIndexTableViewCell.h"

#import "BusinessAccountIndexModel.h"
@interface BusinessAccountIndexTableViewCell()
@property(nonatomic,strong)UILabel* _titL;
@property(nonatomic,strong)UIImageView* _leftIV;
@property(nonatomic,strong)UIImageView* _rightIV;
@property(nonatomic,strong)UIView* lineView;
@end
@implementation BusinessAccountIndexTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self._leftIV = [MyController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    [self.contentView addSubview:self._leftIV];
    
    [self._leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.mas_offset(22);
        make.height.mas_offset(22);
    }];
    
    self._rightIV = [MyController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    [self.contentView addSubview:self._rightIV];
    
    [self._rightIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.height.mas_offset(22);
        make.width.mas_offset(22);
    }];
    
    self._titL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    [self.contentView addSubview:self._titL];
    
    [self._titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._leftIV.mas_right).mas_offset(4);
        make.top.mas_equalTo(K15NormalSpace);
        make.right.mas_equalTo(self._rightIV.mas_left).mas_offset(-KNormalSpace);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_offset(1);
        make.top.mas_equalTo(self._titL.mas_bottom).mas_offset(K15NormalSpace);
        make.right.mas_equalTo(0);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(BusinessAccountIndexModel *)model {
    self._leftIV.image = [UIImage imageNamed:model._leftImg];
    
    self._rightIV.image = [UIImage imageNamed:model._rightImg];
    
    self._titL.text = model._tit;
    
}

@end
