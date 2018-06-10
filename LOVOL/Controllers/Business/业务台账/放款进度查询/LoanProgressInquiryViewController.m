
//
//  LoanProgressInquiryViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "LoanProgressInquiryViewController.h"

#import "LoanProgressInquiryModel.h"

#import "LoanProgressInquiryTableViewCell.h"

#import "LoanProgressInquiryConditionViewController.h"
@interface LoanProgressInquiryViewController ()<UITableViewDelegate,UITableViewDataSource,LoanProgressInquiryConditionViewControllerDelegate>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation LoanProgressInquiryViewController

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
        LoanProgressInquiryModel* model = [[LoanProgressInquiryModel alloc] init];
        model._czr = @"李磊";
        model._dqjd = @"当前节点";
        model._htbh = @"NO.007";
        model._fkrze = @"￥10000000.00";
        model._dls = @"韩梅梅";
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
    LoanProgressInquiryModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [LoanProgressInquiryTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        LoanProgressInquiryTableViewCell *cell = (LoanProgressInquiryTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"LoanProgressInquiryTableViewCell";
    LoanProgressInquiryTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[LoanProgressInquiryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    LoanProgressInquiryModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    headV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    UITextField* seartf = [MyController createTextFieldWithFrame:headV.frame placeholder:@"点击进行更多查询条件" passWord:NO leftImageView:nil rightImageView:nil Font:CFontSize1];
    seartf.backgroundColor = [MyController colorWithHexString:CLineColor];
    [headV addSubview:seartf];
    
    [seartf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.right.mas_equalTo(-KNormalSpace);
    }];
    
    UIView* linev = [MyController viewWithFrame:headV.frame];
    linev.backgroundColor = [MyController colorWithHexString:CLineColor];
    [headV addSubview:linev];
    
    [linev mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset(1);
        make.bottom.mas_equalTo(-1);
    }];
    
    UIButton* searB1 = [MyController createButtonWithFrame:headV.frame ImageName:nil Target:self Action:@selector(searBClick) Title:nil];
    [headV addSubview:searB1];
    
    return headV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}


- (void)searBClick {
    DLog(@"搜索");
    LoanProgressInquiryConditionViewController* vc = [[LoanProgressInquiryConditionViewController alloc] init];
    vc.title = @"放款进度查询";
    vc.LoanProgressInquiryConditionViewControllerDelegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)sendBackHTBH:(NSString *)htbh czr:(NSString *)czr {
    
}

#pragma mark - 查询代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

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


