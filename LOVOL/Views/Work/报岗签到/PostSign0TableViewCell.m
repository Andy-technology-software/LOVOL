//
//  PostSign0TableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/15.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "PostSign0TableViewCell.h"

#import "PostSign0Model.h"
@interface PostSign0TableViewCell()
@property(nonatomic,strong)UIImageView* timeIV;
@property(nonatomic,strong)UIImageView* addIV;

@property(nonatomic,strong)UILabel* timeL;
@property(nonatomic,strong)UILabel* addDesL;

@property(nonatomic,strong)UIView* lineView;

@property(nonatomic,strong)UILabel* addL;
@property(nonatomic,strong)UILabel* jinzhiL;

@property(nonatomic,strong)UIView* lineView1;

@end
@implementation PostSign0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    self.timeIV = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"当前时间"];
    [self.contentView addSubview:self.timeIV];
    
    [self.timeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(KNormalSpace);
        make.width.mas_offset(20);
        make.height.mas_offset(20);
    }];
    
    self.timeL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:[self getCurrentDay1]];
    self.timeL.textColor = [MyController colorWithHexString:CFontColor2];
    [self.contentView addSubview:self.timeL];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.left.mas_equalTo(self.timeIV.mas_right).mas_offset(6);
        make.centerY.mas_equalTo(self.timeIV.mas_centerY);
    }];
    
    self.addIV = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"当前位置"];
    [self.contentView addSubview:self.addIV];
    
    [self.addIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeIV);
        make.top.mas_equalTo(self.timeIV.mas_bottom).mas_offset(12);
        make.width.mas_equalTo(self.timeIV);
        make.height.mas_equalTo(self.timeIV);
    }];
    
    self.addDesL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:nil];
    self.addDesL.textColor = [MyController colorWithHexString:CFontColor2];
    self.addDesL.numberOfLines = 0;
    [self.contentView addSubview:self.addDesL];
    
    [self.addDesL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.timeL);
        make.left.mas_equalTo(self.timeL);
        make.centerY.mas_equalTo(self.addIV.mas_centerY);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(self.addIV.mas_bottom).mas_offset(KNormalSpace);
    }];
    
    self.jinzhiL = [MyController createLabelWithFrame:self.contentView.frame Font:CFontSize2 Text:@""];
    self.jinzhiL.textColor = [MyController colorWithHexString:CFontColor2];
    self.jinzhiL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.jinzhiL];
    
    [self.jinzhiL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_offset(15);
    }];
    
    self.addL = [MyController createLabelWithFrame:self.contentView.frame Font:16 Text:nil];
    self.addL.textColor = [MyController colorWithHexString:CFontColor2];
    self.addL.numberOfLines = 0;
    [self.contentView addSubview:self.addL];
    
    [self.addL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.jinzhiL.mas_left).mas_offset(-6);
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(self.jinzhiL.mas_centerY);
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
        make.top.mas_equalTo(self.addL.mas_bottom).mas_offset(KNormalSpace);
        make.height.mas_offset([MyController getScreenWidth] / 2);
    }];
    
    self.lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self.lineView1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView1];
    
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(0.5);
        make.top.mas_equalTo(_mapView.mas_bottom).mas_offset(KNormalSpace);
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
    
    self.hyb_lastViewInCell = self.lineView1;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(PostSign0Model *)model {
    self.timeL.text = model._cuurrentTime;
    
    self.addDesL.text = model._cuurrentDesAdd;
    
    self.addL.text = model._cuurrentAdd;
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
    [formatter setDateFormat:@"YYYY年MM月dd日 HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:date];
    return [[dateTime substringFromIndex:12] substringToIndex:5];
}

@end
