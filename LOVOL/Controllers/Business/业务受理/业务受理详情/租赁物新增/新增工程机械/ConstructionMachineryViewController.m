//
//  ConstructionMachineryViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/25.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "ConstructionMachineryViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsFillTableViewCell.h"
@interface ConstructionMachineryViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate>
@property(nonatomic,strong)NSArray* typeArr0;
@property(nonatomic,strong)NSMutableArray* dataArr0;
@property(nonatomic,assign)BOOL isNotFirstIncome;//是不是第一次进页面

@end

@implementation ConstructionMachineryViewController

- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString *)content {
    //    FormsCommonCellModel* model = self.dataArr[rowIndex];
    //    model._rightContent = content;
    //
    //    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr] forKey:@"QuotationBaseInfo"];
}

- (void)viewWillAppear:(BOOL)animated {
    //    if (self.isNotFirstIncome) {
    //        [HUD loading];
    //        NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:@"QuotationBaseInfo"];
    //        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //        if (oldSavedArray.count) {
    //            [self.dataArr removeAllObjects];
    //            [self.dataArr addObjectsFromArray:oldSavedArray];
    //            [HUD hide];
    //            [self.tableView reloadData];
    //        }else {
    //            [HUD hide];
    //        }
    //    }else {
    //        self.isNotFirstIncome = YES;
    //    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr0 = [[NSMutableArray alloc] init];
    //1是填的   2是选的
    self.typeArr0 = [[NSArray alloc] initWithObjects:@"2",@"2",@"2",@"2",@"2",@"1",@"1",@"1",@"1", nil];
    [self initUI];
    [self makeAddBtn];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    NSData* data0 = [[NSUserDefaults standardUserDefaults] objectForKey:@"AgriculturalquipmentAdd"];
    NSArray *oldSavedArray0 = [NSKeyedUnarchiver unarchiveObjectWithData:data0];
    if (oldSavedArray0.count) {
        [self.dataArr0 addObjectsFromArray:oldSavedArray0];
    }else {
        NSArray* leftArr0 = [[NSArray alloc] initWithObjects:@"车辆型号",@"车辆识别代码/车架号",@"发动机号",@"租赁物类型",@"产品型号",@"设备价款",@"成交单价",@"数量",@"备注", nil];
        NSArray* placeArr0 = [[NSArray alloc] initWithObjects:@"请扫描识别车辆型号",@"请扫描识别代码/车架号",@"请扫描识别发动机号",@"请选择租赁物类型",@"请选择产品型号",@"请输入设备价款",@"请输入成交单价",@"请输入数量",@"请输入备注", nil];
        
        for (int i = 0; i < leftArr0.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr0[i];
            model._placeholder = placeArr0[i];
            if (1 == i || 2 == i || 0 == i) {
                model._selectRightImg = @"首页-选中";
            }
            [self.dataArr0 addObject:model];
        }
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
    return self.dataArr0.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormsCommonCellModel *model = nil;
    if (indexPath.row < self.dataArr0.count) {
        model = [self.dataArr0 objectAtIndex:indexPath.row];
    }
    
    return [FromsFillTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        FromsFillTableViewCell *cell = (FromsFillTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (1 == [self.typeArr0[indexPath.row] integerValue]) {//填的
        FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        cell0.FromsFillTableViewCellDelegate = self;
        cell0.rowIndex = indexPath.row;
        FormsCommonCellModel* model = self.dataArr0[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }
    FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    FormsCommonCellModel* model = self.dataArr0[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
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
 新增还款明细
 */
- (void)addMXBtnClick {
    DLog(@"新增工程机械");
    [self.navigationController popViewControllerAnimated:YES];
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

