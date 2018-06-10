
//
//  TimePunch0TableViewCell.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/31.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "TimePunch0TableViewCell.h"

#import "TimePunch0Model.h"
@interface TimePunch0TableViewCell()
@property(nonatomic,strong)UILabel* leftNameL;
@property(nonatomic,strong)UILabel* nameL;
@property(nonatomic,strong)UILabel* groupL;
@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UILabel* desL;
@end
@implementation TimePunch0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.leftNameL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:[self getCurrentDay1]];
    self.leftNameL.textColor = [MyController colorWithHexString:CDefaultColor];
    self.leftNameL.backgroundColor = [MyController colorWithHexString:CNavBgColor];
    self.leftNameL.textAlignment = NSTextAlignmentCenter;
    [self.leftNameL.layer setCornerRadius:30];
    self.leftNameL.layer.masksToBounds = YES;
    [self.contentView addSubview:self.leftNameL];
    
    [self.leftNameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
        make.width.mas_offset(60);
        make.height.mas_offset(60);
    }];
    
    self.timeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:[self getCurrentDay1]];
    self.timeL.textColor = [MyController colorWithHexString:CFontColor2];
    self.timeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.centerY.mas_equalTo(self.leftNameL.mas_centerY);
    }];
    
    self.nameL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.nameL.numberOfLines = 1;
    self.nameL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.nameL];
    
    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftNameL.mas_right).mas_offset(4);
        make.centerY.mas_equalTo(self.leftNameL.mas_centerY).mas_offset(-KNormalSpace);
        make.right.mas_equalTo(self.timeL.mas_left).mas_offset(-KNormalSpace);
    }];
    
    self.groupL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:nil];
    self.groupL.numberOfLines = 1;
    self.groupL.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.groupL];
    
    [self.groupL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameL);
        make.centerY.mas_equalTo(self.leftNameL.mas_centerY).mas_offset(KNormalSpace);
        make.right.mas_equalTo(self.nameL);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.leftNameL.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.desL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize1 Text:@"坚持是世上最难的事，也是最容易的事"];
    self.desL.textColor = [MyController colorWithHexString:CFontColor2];
    self.desL.numberOfLines = 0;
    [self.contentView addSubview:self.desL];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftNameL);
        make.right.mas_equalTo(self.timeL);
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    [AMapServices sharedServices].enableHTTPS = YES;
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.contentView.frame];
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    _mapView.showsCompass = NO;
    _mapView.showsScale = NO;
    [_mapView setZoomLevel:15.2 animated:YES];
    [self.contentView addSubview:_mapView];
    
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.desL.mas_bottom).mas_offset(KNormalSpace);
        make.height.mas_offset([MyController getScreenWidth] / 2);
    }];
    
    UIView* bgV = [MyController viewWithFrame:self.contentView.frame];
    bgV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:bgV];
    
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    self.hyb_lastViewInCell = _mapView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(TimePunch0Model *)model {
    self.timeL.text = model._cuurrentTime;
    
    if ([MyController returnStr:model._name].length) {
        self.leftNameL.text = [model._name substringToIndex:1];
    }else {
        self.leftNameL.text = @"无";
    }
    
    self.nameL.text = model._name;
    
    self.groupL.text = model._group;
}


/**
 获取当前时间
 
 @return 返回时间
 */
- (NSString*)getCurrentDay1{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}

@end
