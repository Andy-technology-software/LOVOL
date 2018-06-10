//
//  CustomerManagementHomeViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/14.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "CustomerManagementHomeViewController.h"

#import "CustomerManagementHomeModel.h"

#import "CustomerManagementHomeTableViewCell.h"

#import "PersonalCustomerViewController.h"//个人客户

#import "PublicCustomersViewController.h"//对公客户

#import "CustomerSearchConditionViewController.h"//客户查询条件

#import "PersonalCustomerDetailViewController.h"//个人客户详情

#import "PublicCustomersDetailController.h"//对公客户详情
@interface CustomerManagementHomeViewController ()<UITableViewDelegate,UITableViewDataSource,CustomerManagementHomeTableViewCellDelegate,UITextFieldDelegate,CustomerSearchConditionViewControllerDelegate>
@property(nonatomic,strong)NSMutableArray* dataArr;
@property(nonatomic,copy)NSString* startTime;
@property(nonatomic,copy)NSString* endTime;
@property(nonatomic,copy)NSString* kehuType;
@property(nonatomic,copy)NSString* kehuName;
@property (strong,nonatomic)MHDatePicker* selectDatePicker;
@end

@implementation CustomerManagementHomeViewController

#pragma mark - 返回查询条件
- (void)sendBackSelectInfoName:(NSString *)name jxs:(NSString *)jsx cxz:(NSString *)cxz sTime:(NSString *)sTime eTime:(NSString *)etime {
    [self.tableView.mj_header beginRefreshing];
}

- (void)sendBackSelectIndex:(NSInteger)rowIndex {
    DLog(@"编辑---%ld",rowIndex);
    if (rowIndex % 2) {
        PersonalCustomerViewController* vc = [[PersonalCustomerViewController alloc] init];
        vc.title = @"个人客户";
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        PublicCustomersViewController* vc = [[PublicCustomersViewController alloc] init];
        vc.title = @"对公客户";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (100 == textField.tag) {
        self.kehuName = textField.text;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeRightNav];
    self.dataArr = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    for (int i = 0; i < 10; i++) {
        CustomerManagementHomeModel* model = [[CustomerManagementHomeModel alloc] init];
        model._name = @"皮卡丘";
        model._type = @"承租人";
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomerManagementHomeModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [CustomerManagementHomeTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        CustomerManagementHomeTableViewCell *cell = (CustomerManagementHomeTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CustomerManagementHomeTableViewCell";
    CustomerManagementHomeTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[CustomerManagementHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    CustomerManagementHomeModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    cell0.CustomerManagementHomeTableViewCellDelegate = self;
    return cell0;
}

/**
 创建右导航按钮
 */
- (void)makeRightNav {
    UIButton* rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,25,25)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(newCustomer)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}

/**
 右导航按钮响应
 */
- (void)newCustomer {
    NSArray *arrayTitle = @[@"个人客户",@"对公客户"];
    [self.view createAlertViewTitleArray:arrayTitle textColor:[MyController colorWithHexString:CNavBgColor] font:[UIFont systemFontOfSize:16] actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
        if (0 == didRow) {
            PersonalCustomerViewController* vc = [[PersonalCustomerViewController alloc] init];
            vc.title = @"个人客户";
            [self.navigationController pushViewController:vc animated:YES];
        }else if (1 == didRow) {
            PublicCustomersViewController* vc = [[PublicCustomersViewController alloc] init];
            vc.title = @"对公客户";
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
}


- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    headV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    UITextField* seartf = [MyController createTextFieldWithFrame:headV.frame placeholder:@"点击选择查询条件" passWord:NO leftImageView:nil rightImageView:nil Font:CFontSize1];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2) {
        PersonalCustomerDetailViewController* vc = [[PersonalCustomerDetailViewController alloc] init];
        vc.title = @"个人客户";
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        PublicCustomersDetailController* vc = [[PublicCustomersDetailController alloc] init];
        vc.title = @"对公客户";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (void)searBClick {
    DLog(@"搜索");
    CustomerSearchConditionViewController* vc = [[CustomerSearchConditionViewController alloc] init];
    vc.title = @"客户查询";
    vc.CustomerSearchConditionViewControllerDelegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)starBClick {
    DLog(@"开始时间");
    _selectDatePicker = [[MHDatePicker alloc] init];
    _selectDatePicker.isBeforeTime = YES;
    _selectDatePicker.datePickerMode = UIDatePickerModeDate;
    [_selectDatePicker didFinishSelectedDate:^(NSDate *selectedDate) {
        self.startTime = [self dateStringWithDate:selectedDate DateFormat:@"yyyy-MM-dd"];
        [self.tableView reloadData];
    }];
}

- (void)endBClick {
    DLog(@"结束时间");
    _selectDatePicker = [[MHDatePicker alloc] init];
    _selectDatePicker.isBeforeTime = YES;
    _selectDatePicker.datePickerMode = UIDatePickerModeDate;
    [_selectDatePicker didFinishSelectedDate:^(NSDate *selectedDate) {
        self.endTime = [self dateStringWithDate:selectedDate DateFormat:@"yyyy-MM-dd"];
        [self.tableView reloadData];
    }];
}

- (NSString*)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSString *str = [dateFormatter stringFromDate:date];
    return str ? str : @"";
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
