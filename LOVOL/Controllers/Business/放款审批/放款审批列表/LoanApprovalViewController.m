//
//  LoanApprovalViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/30.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "LoanApprovalViewController.h"

#import "LoanApprovalListModel.h"

#import "LoanApprovalListTableViewCell.h"
@interface LoanApprovalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation LoanApprovalViewController

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [MyController colorWithHexString:CLineColor];
    self.dataArr = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    for (int i = 0; i < 10; i++) {
        LoanApprovalListModel* model = [[LoanApprovalListModel alloc] init];
        model._lcnum = @"No.007";
        model._time = @"2018-05-09 08:00";
        model._lcname = @"经理确认";
        model._czrName = @"约翰";
        model._htNum = @"NO.002";
        model._dqjd = @"当前节点";
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
    [self.tableView setBackgroundColor:[MyController colorWithHexString:CLineColor]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:self.tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self headRefresh];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self footRefresh];
    }];
    
}

- (void)headRefresh{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

- (void)footRefresh{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LoanApprovalListModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [LoanApprovalListTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        LoanApprovalListTableViewCell *cell = (LoanApprovalListTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"LoanApprovalListTableViewCell";
    LoanApprovalListTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[LoanApprovalListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    LoanApprovalListModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    BusinessReceptionDetailViewController* vc = [[BusinessReceptionDetailViewController alloc] init];
//    vc.title = @"业务待办详情";
//    [self.navigationController pushViewController:vc animated:YES];
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


