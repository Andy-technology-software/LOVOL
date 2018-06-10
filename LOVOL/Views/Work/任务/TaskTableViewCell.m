//
//  TaskTableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/31.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "TaskTableViewCell.h"

#import "TaskModel.h"
@interface TaskTableViewCell()
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UILabel* typeL;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIView* lineView1;
@property(nonatomic,strong)UILabel* desL;
@property(nonatomic,strong)UILabel* relatedL;

@end
@implementation TaskTableViewCell

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
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(15);
    }];
    
    self.typeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.typeL.textColor = [MyController colorWithHexString:CFontColor0];
    self.typeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.typeL];
    
    [self.typeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.timeL.mas_centerY);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeL);
        make.right.mas_equalTo(self.typeL);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.typeL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.desL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.desL.textColor = [MyController colorWithHexString:CFontColor0];
    self.desL.numberOfLines = 2;
    self.desL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.desL];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lineView);
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.lineView);
    }];
    
    self.relatedL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.relatedL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.relatedL];
    
    [self.relatedL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.desL);
        make.left.mas_equalTo(self.desL);
        make.top.mas_equalTo(self.desL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(6);
        make.top.mas_equalTo(self.relatedL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.hyb_lastViewInCell = self.lineView1;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(TaskModel *)model {
    self.timeL.text = model._time;
    
    self.typeL.text = model._type;
    
    self.desL.text = model._des;
    
    self.relatedL.text = model._bz;
}

@end
