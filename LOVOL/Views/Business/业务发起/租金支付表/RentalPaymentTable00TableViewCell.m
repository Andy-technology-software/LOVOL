//
//  RentalPaymentTable00TableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RentalPaymentTable00TableViewCell.h"

#import "RentalPaymentTable00Model.h"
@interface RentalPaymentTable00TableViewCell()
@property(nonatomic,strong)UIView* bgView;
@property(nonatomic,strong)UIView* lineView;
@end
@implementation RentalPaymentTable00TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.bgView = [MyController viewWithFrame:self.contentView.frame];
    [self.contentView addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset(350);
    }];
    
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 0;
    
}

- (void)configCellWithModel:(RentalPaymentTable00Model *)model {
    float lwidth = ([MyController getScreenWidth] - 0) / 2;
    for (int i = 0; i < 12; i++) {
        UIView* titV = [MyController viewWithFrame:CGRectMake(lwidth * (i % 2) + 10, 50 * (i / 2), lwidth - 10, 50)];
        [self.bgView addSubview:titV];
        
        UILabel* titL = [MyController createLabelWithFrame:titV.frame Font:CFontSize1 Text:model.titArr[i]];
        titL.numberOfLines = 1;
        titL.lineBreakMode = NSLineBreakByTruncatingTail;
        [titV addSubview:titL];
        
        [titL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(-2);
            make.centerY.mas_equalTo(titV.mas_centerY);
        }];
    }
    
    UILabel* qccfhjL = [MyController createLabelWithFrame:self.bgView.frame Font:CFontSize1 Text:model.qcsfhj];
    [self.bgView addSubview:qccfhjL];
    
    [qccfhjL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
        make.bottom.mas_equalTo(0);
        make.height.mas_offset(50);
    }];
    
    for (int i = 0; i < 8; i++) {
        UIView* lineV = [MyController viewWithFrame:CGRectMake(0, 50 * i, [MyController getScreenWidth], 1)];
        lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
        [self.contentView addSubview:lineV];
    }
    UIView* lineV = [MyController viewWithFrame:self.bgView.frame];
    lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.bgView addSubview:lineV];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bgView.mas_centerX);
        make.width.mas_offset(1);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-50);
    }];
    
}

@end
