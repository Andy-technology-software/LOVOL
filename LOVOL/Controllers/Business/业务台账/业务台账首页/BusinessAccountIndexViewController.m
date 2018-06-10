//
//  BusinessAccountIndexViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "BusinessAccountIndexViewController.h"

#import "BusinessAccountIndexModel.h"

#import "BusinessAccountIndexTableViewCell.h"

#import "CuishouProgressInquiryViewController.h"//催收进度查询

#import "TrailerProgressInquiryViewController.h"//拖车进度查询

#import "litigationProgressInquiryViewController.h"//诉讼进度查询

#import "OrderProgressInquiryViewController.h"//订单进度查询

#import "LoanProgressInquiryViewController.h"//放款进度查询
@interface BusinessAccountIndexViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation BusinessAccountIndexViewController

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
    NSArray* titA = [[NSArray alloc] initWithObjects:@"催收进度查询",@"拖车进度查询",@"诉讼进度查询",@"订单进度查询",@"放款进度查询", nil];
    for (int i = 0; i < titA.count; i++) {
        BusinessAccountIndexModel* model = [[BusinessAccountIndexModel alloc] init];
        model._leftImg = titA[i];
        model._tit = titA[i];
        model._rightImg = @"更多";
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
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessAccountIndexModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [BusinessAccountIndexTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        BusinessAccountIndexTableViewCell *cell = (BusinessAccountIndexTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"BusinessAccountIndexTableViewCell";
    BusinessAccountIndexTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[BusinessAccountIndexTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    BusinessAccountIndexModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        CuishouProgressInquiryViewController* vc = [[CuishouProgressInquiryViewController alloc] init];
        vc.title = @"催收进度查询";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (1 == indexPath.row) {
        TrailerProgressInquiryViewController* vc = [[TrailerProgressInquiryViewController alloc] init];
        vc.title = @"拖车进度查询";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (2 == indexPath.row) {
        litigationProgressInquiryViewController* vc = [[litigationProgressInquiryViewController alloc] init];
        vc.title = @"诉讼进度查询";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (3 == indexPath.row) {
        OrderProgressInquiryViewController* vc = [[OrderProgressInquiryViewController alloc] init];
        vc.title = @"订单进度查询";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (4 == indexPath.row) {
        LoanProgressInquiryViewController* vc = [[LoanProgressInquiryViewController alloc] init];
        vc.title = @"放款进度查询";
        [self.navigationController pushViewController:vc animated:YES];
    }
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


