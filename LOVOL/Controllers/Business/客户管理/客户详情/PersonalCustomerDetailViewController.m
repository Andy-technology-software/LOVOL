//
//  PersonalCustomerDetailViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/6/4.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "PersonalCustomerDetailViewController.h"

#import "FormsCommonCellModel.h"

#import "FromsDisplayTableViewCell.h"
@interface PersonalCustomerDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;
@property(nonatomic,strong)NSMutableArray* dataArr2;

@end

@implementation PersonalCustomerDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    self.dataArr2 = [[NSMutableArray alloc] init];
    
    [self initUI];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    NSData* data = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPersonalCustomer"];
    NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSData* data2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPersonalCustomer2"];
    NSArray *oldSavedArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:data2];
    
    if (oldSavedArray.count || oldSavedArray2.count) {
        [self.dataArr addObjectsFromArray:oldSavedArray];
        [self.dataArr2 addObjectsFromArray:oldSavedArray2];
    }else {
        NSArray* leftArr = [[NSArray alloc] initWithObjects:@"客户编号",@"客户名称",@"证件名称",@"证件号码",@"证件有效期",@"客户角色",@"经销商",@"建户日期",@"最近修改日期",@"国籍",@"性别",@"出生日期",@"身份证注册地",@"民族",@"文化程度",@"婚姻状况",@"配偶姓名",@"身份证号",@"联系方式",@"邮寄地址",@"常住地址",@"手机号码", nil];
        NSArray* rightArr = [[NSArray alloc] initWithObjects:@"NO.007",@"李磊",@"身份证",@"xxxxxxxxxxxxxxxxxxxxx",@"2006-08-08至2020-08-08",@"大客户",@"青岛开发区",@"2010-08-08",@"2018-01-01",@"中国",@"男",@"1990-01-01",@"山东省青岛市",@"汉",@"大学本科",@"已婚",@"韩梅梅",@"xxxxxxxxxxxxxxxx",@"17666666666",@"山东省青岛市江山南路",@"山东省青岛市江山南路",@"17666666666", nil];
        
        for (int i = 0; i < leftArr.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr[i];
            model._rightContent = rightArr[i];
            [self.dataArr addObject:model];
        }
        
        NSArray* leftArr2 = [[NSArray alloc] initWithObjects:@"开户名",@"开户行分支行",@"卡号", nil];
        NSArray* rightArr2 = [[NSArray alloc] initWithObjects:@"农机公司",@"中国工商银行",@"6229092019201923111", nil];
        for (int i = 0; i < leftArr2.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr2[i];
            model._rightContent = rightArr2[i];
            [self.dataArr2 addObject:model];
        }
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return self.dataArr.count;
    }
    return self.dataArr2.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormsCommonCellModel *model = nil;
    if (0 == indexPath.section) {
        if (indexPath.row < self.dataArr.count) {
            model = [self.dataArr objectAtIndex:indexPath.row];
        }
    }else {
        if (indexPath.row < self.dataArr2.count) {
            model = [self.dataArr2 objectAtIndex:indexPath.row];
        }
    }
    
    return [FromsDisplayTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        FromsDisplayTableViewCell *cell = (FromsDisplayTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        //显示的
        FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model = self.dataArr[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }
    //显示的
    FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    FormsCommonCellModel* model = self.dataArr2[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    headerV.backgroundColor = [UIColor whiteColor];
    
    UILabel* titL = [MyController createLabelWithFrame:headerV.frame Font:CFontSize1 Text:@"基础信息"];
    if (1 == section) {
        titL.text = @"账户信息";
    }else if (0 == section) {
        titL.text = @"基础信息";
    }
    [headerV addSubview:titL];
    
    [titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(headerV.mas_centerY);
    }];
    
    UIView* lineV = [MyController viewWithFrame:headerV.frame];
    lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
    [headerV addSubview:lineV];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_offset(6);
    }];
    
    return headerV;
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
