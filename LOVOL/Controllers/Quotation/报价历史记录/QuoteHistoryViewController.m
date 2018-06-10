//
//  QuoteHistoryViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/11.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "QuoteHistoryViewController.h"

#import "QuoteHistoryModel.h"

#import "QuoteHistoryTableViewCell.h"

#import "QBaseInfoViewController.h"//基础信息

#import "QFeeViewController.h"//费用收取计划

#import "QBZJViewController.h"//保证金收取计划

#import "RentPayListViewController.h"//租金支付表
@interface QuoteHistoryViewController ()<UITableViewDelegate,UITableViewDataSource,QuoteHistoryTableViewCellDelegate>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation QuoteHistoryViewController

/**
 查看第几个租金支付列表

 @param rowIndex 行index
 */
- (void)sendBackCheckZujinPayList:(NSInteger)rowIndex {
    RentPayListViewController* vc = [[RentPayListViewController alloc] init];
    vc.title = @"租金支付表";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeRightNavBar];
    [self makeSearchUI];
    self.dataArr = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeData];
}


/**
 创建搜索界面
 */
- (void)makeSearchUI {
    UIView* searchView = [MyController viewWithFrame:self.view.frame];
    searchView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:searchView];
    
    [searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo([MyController isIOS7]);
        make.height.mas_offset(50);
    }];
    
    UITextField* searchTF = [MyController createTextFieldWithFrame:searchView.frame placeholder:@"请输入报价编号或名称" passWord:NO leftImageView:nil rightImageView:nil Font:CFontSize1];
    [searchView addSubview:searchTF];
    
    [searchTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
    }];
    
    UIButton* searchBtn = [MyController createButtonWithFrame:searchView.frame ImageName:nil Target:self Action:@selector(searchBtnClick) Title:@"搜索"];
    [searchBtn setBackgroundColor:[UIColor whiteColor]];
    [searchBtn setTitleColor:[MyController colorWithHexString:CNavBgColor] forState:UIControlStateNormal];
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [searchView addSubview:searchBtn];
    
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(searchTF.mas_right).mas_offset(5);
    }];
    
    UIView* lineV = [MyController viewWithFrame:searchView.frame];
    lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
    [searchView addSubview:lineV];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(2);
    }];
}

/**
 点击搜索按钮响应
 */
- (void)searchBtnClick {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
}

/**
 创建右上导航按钮
 */
- (void)makeRightNavBar {
    UIButton* rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,25,25)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"个人中心-选中"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(AddQuoteHistory)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationController.navigationItem.rightBarButtonItem= rightItem;
}

/**
 新增报价
 */
- (void)AddQuoteHistory {
    DLog(@"新增");
}

/**
 数据初始化
 */
- (void)makeData {
    for (int i = 0; i < 10; i++) {
        QuoteHistoryModel* model = [[QuoteHistoryModel alloc] init];
        model._tit = @"挖掘机报价";
        model._num = @"NO.123456";
        model._payDay = @"15日/03月";
        model._zuDay = @"起租日：2018-01-01";
        model._countMonth = @"12月 租期";
        model._type = @"等额本金";
        [self.dataArr addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark -  初始化UI
-(void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [MyController isIOS7] + 50, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 50) style:UITableViewStylePlain];
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
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self footRefresh];
    }];
    
}

#pragma mark - 下拉刷新
- (void)headRefresh{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

#pragma mark - 上拉加载
- (void)footRefresh{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuoteHistoryModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [QuoteHistoryTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        QuoteHistoryTableViewCell *cell = (QuoteHistoryTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"QuoteHistoryTableViewCell";
    QuoteHistoryTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[QuoteHistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    QuoteHistoryModel* model = self.dataArr[indexPath.row];
    cell0.QuoteHistoryTableViewCellDelegate = self;
    [cell0 configCellWithModel:model];
    return cell0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    LYSSlideMenuController *slideMenu = [[LYSSlideMenuController alloc] init];
    slideMenu.title = @"快速报价详情";
    QBaseInfoViewController *oneVC = [[QBaseInfoViewController alloc] init];
    QFeeViewController *twoVC = [[QFeeViewController alloc] init];
    QBZJViewController *threeVC = [[QBZJViewController alloc] init];
    slideMenu.controllers = @[oneVC,twoVC,threeVC];
    slideMenu.titles = @[@"基础信息",@"费用收取计划",@"保证金收取计划"];
    slideMenu.bottomLineWidth = 60;
    slideMenu.bottomLineHeight = 2;
    slideMenu.bottomLineColor = [MyController colorWithHexString:CNavBgColor];
    slideMenu.titleColor = [MyController colorWithHexString:@"9d9ea3"];
    slideMenu.titleSelectColor = [MyController colorWithHexString:CNavBgColor];
    [self.navigationController pushViewController:slideMenu animated:YES];
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
