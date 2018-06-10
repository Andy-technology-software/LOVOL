
//
//  PageFirstIndex0TableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/2.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "PageFirstIndex0TableViewCell.h"

#import "PageFirstIndex0Model.h"
@interface PageFirstIndex0TableViewCell()
@property(nonatomic,strong)UIButton* moreBtn;
@property(nonatomic,strong)UIImageView* msgIV;
@property(nonatomic,strong)UILabel* titL;
@property(nonatomic,strong)UILabel* desL;

@end
@implementation PageFirstIndex0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.msgIV = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"提醒"];
    [self.contentView addSubview:self.msgIV];
    
    [self.msgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.mas_offset(42);
        make.height.mas_offset(30);
    }];
    
    self.moreBtn = [MyController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(moreBtnClick) Title:@"MORE"];
    [self.moreBtn setTitleColor:[MyController colorWithHexString:CYellowColor] forState:UIControlStateNormal];
    self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.moreBtn];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(5);
        make.width.mas_offset(60);
        make.height.mas_offset(40);
    }];
    
    self.titL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.titL.textColor = [MyController colorWithHexString:CFontColor0];
    self.titL.numberOfLines = 1;
    self.titL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.titL];
    
    [self.titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.msgIV.mas_right).mas_offset(8);
        make.centerY.mas_equalTo(self.moreBtn.mas_centerY);
        make.right.mas_equalTo(self.moreBtn.mas_left).mas_offset(-4);
    }];
    
    self.desL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.desL.textColor = [MyController colorWithHexString:CFontColor0];
    self.desL.numberOfLines = 1;
    self.desL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.desL];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titL);
        make.top.mas_equalTo(self.titL.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(self.moreBtn);
    }];
    
    self.hyb_lastViewInCell = self.desL;
    self.hyb_bottomOffsetToCell = 15;
}

- (void)configCellWithModel:(PageFirstIndex0Model *)model {
    self.titL.text = model.title;
    
    self.desL.text = model.des;
}

- (void)moreBtnClick {
    [self.PageFirstIndex0TableViewCellDelegate sendBackS0More];
}

@end
