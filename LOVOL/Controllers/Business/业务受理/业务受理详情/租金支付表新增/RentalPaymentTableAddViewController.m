//
//  RentalPaymentTableAddViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/25.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RentalPaymentTableAddViewController.h"

#import "RentalPaymentTable00Model.h"

#import "RentalPaymentTable10Model.h"

#import "RentalPaymentTable20Model.h"

#import "RentalPaymentTable00TableViewCell.h"

#import "RentalPaymentTable10TableViewCell.h"

#import "RentalPaymentTable20TableViewCell.h"
@interface RentalPaymentTableAddViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;
@property(nonatomic,strong)NSMutableArray* dataArr1;
@property(nonatomic,strong)NSMutableArray* dataArr2;

@end

@implementation RentalPaymentTableAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    self.dataArr1 = [[NSMutableArray alloc] init];
    self.dataArr2 = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeSaveBtn];
    [self makeData];
}

- (void)makeSaveBtn {
    UIButton* saveBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(saveBtnClick) Title:@"立即审批"];
    [saveBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    [saveBtn setTitleColor:[MyController colorWithHexString:CDefaultColor] forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:saveBtn];
    
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_offset(50);
        make.top.mas_equalTo(self.tableView.mas_bottom);
    }];
    
}

- (void)saveBtnClick {
    DLog(@"立即审批");
//    [self.TrailerProgressInquiryConditionViewControllerDelegate sendBackClzt:@"" cxtj:@""];
//    [self.navigationController popViewControllerAnimated:YES];
}

/**
 数据初始化
 */
- (void)makeData {
    RentalPaymentTable00Model* model = [[RentalPaymentTable00Model alloc] init];
    model.titArr = [[NSMutableArray alloc] initWithObjects:@"承租人:李磊",@"代理/经销商:韩梅梅",@"台数:10",@"整车价款:￥10000000.00",@"贷款利率:1%",@"租赁期限:24个月",@"起租日:2018-01-01",@"首期还款日:2018-01-01",@"融资额:￥100000.00",@"首付款:￥1000000.00",@"保证金:￥10000.00",@"服务费:￥800.00", nil];
    model.qcsfhj = @"期初收付合计:￥10000000.00";
    [self.dataArr addObject:model];
    
    for (int i = 0; i < 10; i++) {
        RentalPaymentTable10Model* model1 = [[RentalPaymentTable10Model alloc] init];
        model1._qishu = [NSString stringWithFormat:@"%d",i + 1];
        model1.titA = [[NSMutableArray alloc] initWithObjects:@"2018-01-01",@"￥8000.00",@"￥1000.00",@"￥1000.00", nil];
        [self.dataArr1 addObject:model1];
    }
    
    RentalPaymentTable20Model* model2 = [[RentalPaymentTable20Model alloc] init];
    model2._titA = [[NSMutableArray alloc] initWithObjects:@"合计:￥10000000.00",@"名义货价:￥8000.00", nil];
    [self.dataArr2 addObject:model2];
    
    [self.tableView reloadData];
}

#pragma mark -  初始化UI
-(void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setBackgroundColor:[MyController colorWithHexString:CViewF5Color]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return self.dataArr.count;
    }else if (1 == section) {
        return self.dataArr1.count;
    }
    return self.dataArr2.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        RentalPaymentTable00Model *model = nil;
        if (indexPath.row < self.dataArr.count) {
            model = [self.dataArr objectAtIndex:indexPath.row];
        }
        
        return [RentalPaymentTable00TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            RentalPaymentTable00TableViewCell *cell = (RentalPaymentTable00TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (1 == indexPath.section) {
        RentalPaymentTable10Model *model = nil;
        if (indexPath.row < self.dataArr1.count) {
            model = [self.dataArr1 objectAtIndex:indexPath.row];
        }
        
        return [RentalPaymentTable10TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            RentalPaymentTable10TableViewCell *cell = (RentalPaymentTable10TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    RentalPaymentTable20Model *model = nil;
    if (indexPath.row < self.dataArr2.count) {
        model = [self.dataArr2 objectAtIndex:indexPath.row];
    }
    
    return [RentalPaymentTable20TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        RentalPaymentTable20TableViewCell *cell = (RentalPaymentTable20TableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        RentalPaymentTable00TableViewCell* cell0 = [[RentalPaymentTable00TableViewCell alloc] init];
         cell0.selectionStyle = UITableViewCellSelectionStyleNone;
         RentalPaymentTable00Model* model = self.dataArr[indexPath.row];
         [cell0 configCellWithModel:model];
         return cell0;
    }else if (1 == indexPath.section) {
        static NSString *cellIdentifier = @"RentalPaymentTable10TableViewCell";
        RentalPaymentTable10TableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell0) {
            cell0 = [[RentalPaymentTable10TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        RentalPaymentTable10Model* model = self.dataArr1[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }
    RentalPaymentTable20TableViewCell* cell0 = [[RentalPaymentTable20TableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    RentalPaymentTable20Model* model = self.dataArr2[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

#pragma mark - 头标题UI
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (0 == section || 2 == section) {
        return nil;
    }
    UIView* headV1 = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    headV1.backgroundColor = [UIColor whiteColor];
    
    UILabel* titL = [MyController createLabelWithFrame:headV1.frame Font:CFontSize1 Text:@"租金支付明细"];
    titL.textColor = [MyController colorWithHexString:CNavBgColor];
    [headV1 addSubview:titL];
    
    [titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(headV1.mas_centerX);
        make.top.mas_equalTo(0);
        make.height.mas_offset(50);
    }];
    
    UIView* headV = [MyController viewWithFrame:CGRectMake(0, 50, [MyController getScreenWidth], 50)];
    headV.backgroundColor = [UIColor whiteColor];
    [headV1 addSubview:headV];
    
    UILabel* qishuL = [MyController createLabelWithFrame:headV.frame Font:CFontSize1 Text:@"期数"];
    qishuL.textAlignment = NSTextAlignmentCenter;
    qishuL.textColor = [MyController colorWithHexString:CNavBgColor];
    [headV addSubview:qishuL];
    
    [qishuL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(40);
        make.centerY.mas_equalTo(headV.mas_centerY);
    }];
    
    UIView* secV = [MyController viewWithFrame:headV.frame];
    secV.backgroundColor = [UIColor whiteColor];
    [headV addSubview:secV];
    
    [secV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(qishuL.mas_right);
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(headV.mas_centerY);
        make.height.mas_offset(50);
    }];
    
    NSArray* titA = [[NSArray alloc] initWithObjects:@"还款日期",@"应还本金",@"应还利息",@"应还月租金", nil];
    float titWidth = ([MyController getScreenWidth] - 40) / titA.count;
    for (int i = 0; i < titA.count; i++) {
        UILabel* titL = [MyController createLabelWithFrame:CGRectMake(titWidth * i, 0, titWidth, 50) Font:CFontSize1 Text:titA[i]];
        titL.textAlignment = NSTextAlignmentCenter;
        titL.textColor = [MyController colorWithHexString:CNavBgColor];
        [secV addSubview:titL];
    }
    
    for (int i = 0; i < titA.count; i++) {
        UIView* lineV = [MyController viewWithFrame:CGRectMake(titWidth * i, 0, 0.5, 50)];
        lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
        [secV addSubview:lineV];
    }
    
    for (int i = 0; i < 3; i++) {
        UIView* lineV = [MyController viewWithFrame:CGRectMake(0, 50 * i, [MyController getScreenWidth], 1)];
        lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
        [headV1 addSubview:lineV];
    }
    
    
    return headV1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (1 == section) {
        return 100;
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
