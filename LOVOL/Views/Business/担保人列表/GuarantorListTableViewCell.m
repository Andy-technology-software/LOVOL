//
//  GuarantorListTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/3.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "GuarantorListTableViewCell.h"

#import "GuarantorListModel.h"
@interface GuarantorListTableViewCell()
@property(nonatomic,strong)UILabel* _dbmcL;
@property(nonatomic,strong)UILabel* _dbbhL;
@property(nonatomic,strong)UILabel* _dblxL;
@property(nonatomic,strong)UILabel* _dbrkhbhL;
@property(nonatomic,strong)UILabel* _dbrkhmcL;
@property(nonatomic,strong)UIView* lineView;
@end
@implementation GuarantorListTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];

    self._dbmcL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    [self.contentView addSubview:self._dbmcL];
    
    [self._dbmcL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    
    self._dbbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self._dbbhL.numberOfLines = 1;
    self._dbbhL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self._dbbhL];
    
    [self._dbbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._dbmcL);
        make.top.mas_equalTo(self._dbmcL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    self._dblxL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self._dblxL.numberOfLines = 1;
    self._dblxL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self._dblxL];
    
    [self._dblxL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._dbbhL.mas_right).mas_offset(4);
        make.right.mas_equalTo(-KNormalSpace);
        make.centerY.mas_equalTo(self._dbbhL.mas_centerY);
    }];
    
    self._dbrkhbhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self._dbrkhbhL.numberOfLines = 1;
    self._dbrkhbhL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self._dbrkhbhL];
    
    [self._dbrkhbhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._dbbhL);
        make.top.mas_equalTo(self._dbbhL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self._dbbhL);
    }];
    
    self._dbrkhmcL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self._dbrkhmcL.numberOfLines = 1;
    self._dbrkhmcL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self._dbrkhmcL];
    
    [self._dbrkhmcL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._dbrkhbhL.mas_right).mas_offset(4);
        make.right.mas_equalTo(self._dblxL);
        make.centerY.mas_equalTo(self._dbrkhbhL.mas_centerY);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self._dbrkhmcL.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(0);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(GuarantorListModel *)model {
    self._dbmcL.text = model._dbmc;
    self._dbbhL.text = model._dbbh;
    self._dblxL.text = model._dblx;
    self._dbrkhbhL.text = model._dbrkhbh;
    self._dbrkhmcL.text = model._dbrkhmc;

}

@end
