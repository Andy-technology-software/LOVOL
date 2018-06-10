//
//  BusinessIndexViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "BusinessIndexViewController.h"

#import "BusinessIndexModel.h"

#import "BusinessIndexTableViewCell.h"

//#import "CreditPendingViewController.h"//征信待办 -- UI修改--弃用

#import "NewCreditPendingViewController.h"//新的征信待办

#import "CustomerManagementHomeViewController.h"//客户管理

#import "CreditInitiationViewController.h"//征信发起

#import "BusinessReceptionListViewController.h"//业务受理

#import "LoanApprovalViewController.h"//放款审批

#import "BusinessAccountIndexViewController.h"//业务台账

#import "DealerAccessPendingViewController.h"//经销商准入待办列表

#import "DBBusinessinitiationViewController.h"//业务发起
@interface BusinessIndexViewController ()<UITableViewDelegate,UITableViewDataSource,BusinessIndexTableViewCellDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation BusinessIndexViewController

- (void)sendBackSelectedTagValue:(NSInteger)tagValue {
    if (tagValue < 200) {
        //审批待办
        if (100 == tagValue) {
            //征信待办
            NewCreditPendingViewController* vc = [[NewCreditPendingViewController alloc] init];
            vc.title = @"征信待办";
            [self.navigationController pushViewController:vc animated:YES];
        }else if (101 == tagValue) {
            //业务受理
            BusinessReceptionListViewController* vc = [[BusinessReceptionListViewController alloc] init];
            vc.title = @"业务受理待办";
            [self.navigationController pushViewController:vc animated:YES];
        }else if (102 == tagValue) {
            //放款审批
            LoanApprovalViewController* vc = [[LoanApprovalViewController alloc] init];
            vc.title = @"放款审批";
            [self.navigationController pushViewController:vc animated:YES];
        }else if (103 == tagValue) {
            //经销商准入待办
            DealerAccessPendingViewController* vc = [[DealerAccessPendingViewController alloc] init];
            vc.title = @"经销商准入待办";
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }else if (tagValue > 199 && tagValue < 300) {
        //业务办理
        if (201 == tagValue) {
            CustomerManagementHomeViewController* vc = [[CustomerManagementHomeViewController alloc] init];
            vc.title = @"客户管理";
            [self.navigationController pushViewController:vc animated:YES];
            
        }else if (200 == tagValue) {
            CreditInitiationViewController* vc = [[CreditInitiationViewController alloc] init];
            vc.title = @"征信发起";
            [self.navigationController pushViewController:vc animated:YES];
            
        }else if (202 == tagValue) {
            DBBusinessinitiationViewController* vc = [[DBBusinessinitiationViewController alloc] init];
            vc.title = @"业务发起";
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else {
        //业务管理
        if (300 == tagValue) {
            BusinessAccountIndexViewController* vc = [[BusinessAccountIndexViewController alloc] init];
            vc.title = @"业务台账";
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"业务";
    self.dataArray = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeData];
}

- (void)makeData {
    BusinessIndexModel* model0 = [[BusinessIndexModel alloc] init];
    model0.ywsl = @"6";
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
    BusinessIndexModel *model = nil;
    if (indexPath.row < self.dataArray.count) {
        model = [self.dataArray objectAtIndex:indexPath.row];
    }
    
    return [BusinessIndexTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        BusinessIndexTableViewCell *cell = (BusinessIndexTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessIndexTableViewCell* cell0 = [[BusinessIndexTableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    cell0.BusinessIndexTableViewCellDelegate = self;
    BusinessIndexModel* model = self.dataArray[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

