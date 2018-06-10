//
//  BusinessIndexTableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/3.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "BusinessIndexTableViewCell.h"

#import "PageFirstIndex0Model.h"
@interface BusinessIndexTableViewCell()
@property(nonatomic,strong)UIView* shenpiView;
@property(nonatomic,strong)UIView* shenpiLineView;
@property(nonatomic,strong)UILabel* shenpiL;
@property(nonatomic,strong)UIView* shenpiItemView;

@property(nonatomic,strong)UIView* yewuView;
@property(nonatomic,strong)UIView* yewuLineView;
@property(nonatomic,strong)UILabel* yewuL;
@property(nonatomic,strong)UIView* yewuItemView;

@property(nonatomic,strong)UIView* guanliView;
@property(nonatomic,strong)UIView* guanliLineView;
@property(nonatomic,strong)UILabel* guanliL;
@property(nonatomic,strong)UIView* guanliItemView;
@end
@implementation BusinessIndexTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    /************************************************************审批待办********************************************************************/

    self.shenpiView = [MyController viewWithFrame:self.contentView.frame];
    self.shenpiView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    [self.contentView addSubview:self.shenpiView];
    
    [self.shenpiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(6);
        make.height.mas_offset(30);
    }];
    
    self.shenpiLineView = [MyController viewWithFrame:self.shenpiView.frame];
    self.shenpiLineView.backgroundColor = [MyController colorWithHexString:CNavBgColor];
    [self.shenpiView addSubview:self.shenpiLineView];
    
    [self.shenpiLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.shenpiView.mas_centerY);
        make.height.mas_offset(20);
        make.width.mas_offset(4);
    }];
    
    self.shenpiL = [MyController createLabelWithFrame:self.shenpiView.frame Font:CFontSize1 Text:@"审批待办"];
    [self.shenpiView addSubview:self.shenpiL];
    
    [self.shenpiL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shenpiLineView.mas_right).mas_offset(KNormalSpace);
        make.centerY.mas_equalTo(self.shenpiLineView.mas_centerY);
        make.right.mas_equalTo(0);
    }];
    
    self.shenpiItemView = [MyController viewWithFrame:self.contentView.frame];
    self.shenpiItemView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    [self.contentView addSubview:self.shenpiItemView];
    
    [self.shenpiItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.shenpiView.mas_bottom).mas_offset(0.5);
        make.height.mas_offset(([MyController getScreenWidth] * 35 / 64) + 0.5);
    }];
    
    
    /**********************************************************业务办理**********************************************************************/
    
    self.yewuView = [MyController viewWithFrame:self.contentView.frame];
    self.yewuView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    [self.contentView addSubview:self.yewuView];
    
    [self.yewuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.shenpiItemView.mas_bottom).mas_offset(6);
        make.height.mas_offset(30);
    }];
    
    self.yewuLineView = [MyController viewWithFrame:self.yewuView.frame];
    self.yewuLineView.backgroundColor = [MyController colorWithHexString:CNavBgColor];
    [self.yewuView addSubview:self.yewuLineView];
    
    [self.yewuLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.yewuView.mas_centerY);
        make.height.mas_offset(20);
        make.width.mas_offset(4);
    }];
    
    self.yewuL = [MyController createLabelWithFrame:self.shenpiView.frame Font:CFontSize1 Text:@"业务办理"];
    [self.yewuView addSubview:self.yewuL];
    
    [self.yewuL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.yewuLineView.mas_right).mas_offset(KNormalSpace);
        make.centerY.mas_equalTo(self.yewuLineView.mas_centerY);
        make.right.mas_equalTo(0);
    }];
    
    self.yewuItemView = [MyController viewWithFrame:self.contentView.frame];
    self.yewuItemView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    [self.contentView addSubview:self.yewuItemView];
    
    [self.yewuItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.yewuView.mas_bottom).mas_offset(0.5);
        make.height.mas_offset([MyController getScreenWidth] * 175 / 640);
    }];
    
    
    
    /**********************************************************业务管理**********************************************************************/
    
    self.guanliView = [MyController viewWithFrame:self.contentView.frame];
    self.guanliView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    [self.contentView addSubview:self.guanliView];
    
    [self.guanliView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.yewuItemView.mas_bottom).mas_offset(6);
        make.height.mas_offset(30);
    }];
    
    self.guanliLineView = [MyController viewWithFrame:self.guanliView.frame];
    self.guanliLineView.backgroundColor = [MyController colorWithHexString:CNavBgColor];
    [self.guanliView addSubview:self.guanliLineView];
    
    [self.guanliLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.guanliView.mas_centerY);
        make.height.mas_offset(20);
        make.width.mas_offset(4);
    }];
    
    self.guanliL = [MyController createLabelWithFrame:self.guanliView.frame Font:CFontSize1 Text:@"业务管理"];
    [self.guanliView addSubview:self.guanliL];
    
    [self.guanliL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.guanliLineView.mas_right).mas_offset(KNormalSpace);
        make.centerY.mas_equalTo(self.guanliLineView.mas_centerY);
        make.right.mas_equalTo(0);
    }];
    
    self.guanliItemView = [MyController viewWithFrame:self.contentView.frame];
    self.guanliItemView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    [self.contentView addSubview:self.guanliItemView];
    
    [self.guanliItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.guanliView.mas_bottom).mas_offset(0.5);
        make.height.mas_offset([MyController getScreenWidth] * 175 / 640);
    }];
    
    self.hyb_lastViewInCell = self.guanliItemView;
    self.hyb_bottomOffsetToCell = 60;
}

