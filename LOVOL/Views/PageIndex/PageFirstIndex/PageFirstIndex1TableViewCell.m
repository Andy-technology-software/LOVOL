//
//  PageFirstIndex1TableViewCell.m
//  LOVOL
//
//  Created by andyXu on 2018/5/2.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "PageFirstIndex1TableViewCell.h"

#import "PageFirstIndex1Model.h"
@interface PageFirstIndex1TableViewCell()
@property(nonatomic,strong)UIView* allBgView;
@property(nonatomic,strong)PYEchartsView* kEchartView;
@property(nonatomic,strong)PYEchartsView* kEchartView1;
@property(nonatomic,strong)PYEchartsView* kEchartView2;
@property(nonatomic,strong)PYEchartsView* kEchartView3;

@end
@implementation PageFirstIndex1TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    
    self.allBgView = [MyController viewWithFrame:self.contentView.frame];
    self.allBgView.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    [self.contentView addSubview:self.allBgView];
    
    [self.allBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    self.hyb_lastViewInCell = self.allBgView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(PageFirstIndex1Model *)model {
    float viewWidth = ([MyController getScreenWidth] - 10) / 2;
    float viewHeigth = ([MyController getScreenHeight] - [MyController isIOS7] - kTabBarHeight - 100) / 2;
    
    for (int i = 0; i < 4; i++) {
        UIView* bgView = [MyController viewWithFrame:CGRectMake((viewWidth + 10) * (i % 2),(viewHeigth * (i / 2) + (10 * ((i / 2) + 1))), viewWidth, viewHeigth)];
        bgView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
        bgView.tag = 100 + i;
        [self.allBgView addSubview:bgView];
        
        if (0 == i) {
            _kEchartView = [[PYEchartsView alloc] initWithFrame:bgView.frame];
            [bgView addSubview:_kEchartView];
            
            [_kEchartView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.right.mas_equalTo(-20);
                make.top.mas_equalTo(20);
                make.bottom.mas_equalTo(-20);
            }];
            [_kEchartView setOption:[self doughnutPieOption]];
            [_kEchartView loadEcharts];
            
        }else if (1 == i) {
            _kEchartView1 = [[PYEchartsView alloc] initWithFrame:bgView.frame];
            [bgView addSubview:_kEchartView1];
            
            [_kEchartView1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.right.mas_equalTo(-20);
                make.top.mas_equalTo(20);
                make.bottom.mas_equalTo(-20);
            }];
            [_kEchartView1 setOption:[self doughnutPieOption]];
            [_kEchartView1 loadEcharts];
            
        }else if (2 == i) {
            _kEchartView2 = [[PYEchartsView alloc] initWithFrame:bgView.frame];
            [bgView addSubview:_kEchartView2];
            
            [_kEchartView2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.right.mas_equalTo(-20);
                make.top.mas_equalTo(10);
                make.bottom.mas_equalTo(-10);
            }];
            [_kEchartView2 setOption:[self basicColumnOption]];
            [_kEchartView2 loadEcharts];
            
        }else if (3 == i) {
            _kEchartView3 = [[PYEchartsView alloc] initWithFrame:bgView.frame];
            [bgView addSubview:_kEchartView3];
            
            [_kEchartView3 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.right.mas_equalTo(-20);
                make.top.mas_equalTo(0);
                make.bottom.mas_equalTo(0);
            }];
            [_kEchartView3 setOption:[self basicFunnel1Option]];
            [_kEchartView3 loadEcharts];
            
        }
    }
}


/**  标准环形饼图 */
- (PYOption *)doughnutPieOption{
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option
        .calculableEqual(NO)
        .addSeries([PYPieSeries initPYPieSeriesWithBlock:^(PYPieSeries *series) {
            series.radiusEqual(@[@"40%",@"80%"])
            .nameEqual(@"访问来源")
            .typeEqual(PYSeriesTypePie)
            .dataEqual(@[@{@"value":@(50),@"name":@"模块一"},@{@"value":@(50),@"name":@"模块二"}])
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *itemStyleProp){
                    itemStyleProp.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(NO);
                    }])
                    .labelLineEqual([PYLabelLine initPYLabelLineWithBlock:^(PYLabelLine *labelLine) {
                        labelLine.showEqual(NO);
                    }]);
                }]);
            }]);
        }]);
    }];
}


/**  标准柱状图饼图 */
- (PYOption *)basicColumnOption {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@0).x2Equal(@0);
        }])
        .calculableEqual(YES)
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .addDataArr(@[@"",@"",@""]);
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue);
        }])
        .addSeries([PYCartesianSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series
            .typeEqual(PYSeriesTypeBar)
            .addDataArr(@[@100.0,@60.0,@90.0]);
        }]);
//        .addSeries([PYCartesianSeries initPYSeriesWithBlock:^(PYSeries *series) {
//            series
//            .typeEqual(PYSeriesTypeBar)
//            .addDataArr(@[@26]);
//        }])
//        .addSeries([PYCartesianSeries initPYSeriesWithBlock:^(PYSeries *series) {
//            series
//            .typeEqual(PYSeriesTypeBar)
//            .addDataArr(@[@66]);
//        }]);
    }];
}


/**  标准漏斗图 */
- (PYOption *)basicFunnel1Option {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option
        .calculableEqual(YES)
        .addSeries([PYFunnelSeries initPYFunnelSeriesWithBlock:^(PYFunnelSeries *series) {
            series.xEqual(@0)
            .widthEqual(@"85%")
            .nameEqual(@"漏斗图")
            .typeEqual(PYSeriesTypeFunnel)
            .addDataArr(@[@{@"value":@60, @"name":@"访问"}, @{@"value":@40, @"name":@"咨询"}, @{@"value":@20, @"name":@"订单"}]);
        }]);
    }];
}

@end
