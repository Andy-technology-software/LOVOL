
//
//  WorkIndexTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/3.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "WorkIndexTableViewCell.h"

#import "WorkIndexModel.h"
@interface WorkIndexTableViewCell()
@property(nonatomic,strong)UIView* shenpiItemView;
@property(nonatomic,strong)UIView* shenpiItemView1;
@property(nonatomic,strong)UIView* shenpiItemView2;
@property(nonatomic,strong)UIView* shenpiItemView3;
@property(nonatomic,strong)UIView* guanliItemView;
@end
@implementation WorkIndexTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    
    self.shenpiItemView = [MyController viewWithFrame:self.contentView.frame];
    self.shenpiItemView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    [self.contentView addSubview:self.shenpiItemView];
    
    [self.shenpiItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(6);
        make.height.mas_offset(95);
    }];
    
    self.shenpiItemView1 = [MyController viewWithFrame:self.contentView.frame];
    self.shenpiItemView1.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    [self.contentView addSubview:self.shenpiItemView1];
    
    [self.shenpiItemView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(self.shenpiItemView.mas_centerY);
        make.height.mas_offset(0.5);
    }];
    
    
    self.shenpiItemView2 = [MyController viewWithFrame:self.contentView.frame];
    self.shenpiItemView2.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    [self.contentView addSubview:self.shenpiItemView2];
    
    [self.shenpiItemView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.shenpiItemView.mas_centerX);
        make.bottom.mas_equalTo(self.shenpiItemView.mas_centerY).mas_offset(-10);
        make.height.mas_offset((95 / 2) - 20);
        make.width.mas_offset(0.5);
    }];
    
    
    self.shenpiItemView3 = [MyController viewWithFrame:self.contentView.frame];
    self.shenpiItemView3.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    [self.contentView addSubview:self.shenpiItemView3];
    
    [self.shenpiItemView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.shenpiItemView.mas_centerX);
        make.top.mas_equalTo(self.shenpiItemView.mas_centerY).mas_offset(10);
        make.height.mas_offset((95 / 2) - 20);
        make.width.mas_offset(0.5);
    }];
    
    
    self.guanliItemView = [MyController viewWithFrame:self.contentView.frame];
    self.guanliItemView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    [self.contentView addSubview:self.guanliItemView];
    
    [self.guanliItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.shenpiItemView.mas_bottom).mas_offset(17);
        make.height.mas_offset(((([MyController getScreenWidth] - 40) / 3) * 2) + 20);
    }];
    
    
    self.hyb_lastViewInCell = self.guanliItemView;
    self.hyb_bottomOffsetToCell = 20;
}

- (void)configCellWithModel:(WorkIndexModel *)model {
    NSArray* titA = [[NSArray alloc] initWithObjects:@"考勤",@"日报",@"报岗",@"任务", nil];
    NSArray* titNumA = [[NSMutableArray alloc] initWithObjects:model.kaoqin,model.ribao,model.baogang,model.renwu, nil];
    for (int i = 0; i < titA.count; i++) {
        UIView* temV = [MyController viewWithFrame:CGRectMake((([MyController getScreenWidth] / 2) * (i % 2)), ((95 / 2) * (i / 2)), [MyController getScreenWidth] / 2, 95 / 2)];
        temV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
        [self.shenpiItemView addSubview:temV];
        
        UILabel* titL = [MyController createLabelWithFrame:temV.frame Font:CFontSize1 Text:titA[i]];
        [temV addSubview:titL];
        
        [titL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KNormalSpace);
            make.centerY.mas_equalTo(temV.mas_centerY);
            make.width.mas_offset(40);
        }];
        
        
        UILabel* titNumL = [MyController createLabelWithFrame:temV.frame Font:CFontSize1 Text:titNumA[i]];
        titNumL.textAlignment = NSTextAlignmentRight;
        titNumL.textColor = [MyController colorWithHexString:CNavBgColor];
        [temV addSubview:titNumL];
        
        [titNumL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-KNormalSpace);
            make.centerY.mas_equalTo(temV.mas_centerY);
            make.left.mas_equalTo(titL.mas_right).mas_offset(KNormalSpace);
        }];
        
        UIButton* temB = [MyController createButtonWithFrame:temV.frame ImageName:nil Target:self Action:@selector(temBClick:) Title:nil];
        temB.tag = 100 + i;
        [self.shenpiItemView addSubview:temB];
    }
    
    
    
    NSArray* tit2A = [[NSArray alloc] initWithObjects:@"任务",@"日报",@"报岗",@"考勤",@"考勤统计", nil];
    for (int i = 0; i < tit2A.count; i++) {
        UIView* temV = [MyController viewWithFrame:CGRectMake((((([MyController getScreenWidth] - 40) / 3) + 10) * (i % 3)), (((([MyController getScreenWidth] - 40) / 3) + 20) * (i / 3)), ((([MyController getScreenWidth] - 40) / 3)), ((([MyController getScreenWidth] - 40) / 3)))];
        temV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
        [temV.layer setCornerRadius:6];
        temV.layer.masksToBounds = YES;
        [self.guanliItemView addSubview:temV];
        
        UIImageView* itemIV = [MyController createImageViewWithFrame:temV.frame ImageName:tit2A[i]];
        [temV addSubview:itemIV];
        
        [itemIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(temV.mas_centerX);
            make.centerY.mas_equalTo(temV.mas_centerY);
            make.width.mas_offset(80);
            make.height.mas_offset(80);
        }];
        
        UIButton* temB = [MyController createButtonWithFrame:temV.frame ImageName:nil Target:self Action:@selector(temBClick:) Title:nil];
        temB.tag = 200 + i;
        [self.guanliItemView addSubview:temB];
    }
}

- (void)temBClick:(UIButton*)btn {
    [self.WorkIndexTableViewCellDelegate sendBackSelectedTagValue:btn.tag];
    
}

@end
