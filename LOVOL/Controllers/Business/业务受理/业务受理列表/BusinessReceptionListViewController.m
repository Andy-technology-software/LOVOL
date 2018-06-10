//
//  BusinessReceptionListViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/29.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "BusinessReceptionListViewController.h"

#import "BusinessReceptionListModel.h"

#import "BusinessReceptionListTableViewCell.h"

#import "ImmediateApprovalViewController.h"//立即审批

#import "BusinessReceptionDetailViewController.h"//业务受理详情

#import "TransactionConditionsAddViewController.h"//资信成交条件新增

#import "LeaseItemAddViewController.h"//资信租赁物新增

#import "RentalPaymentTableAddViewController.h"//资信租金支付表新增

#import "GuarantorListViewController.h"//资信担保人新增

#import "CreditRatingAddViewController.h"//资信担保人列表

#import "ZXContractCategoryViewController.h"//资信合同类别

#import "ZXDataUploadViewController.h"//资信资料上传

#import "ZXContractPreviewViewController.h"//资信合同预览

#import "ZXContractSignViewController.h"//资信合同面签

#import "LYSSlideMenuController.h"
@interface BusinessReceptionListViewController ()<UITableViewDelegate,UITableViewDataSource> {
    LYSSlideMenuController *slideMenu;
}
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation BusinessReceptionListViewController

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
        BusinessReceptionListModel* model = [[BusinessReceptionListModel alloc] init];
        model._num = @"No.007";
        model._time = @"2018-05-09 08:00";
        model._lcname = @"经理确认";
        model._sender = @"约翰";
        model._kehu = @"李磊";
        model._state = @"待处理";
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
    BusinessReceptionListModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [BusinessReceptionListTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        BusinessReceptionListTableViewCell *cell = (BusinessReceptionListTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"BusinessReceptionListTableViewCell";
    BusinessReceptionListTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[BusinessReceptionListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    BusinessReceptionListModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    BusinessReceptionDetailViewController* vc = [[BusinessReceptionDetailViewController alloc] init];
//    vc.title = @"业务待办详情";
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    slideMenu = [[LYSSlideMenuController alloc] init];
    UIButton* rightButton1 = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,25)];
    [rightButton1 setTitle:@"历史" forState:UIControlStateNormal];
    rightButton1.titleLabel.font = [UIFont systemFontOfSize:13];
    [rightButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightButton1 addTarget:self action:@selector(saveQuotationClick)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem1 = [[UIBarButtonItem alloc] initWithCustomView:rightButton1];
    slideMenu.navigationItem.rightBarButtonItem = rightItem1;
    
//    UIButton* saveBtn = [MyController createButtonWithFrame:CGRectMake(0, CGRectGetMaxY(slideMenu.view.frame), [MyController getScreenWidth], 50) ImageName:nil Target:self Action:@selector(saveBtnClick) Title:@"立即审批"];
//    [saveBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
//    [saveBtn setTitleColor:[MyController colorWithHexString:CDefaultColor] forState:UIControlStateNormal];
//    saveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [slideMenu.view addSubview:saveBtn];
    
    slideMenu.title = @"业务受理-详情";
    slideMenu.isShowLiftBack = YES;
    TransactionConditionsAddViewController *oneVC = [[TransactionConditionsAddViewController alloc] init];
    LeaseItemAddViewController *twoVC = [[LeaseItemAddViewController alloc] init];
    RentalPaymentTableAddViewController *threeVC = [[RentalPaymentTableAddViewController alloc] init];
    GuarantorListViewController *fourVC = [[GuarantorListViewController alloc] init];
    CreditRatingAddViewController *fiveVC = [[CreditRatingAddViewController alloc] init];
    //            ZXContractCategoryViewController *sixVC = [[ZXContractCategoryViewController alloc] init];
    ZXDataUploadViewController *sevVC = [[ZXDataUploadViewController alloc] init];
    ZXContractPreviewViewController *eigVC = [[ZXContractPreviewViewController alloc] init];
    ZXContractSignViewController *nineVC = [[ZXContractSignViewController alloc] init];
    
    
    slideMenu.controllers = @[oneVC,twoVC,threeVC,fourVC,fiveVC,sevVC,eigVC,nineVC];
    slideMenu.titles = @[@"成交条件",@"租赁物维护",@"租金支付表",@"担保人信息",@"资信评级",@"资料上传",@"合同预览",@"合同面签"];
    slideMenu.pageNumberOfItem = 4;
    slideMenu.bottomLineWidth = 60;
    slideMenu.bottomLineHeight = 2;
    slideMenu.bottomLineColor = [MyController colorWithHexString:CNavBgColor];
    slideMenu.titleColor = [MyController colorWithHexString:@"9d9ea3"];
    slideMenu.titleSelectColor = [MyController colorWithHexString:CNavBgColor];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    [self.navigationController pushViewController:slideMenu animated:YES];
}

#pragma mark - 立即审批
- (void)saveBtnClick {
    ImmediateApprovalViewController* vc = [[ImmediateApprovalViewController alloc] init];
    vc.title = @"审批";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 审批历史
- (void)saveQuotationClick {
    DLog(@"审批历史");

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

