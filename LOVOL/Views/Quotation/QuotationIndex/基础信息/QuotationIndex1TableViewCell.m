//
//  QuotationIndex1TableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/8.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "QuotationIndex1TableViewCell.h"

@interface QuotationIndex1TableViewCell()
@property(nonatomic,strong)UIImageView* dangerImgView;
@property(nonatomic,strong)UILabel* titL;

@end
@implementation QuotationIndex1TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    
    self.titL = [MyController createLabelWithFrame:self.contentView.frame Font:11 Text:@"使用指定本金计算方法，请填写约定还款信息"];
    self.titL.textColor = [MyController colorWithHexString:@"e6393f"];
    [self.contentView addSubview:self.titL];
    
    [self.titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX).mas_offset(4);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.height.mas_offset(30);
    }];
    
    
    self.dangerImgView = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"注意"];
    [self.contentView addSubview:self.dangerImgView];
    
    [self.dangerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.titL.mas_left).mas_offset(-4);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.mas_offset(12);
        make.height.mas_offset(12);
    }];
    
    self.hyb_lastViewInCell = self.titL;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel {

}

@end
