//
//  NoticeTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "NoticeTableViewCell.h"

#import "NoticeModel.h"
@interface NoticeTableViewCell()
@property(nonatomic,strong)UIImageView* isReadIV;
@property(nonatomic,strong)UILabel* titL;
@property(nonatomic,strong)UILabel* desL;
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UIView* lineView;

@end
@implementation NoticeTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.isReadIV = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"个人中心-选中"];
    [self.contentView addSubview:self.isReadIV];
    
    [self.isReadIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
        make.width.mas_offset(30);
        make.height.mas_offset(30);
    }];
    
    self.timeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.timeL.textColor = [MyController colorWithHexString:CFontColor2];
    self.timeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(15);
    }];
    
    self.titL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.titL.textColor = [MyController colorWithHexString:CFontColor0];
    self.titL.numberOfLines = 1;
    self.titL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.titL];
    
    [self.titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.isReadIV.mas_right).mas_offset(4);
        make.centerY.mas_equalTo(self.timeL.mas_centerY);
        make.right.mas_equalTo(self.timeL.mas_left).mas_offset(-4);
    }];
    
    self.desL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.desL.textColor = [MyController colorWithHexString:CFontColor0];
    self.desL.numberOfLines = 2;
    self.desL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.desL];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titL);
        make.top.mas_equalTo(self.titL.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(self.timeL);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.desL.mas_bottom).mas_offset(15);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(NoticeModel *)model {
    self.titL.text = model._tit;
    
    self.desL.text = model._des;
    
    self.timeL.text = model._time;
    
    if (!model._isRead) {
        self.isReadIV.image = [UIImage imageNamed:@"个人中心-选中"];
    }else {
        self.isReadIV.image = [UIImage imageNamed:@"个人中心"];
    }
}

@end
