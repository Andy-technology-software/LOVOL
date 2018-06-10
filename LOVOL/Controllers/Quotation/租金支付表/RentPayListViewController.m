//
//  RentPayListViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "RentPayListViewController.h"

#import "RentPayListModel.h"

#import "RentPayListTableViewCell.h"
@interface RentPayListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation RentPayListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    for (int i = 0; i < 10; i++) {
        RentPayListModel* model = [[RentPayListModel alloc] init];
        model._qishu = [NSString stringWithFormat:@"%d",i + 1];
        model.titA = [[NSMutableArray alloc] initWithObjects:@"2018-01-01",@"￥8000.00",@"￥1000000.00", nil];
        [self.dataArr addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark -  初始化UI
-(void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [MyController isIOS7], [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7]) style:UITableViewStylePlain];
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

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RentPayListModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [RentPayListTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        RentPayListTableViewCell *cell = (RentPayListTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"RentPayListTableViewCell";
    RentPayListTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[RentPayListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    RentPayListModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

#pragma mark - 头标题UI
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    headV.backgroundColor = [UIColor whiteColor];
    
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
    
    NSArray* titA = [[NSArray alloc] initWithObjects:@"还款日期",@"租金",@"合计", nil];
    float titWidth = ([MyController getScreenWidth] - 40) / 3;
    for (int i = 0; i < 3; i++) {
        UILabel* titL = [MyController createLabelWithFrame:CGRectMake(titWidth * i, 0, titWidth, 50) Font:CFontSize1 Text:titA[i]];
        titL.textAlignment = NSTextAlignmentCenter;
        titL.textColor = [MyController colorWithHexString:CNavBgColor];
        [secV addSubview:titL];
    }
    
    for (int i = 0; i < 3; i++) {
        UIView* lineV = [MyController viewWithFrame:CGRectMake(titWidth * i, 0, 0.5, 50)];
        lineV.backgroundColor = [MyController colorWithHexString:CNavBgColor];
        [secV addSubview:lineV];
    }
    
    UIView* lineV = [MyController viewWithFrame:headV.frame];
    lineV.backgroundColor = [MyController colorWithHexString:CNavBgColor];
    [headV addSubview:lineV];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(49.5);
        make.height.mas_offset(0.5);
    }];

    return headV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
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
