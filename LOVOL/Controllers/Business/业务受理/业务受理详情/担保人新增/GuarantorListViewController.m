//
//  GuarantorListViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/3.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "GuarantorListViewController.h"

#import "GuarantorListModel.h"

#import "GuarantorListTableViewCell.h"
@interface GuarantorListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation GuarantorListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeAddBtn];
    [self makeData];
}

#pragma mark - 新增担保人
- (void)addMXBtnClick {
    DLog(@"新增担保人");
}

#pragma mark - 底部新增按钮
- (void)makeAddBtn {
    UIButton* addB = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(addMXBtnClick) Title:@"新增"];
    [addB setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    [addB setTitleColor:[MyController colorWithHexString:CDefaultColor] forState:UIControlStateNormal];
    addB.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:addB];
    
    [addB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.tableView.mas_bottom);
        make.height.mas_offset(50);
    }];
}

/**
 数据初始化
 */
- (void)makeData {
    for (int i = 0; i < 10; i++) {
        GuarantorListModel* model = [[GuarantorListModel alloc] init];
        model._dbmc = @"担保名称:雷沃挖掘机担保";
        model._dbbh = @"担保编号:NO.007";
        model._dblx = @"担保类型:等额担保";
        model._dbrkhbh = @"担保人客户编号:NO.001";
        model._dbrkhmc = @"担保人客户名称:李磊";
        [self.dataArr addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark -  初始化UI
-(void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 50 - 40) style:UITableViewStylePlain];
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
}

#pragma mark - 下拉刷新
- (void)headRefresh{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GuarantorListModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [GuarantorListTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        GuarantorListTableViewCell *cell = (GuarantorListTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"GuarantorListTableViewCell";
    GuarantorListTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[GuarantorListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    GuarantorListModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
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