- (void)configCellWithModel:(BusinessIndexModel *)model {
    float viewWidth = ([MyController getScreenWidth] - 1) / 3;
    float viewHeigth = ([MyController getScreenWidth] * 175 / 640);
    
    NSArray* shenpiImgArr = [[NSArray alloc] initWithObjects:@"征信待办",@"业务受理",@"放款审批",@"经销商准入",@"",@"", nil];
    for (int i = 0; i < shenpiImgArr.count; i++) {
        UIView* temV = [MyController viewWithFrame:CGRectMake(((viewWidth + 0.5) * (i % 3)), ((viewHeigth + 0.5)  * (i / 3)), viewWidth, viewHeigth)];
        temV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
        [self.shenpiItemView addSubview:temV];
        
        UIImageView* temIV = [MyController createImageViewWithFrame:temV.frame ImageName:shenpiImgArr[i]];
        [temV addSubview:temIV];
        
        [temIV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(temV.mas_centerX);
            make.centerY.mas_equalTo(temV.mas_centerY);
            make.height.mas_offset(80);
            make.width.mas_offset(80);
        }];
        
        UIButton* temBtn = [MyController createButtonWithFrame:temV.frame ImageName:nil Target:self Action:@selector(temBtnClick:) Title:nil];
        temBtn.tag = 100 + i;
        [self.shenpiItemView addSubview:temBtn];
    }
    
    NSArray* yewuImgArr = [[NSArray alloc] initWithObjects:@"征信发起",@"客户管理",@"业务发起", nil];
    for (int i = 0; i < yewuImgArr.count; i++) {
        UIView* temV = [MyController viewWithFrame:CGRectMake(((viewWidth + 0.5) * (i % 3)), ((viewHeigth + 0.5)  * (i / 3)), viewWidth, viewHeigth)];
        temV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
        [self.yewuItemView addSubview:temV];
        
        UIImageView* temIV = [MyController createImageViewWithFrame:temV.frame ImageName:yewuImgArr[i]];
        [temV addSubview:temIV];
        
        [temIV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(temV.mas_centerX);
            make.centerY.mas_equalTo(temV.mas_centerY);
            make.height.mas_offset(80);
            make.width.mas_offset(80);
        }];
        
        UIButton* temBtn = [MyController createButtonWithFrame:temV.frame ImageName:nil Target:self Action:@selector(temBtnClick:) Title:nil];
        temBtn.tag = 200 + i;
        [self.yewuItemView addSubview:temBtn];
    }
    
    NSArray* guanliImgArr = [[NSArray alloc] initWithObjects:@"业务台账",@"管理报表",@"", nil];
    for (int i = 0; i < guanliImgArr.count; i++) {
        UIView* temV = [MyController viewWithFrame:CGRectMake(((viewWidth + 0.5) * (i % 3)), ((viewHeigth + 0.5)  * (i / 3)), viewWidth, viewHeigth)];
        temV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
        [self.guanliItemView addSubview:temV];
        
        UIImageView* temIV = [MyController createImageViewWithFrame:temV.frame ImageName:guanliImgArr[i]];
        [temV addSubview:temIV];
        
        [temIV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(temV.mas_centerX);
            make.centerY.mas_equalTo(temV.mas_centerY);
            make.height.mas_offset(80);
            make.width.mas_offset(80);
        }];
        
        UIButton* temBtn = [MyController createButtonWithFrame:temV.frame ImageName:nil Target:self Action:@selector(temBtnClick:) Title:nil];
        temBtn.tag = 300 + i;
        [self.guanliItemView addSubview:temBtn];
    }
}

- (void)temBtnClick:(UIButton*)btn {
    [self.BusinessIndexTableViewCellDelegate sendBackSelectedTagValue:btn.tag];
}

@end
