//
//  MsgTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "MsgTableViewCell.h"

#import "MsgModel.h"
@interface MsgTableViewCell()
@property(nonatomic,strong)UIImageView* isReadIV;
@property(nonatomic,strong)UILabel* bhL;
@property(nonatomic,strong)UILabel* xhL;
@property(nonatomic,strong)UILabel* czrL;
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UIView* lineView;

@end
@implementation MsgTableViewCell

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
    
    self.bhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.bhL.textColor = [MyController colorWithHexString:CFontColor0];
    self.bhL.numberOfLines = 1;
    self.bhL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.bhL];
    
    [self.bhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.isReadIV.mas_right).mas_offset(4);
        make.centerY.mas_equalTo(self.timeL.mas_centerY);
        make.right.mas_equalTo(self.timeL.mas_left).mas_offset(-4);
    }];
    
    self.czrL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.czrL.textColor = [MyController colorWithHexString:CFontColor0];
    self.czrL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.czrL];
    
    [self.czrL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.timeL);
        make.top.mas_equalTo(self.bhL.mas_bottom).mas_offset(10);
    }];
    
    self.xhL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.xhL.textColor = [MyController colorWithHexString:CFontColor0];
    self.xhL.numberOfLines = 1;
    self.xhL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.xhL];
    
    [self.xhL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bhL.mas_left);
        make.centerY.mas_equalTo(self.czrL.mas_centerY);
        make.right.mas_equalTo(self.czrL.mas_left).mas_offset(-4);
    }];
    
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.xhL.mas_bottom).mas_offset(15);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(MsgModel *)model {
    self.bhL.text = model._bh;
    
    self.timeL.text = model._time;
    
    self.xhL.text = model._xh;
    
    self.czrL.text = model._czr;
    
    if (!model._isRead) {
        self.isReadIV.image = [UIImage imageNamed:@"个人中心-选中"];
    }else {
        self.isReadIV.image = [UIImage imageNamed:@"个人中心"];
    }
}

@end

