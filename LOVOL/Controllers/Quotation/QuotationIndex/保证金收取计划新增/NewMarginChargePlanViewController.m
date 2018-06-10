//
//  NewMarginChargePlanViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/10.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "NewMarginChargePlanViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsFillTableViewCell.h"
@interface NewMarginChargePlanViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate>
@property(nonatomic,strong)NSArray* typeArr;
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation NewMarginChargePlanViewController

- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString *)content {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    //1是填的   2是选的
    self.typeArr = [[NSArray alloc] initWithObjects:@"1",@"2",@"2",@"1",@"1", nil];
    [self initUI];
    [self makeSaveBtn];
    [self makeData];
}

- (void)makeSaveBtn {
    UIButton* addBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(addBtnClick) Title:@"保存"];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    [self.view addSubview:addBtn];
    
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.tableView.mas_bottom);
        make.height.mas_offset(50);
    }];
    [self.view addSubview:addBtn];
}

- (void)addBtnClick {
    DLog(@"保存");
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 数据初始化
 */
- (void)makeData {
    NSArray* leftArr = [[NSArray alloc] initWithObjects:@"模拟台账名称",@"收取日期",@"费用比例",@"费用金额",@"说明", nil];
    NSArray* isMustArr = [[NSArray alloc] initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"0", nil];
    NSArray* placeArr = [[NSArray alloc] initWithObjects:@"请输入模拟台账名称",@"请选择收取日期",@"请选择费用比例",@"请输入费用金额",@"请输入说明", nil];
    for (int i = 0; i < leftArr.count; i++) {
        FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
        model._leftTitle = leftArr[i];
        model._isMust = isMustArr[i];
        model._placeholder = placeArr[i];
        [self.dataArr addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark -  初始化UI
-(void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [MyController isIOS7], [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 50) style:UITableViewStylePlain];
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
    if (1 == [self.typeArr[indexPath.row] integerValue]) {//填的
        FormsCommonCellModel *model = nil;
        if (indexPath.row < self.dataArr.count) {
            model = [self.dataArr objectAtIndex:indexPath.row];
        }
        
        return [FromsFillTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            FromsFillTableViewCell *cell = (FromsFillTableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    FormsCommonCellModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [FormsSelectedTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        FormsSelectedTableViewCell *cell = (FormsSelectedTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (1 == [self.typeArr[indexPath.row] integerValue]) {//填的
        FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        cell0.FromsFillTableViewCellDelegate = self;
        cell0.rowIndex = indexPath.row;
        FormsCommonCellModel* model = self.dataArr[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }
    FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    FormsCommonCellModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

/**
 保存按钮响应
 */
- (void)saveBtnClick {
    DLog(@"保存");
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


