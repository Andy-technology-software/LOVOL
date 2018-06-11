//
//  LeaseItemAddViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/25.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "LeaseItemAddViewController.h"

#import "LeaseItemAddListModel.h"

#import "LeaseItemAddListTableViewCell.h"

#import "AgriculturalquipmentAddViewController.h"//新增农业装备

#import "ConstructionMachineryViewController.h"//新增工程机械
@interface LeaseItemAddViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation LeaseItemAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeAddBtn];
    [self makeData];
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
        LeaseItemAddListModel* model = [[LeaseItemAddListModel alloc] init];
        model._zlwlx = @"雷沃挖掘机";
        model._xh = @"No.001";
        model._ccbh = @"001";
        model._fdjbh = @"N0.001";
        model._sbjk = @"￥1000000.00";
        model._cjdj = @"￥1000000.00";
        model._sl = @"1";
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
    [self.tableView setBackgroundColor:[MyController colorWithHexString:CViewF5Color]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:self.tableView];
    
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeaseItemAddListModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    return [LeaseItemAddListTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        LeaseItemAddListTableViewCell *cell = (LeaseItemAddListTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"LeaseItemAddListTableViewCell";
    LeaseItemAddListTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[LeaseItemAddListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    LeaseItemAddListModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

#pragma mark - 新增
- (void)addMXBtnClick {
    DLog(@"新增");
    NSArray *arrayTitle = @[@"农业装备",@"工程机械"];
    [self.view createAlertViewTitleArray:arrayTitle textColor:[MyController colorWithHexString:CNavBgColor] font:[UIFont systemFontOfSize:16] actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
        if (0 == didRow) {
            AgriculturalquipmentAddViewController* vc = [[AgriculturalquipmentAddViewController alloc] init];
            vc.title = @"新增农业装备";
            [self.navigationController pushViewController:vc animated:YES];
        }else if (1 == didRow) {
            ConstructionMachineryViewController* vc = [[ConstructionMachineryViewController alloc] init];
            vc.title = @"新增工程机械";
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
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


