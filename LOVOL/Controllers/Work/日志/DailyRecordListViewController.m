//
//  DailyRecordListViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/31.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "DailyRecordListViewController.h"

#import "DailyRecordListModel.h"

#import "DailyRecordListTableViewCell.h"

#import "DailyRecordDetailViewController.h"//日志详情

#import "DailyRecordAddViewController.h"//新增日志

#import "DailyRecordAdd1ViewController.h"//新增日志
@interface DailyRecordListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation DailyRecordListViewController

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [MyController colorWithHexString:CLineColor];
    self.dataArr = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeRightNav];
    [self makeData];
}

- (void)makeRightNav {
    UIButton* rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,15,15)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(newCustomer)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}

- (void)newCustomer {
    DailyRecordAddViewController* vc = [[DailyRecordAddViewController alloc] init];
    vc.title = @"工作日志";
    [self.navigationController pushViewController:vc animated:YES];
//    DailyRecordAdd1ViewController* vc = [[DailyRecordAdd1ViewController alloc] init];
//    vc.title = @"工作日志";
//    [self.navigationController pushViewController:vc animated:YES];
}

/**
 数据初始化
 */
- (void)makeData {
    for (int i = 0; i < 10; i++) {
        DailyRecordListModel* model = [[DailyRecordListModel alloc] init];
        model._time = @"2018-01-01 10:00";
        model._type = @"日报";
        model._des = @"工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况工作情况";
        model._related = @"关联任务：农机销售";
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
    DailyRecordListModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [DailyRecordListTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        DailyRecordListTableViewCell *cell = (DailyRecordListTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"DailyRecordListTableViewCell";
    DailyRecordListTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[DailyRecordListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    DailyRecordListModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DailyRecordDetailViewController* vc = [[DailyRecordDetailViewController alloc] init];
    vc.title = @"工作日志";
    [self.navigationController pushViewController:vc animated:YES];
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


