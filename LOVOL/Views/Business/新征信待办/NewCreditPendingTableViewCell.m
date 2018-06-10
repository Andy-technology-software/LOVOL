//
//  NewCreditPendingTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/18.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "NewCreditPendingTableViewCell.h"

#import "NewCreditPendingModel.h"
@interface NewCreditPendingTableViewCell()
@property(nonatomic,strong)UILabel* kehuL;
@property(nonatomic,strong)UILabel* numL;
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UILabel* senderL;
@property(nonatomic,strong)UIView* lineView;

@end
@implementation NewCreditPendingTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.timeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.timeL.textColor = [MyController colorWithHexString:CFontColor2];
    self.timeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(15);
    }];
    
    self.numL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.numL.textColor = [MyController colorWithHexString:CFontColor0];
    self.numL.numberOfLines = 1;
    self.numL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.numL];
    
    [self.numL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.timeL.mas_centerY);
        make.right.mas_equalTo(self.timeL.mas_left).mas_offset(-4);
    }];
    
    self.kehuL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.kehuL.textColor = [MyController colorWithHexString:CFontColor0];
    [self.contentView addSubview:self.kehuL];
    
    [self.kehuL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.numL);
        make.top.mas_equalTo(self.numL.mas_bottom).mas_offset(10);
    }];
    
    self.senderL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.senderL.textColor = [MyController colorWithHexString:CFontColor0];
    self.senderL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.senderL];
    
    [self.senderL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.kehuL.mas_centerY);
        make.right.mas_equalTo(self.timeL);
        make.left.mas_equalTo(self.kehuL.mas_right).mas_offset(4);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.kehuL.mas_bottom).mas_offset(15);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(NewCreditPendingModel *)model {
    self.numL.text = model._num;
    
    self.timeL.text = model._time;
    
    self.kehuL.text = model._client;
    
    self.senderL.text = model._sender;

}

@end
