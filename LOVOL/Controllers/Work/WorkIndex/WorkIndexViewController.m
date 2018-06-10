//
//  WorkIndexViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "WorkIndexViewController.h"

#import "WorkIndexModel.h"

#import "WorkIndexTableViewCell.h"

#import "PostSignViewController.h"//报岗签到

#import "TimePunchViewController.h"//考勤打卡

#import "DailyRecordListViewController.h"//日志列表

#import "TaskViewController.h"//任务
@interface WorkIndexViewController ()<UITableViewDelegate,UITableViewDataSource,WorkIndexTableViewCellDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation WorkIndexViewController

- (void)sendBackSelectedTagValue:(NSInteger)tagValue {
    if (100 == tagValue || 203 == tagValue) {
        DLog(@"考勤");
        TimePunchViewController* vc = [[TimePunchViewController alloc] init];
        vc.title = @"考勤打卡";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (101 == tagValue || 201 == tagValue) {
        DLog(@"日报");
        DailyRecordListViewController* vc = [[DailyRecordListViewController alloc] init];
        vc.title = @"日志";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (102 == tagValue || 202 == tagValue) {
        DLog(@"报岗");
        PostSignViewController* vc = [[PostSignViewController alloc] init];
        vc.title = @"报岗签到";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (103 == tagValue || 200 == tagValue) {
        DLog(@"任务");
        TaskViewController* vc = [[TaskViewController alloc] init];
        vc.title = @"任务";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (204 == tagValue) {
        DLog(@"统计");
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"工作";
    self.dataArray = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeData];
}

- (void)makeData {
    WorkIndexModel* model0 = [[WorkIndexModel alloc] init];
    model0.kaoqin = @"6";
    model0.ribao = @"6";
    model0.baogang = @"6";
    model0.renwu = @"6";
    [self.dataArray addObject:model0];
    [self.tableView reloadData];
}

/**
 数据请求
 */
- (void)sourceRequestList {
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
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
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self headRefresh];
    }];
}
#pragma mark - 下拉刷新
- (void)headRefresh {
    [self sourceRequestList];
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WorkIndexModel *model = nil;
    if (indexPath.row < self.dataArray.count) {
        model = [self.dataArray objectAtIndex:indexPath.row];
    }
    
    return [WorkIndexTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        WorkIndexTableViewCell *cell = (WorkIndexTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WorkIndexTableViewCell* cell0 = [[WorkIndexTableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    cell0.WorkIndexTableViewCellDelegate = self;
    WorkIndexModel* model = self.dataArray[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


