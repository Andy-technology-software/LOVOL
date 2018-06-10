//
//  RentalPaymentTable20TableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RentalPaymentTable20TableViewCell.h"

#import "RentalPaymentTable20Model.h"
@interface RentalPaymentTable20TableViewCell()
@property(nonatomic,strong)UIView* bgView;
@property(nonatomic,strong)UIView* lineView;
@end
@implementation RentalPaymentTable20TableViewCell

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
        make.left.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
        make.height.mas_offset(100);
    }];
    
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 0;
    
}

- (void)configCellWithModel:(RentalPaymentTable20Model *)model {
    for (int i = 0; i < model._titA.count; i++) {
        UIView* titV = [MyController viewWithFrame:CGRectMake(0, 50 * i, [MyController getScreenWidth] - 20, 50)];
        [self.bgView addSubview:titV];
        
        UILabel* titL = [MyController createLabelWithFrame:titV.frame Font:CFontSize1 Text:model._titA[i]];
        titL.numberOfLines = 1;
        titL.lineBreakMode = NSLineBreakByTruncatingTail;
        [titV addSubview:titL];
        
        [titL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(titV.mas_centerY);
        }];
    }
    
    for (int i = 0; i < model._titA.count + 1; i++) {
        UIView* lineV = [MyController viewWithFrame:CGRectMake(0, 50 * i, [MyController getScreenWidth], 1)];
        lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
        [self.bgView addSubview:lineV];
    }
    
}

@end
