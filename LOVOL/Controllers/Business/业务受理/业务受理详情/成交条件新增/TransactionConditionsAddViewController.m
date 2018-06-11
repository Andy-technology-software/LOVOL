//
//  TransactionConditionsAddViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/25.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "TransactionConditionsAddViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsFillTableViewCell.h"
@interface TransactionConditionsAddViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate>
@property(nonatomic,strong)NSArray* typeArr0;
@property(nonatomic,strong)NSArray* typeArr1;
@property(nonatomic,strong)NSArray* typeArr2;
@property(nonatomic,strong)NSArray* typeArr3;
@property(nonatomic,strong)NSArray* typeArr4;
@property(nonatomic,strong)NSMutableArray* dataArr0;
@property(nonatomic,strong)NSMutableArray* dataArr1;
@property(nonatomic,strong)NSMutableArray* dataArr2;
@property(nonatomic,strong)NSMutableArray* dataArr3;
@property(nonatomic,strong)NSMutableArray* dataArr4;
@property(nonatomic,strong)NSMutableArray* dataArrTem0;
@property(nonatomic,strong)NSMutableArray* dataArrTem1;
@property(nonatomic,strong)NSMutableArray* dataArrTem2;
@property(nonatomic,strong)NSMutableArray* dataArrTem3;
@property(nonatomic,strong)NSMutableArray* dataArrTem4;
@property(nonatomic,assign)BOOL isNotFirstIncome;//是不是第一次进页面
@property(nonatomic,assign)BOOL isDataArr0;
@property(nonatomic,assign)BOOL isDataArr1;
@property(nonatomic,assign)BOOL isDataArr2;
@property(nonatomic,assign)BOOL isDataArr3;
@property(nonatomic,assign)BOOL isDataArr4;

@end

@implementation TransactionConditionsAddViewController

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
    self.dataArr1 = [[NSMutableArray alloc] init];
    self.dataArr2 = [[NSMutableArray alloc] init];
    self.dataArr3 = [[NSMutableArray alloc] init];
    self.dataArr4 = [[NSMutableArray alloc] init];
    self.isDataArr0 = YES;
    //1是填的   2是选的
    self.typeArr0 = [[NSArray alloc] initWithObjects:@"1",@"2",@"1",@"1",@"2",@"2",@"1",@"1",@"1",@"1",@"2",@"2",@"1",@"1",@"2", nil];
    self.typeArr1 = [[NSArray alloc] initWithObjects:@"1",@"2",@"1",@"1",@"2",@"2",@"1",@"1",@"1",@"1",@"2",@"2",@"1",@"1",@"2", nil];
    self.typeArr2 = [[NSArray alloc] initWithObjects:@"1",@"2",@"1",@"1",@"2",@"2",@"1",@"1",@"1",@"1",@"2",@"2",@"1",@"1",@"2", nil];
    self.typeArr3 = [[NSArray alloc] initWithObjects:@"1",@"2",@"1",@"1",@"2",@"2",@"1",@"1",@"1",@"1",@"2",@"2",@"1",@"1",@"2", nil];
    self.typeArr4 = [[NSArray alloc] initWithObjects:@"1",@"2",@"1",@"1",@"2",@"2",@"1",@"1",@"1",@"1",@"2",@"2",@"1",@"1",@"2", nil];
    [self initUI];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    NSData* data0 = [[NSUserDefaults standardUserDefaults] objectForKey:@"TransactionConditionsAdd0"];
    NSArray *oldSavedArray0 = [NSKeyedUnarchiver unarchiveObjectWithData:data0];
    
    NSData* data1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"TransactionConditionsAdd1"];
    NSArray *oldSavedArray1 = [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    
    NSData* data2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"TransactionConditionsAdd2"];
    NSArray *oldSavedArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:data2];
    
    NSData* data3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"TransactionConditionsAdd3"];
    NSArray *oldSavedArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:data3];
    
    NSData* data4 = [[NSUserDefaults standardUserDefaults] objectForKey:@"TransactionConditionsAdd4"];
    NSArray *oldSavedArray4 = [NSKeyedUnarchiver unarchiveObjectWithData:data4];
    
    if (oldSavedArray0.count || oldSavedArray1.count || oldSavedArray2.count || oldSavedArray3.count || oldSavedArray4.count) {
        [self.dataArr0 addObjectsFromArray:oldSavedArray0];
        [self.dataArr1 addObjectsFromArray:oldSavedArray1];
        [self.dataArr2 addObjectsFromArray:oldSavedArray2];
        [self.dataArr3 addObjectsFromArray:oldSavedArray3];
        [self.dataArr4 addObjectsFromArray:oldSavedArray4];
    }else {
        /*******************基本信息*********************/
        NSArray* leftArr0 = [[NSArray alloc] initWithObjects:@"经销商名称",@"所属区域",@"客户名称",@"联系电话",@"地址",@"报价方案", nil];
        NSArray* isMustArr0 = [[NSArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0",@"0", nil];
        NSArray* placeArr0 = [[NSArray alloc] initWithObjects:@"请输入经销商名称",@"请选择所属区域",@"请输入客户名称",@"请输入联系电话",@"请输入地址",@"请选择报价方案", nil];
        
        for (int i = 0; i < leftArr0.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr0[i];
            model._isMust = isMustArr0[i];
            model._placeholder = placeArr0[i];
            [self.dataArr0 addObject:model];
        }
        /*******************融资申请基本信息*********************/
        NSArray* leftArr1 = [[NSArray alloc] initWithObjects:@"产品类型",@"模拟台账名称",@"模拟台账编号",@"起租日",@"租赁类型",@"设备价款",@"租赁期(月)",@"租金收取频次",@"每期还款日",@"租金计算方法",@"租金年利率类型",@"年利率",@"名义货价",@"放款类型", nil];
        NSArray* isMustArr1 = [[NSArray alloc] initWithObjects:@"0",@"0",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"0", nil];
        NSArray* placeArr1 = [[NSArray alloc] initWithObjects:@"请选择产品类型",@"请输入模拟台账名称",@"请输入模拟台账编号",@"请选择起租日",@"请选择租赁类型",@"请输入设备价款",@"请输入租赁期(月)",@"请输入租金收取频次",@"请输入每期还款日",@"请选择租金计算方法",@"请选择租金年利率类型",@"请输入年利率",@"请输入名义货价",@"请选择放款类型", nil];
        
        for (int i = 0; i < leftArr1.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr1[i];
            model._isMust = isMustArr1[i];
            model._placeholder = placeArr1[i];
            [self.dataArr1 addObject:model];
        }
        /*******************放款路径信息*********************/
        NSArray* leftArr2 = [[NSArray alloc] initWithObjects:@"放款对象",@"账户名",@"账号", nil];
        NSArray* isMustArr2 = [[NSArray alloc] initWithObjects:@"1",@"1",@"1", nil];
        NSArray* placeArr2 = [[NSArray alloc] initWithObjects:@"请选择放款对象",@"请输入账户名",@"请输入账号", nil];
        
        for (int i = 0; i < leftArr2.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr2[i];
            model._isMust = isMustArr2[i];
            model._placeholder = placeArr2[i];
            [self.dataArr2 addObject:model];
        }
        /*******************费用收取计划*********************/
        NSArray* leftArr3 = [[NSArray alloc] initWithObjects:@"费用类型",@"费用比例",@"费用金额", nil];
        NSArray* isMustArr3 = [[NSArray alloc] initWithObjects:@"1",@"1",@"1", nil];
        NSArray* placeArr3 = [[NSArray alloc] initWithObjects:@"请选择费用类型",@"请输入费用比例",@"请输入费用金额", nil];
        
        for (int i = 0; i < leftArr3.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr3[i];
            model._isMust = isMustArr3[i];
            model._placeholder = placeArr3[i];
            [self.dataArr3 addObject:model];
        }
        /*******************保证金收取计划*********************/
        NSArray* leftArr4 = [[NSArray alloc] initWithObjects:@"收取比例",@"收取金额",@"保证金缴纳方", nil];
        NSArray* isMustArr4 = [[NSArray alloc] initWithObjects:@"1",@"1",@"1", nil];
        NSArray* placeArr4 = [[NSArray alloc] initWithObjects:@"请输入收取比例",@"请输入收取金额",@"请输入保证金缴纳方", nil];
        
        for (int i = 0; i < leftArr4.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr4[i];
            model._isMust = isMustArr4[i];
            model._placeholder = placeArr4[i];
            [self.dataArr4 addObject:model];
        }
    }
    [self.tableView reloadData];
}

#pragma mark -  初始化UI
-(void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40) style:UITableViewStylePlain];
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
    return 5;
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        if (self.isDataArr0) {
            return self.dataArr0.count;
        }
        return self.dataArrTem0.count;
    }else if (1 == section) {
        if (self.isDataArr1) {
            return self.dataArr1.count;
        }
        return self.dataArrTem1.count;
    }else if (2 == section) {
        if (self.isDataArr2) {
            return self.dataArr2.count;
        }
        return self.dataArrTem2.count;
    }else if (3 == section) {
        if (self.isDataArr3) {
            return self.dataArr3.count;
        }
        return self.dataArrTem3.count;
    }
    if (self.isDataArr4) {
        return self.dataArr4.count;
    }
    return self.dataArrTem4.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormsCommonCellModel *model = nil;
    if (0 == indexPath.section) {
        if (indexPath.row < self.dataArr0.count) {
            if (self.isDataArr0) {
                model = [self.dataArr0 objectAtIndex:indexPath.row];
            }else {
                model = [self.dataArrTem0 objectAtIndex:indexPath.row];
            }
        }
    }else if (1 == indexPath.section) {
        if (indexPath.row < self.dataArr1.count) {
            if (self.isDataArr1) {
                model = [self.dataArr1 objectAtIndex:indexPath.row];
            }else {
                model = [self.dataArrTem1 objectAtIndex:indexPath.row];
            }
        }
    }else if (2 == indexPath.section) {
        if (indexPath.row < self.dataArr2.count) {
            if (self.isDataArr2) {
                model = [self.dataArr2 objectAtIndex:indexPath.row];
            }else {
                model = [self.dataArrTem2 objectAtIndex:indexPath.row];
            }
        }
    }else if (3 == indexPath.section) {
        if (indexPath.row < self.dataArr3.count) {
            if (self.isDataArr3) {
                model = [self.dataArr3 objectAtIndex:indexPath.row];
            }else {
                model = [self.dataArrTem3 objectAtIndex:indexPath.row];
            }
        }
    }else if (4 == indexPath.section) {
        if (indexPath.row < self.dataArr4.count) {
            if (self.isDataArr4) {
                model = [self.dataArr4 objectAtIndex:indexPath.row];
            }else {
                model = [self.dataArrTem4 objectAtIndex:indexPath.row];
            }
        }
    }
    
    return [FromsFillTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        FromsFillTableViewCell *cell = (FromsFillTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        if (1 == [self.typeArr0[indexPath.row] integerValue]) {//填的
            FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            cell0.FromsFillTableViewCellDelegate = self;
            cell0.rowIndex = indexPath.row;
            FormsCommonCellModel* model;
            if (self.isDataArr0) {
                model = self.dataArr0[indexPath.row];
            }else {
                model = self.dataArrTem0[indexPath.row];
            }
            [cell0 configCellWithModel:model];
            return cell0;
        }
        FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model;
        if (self.isDataArr0) {
            model = self.dataArr0[indexPath.row];
        }else {
            model = self.dataArrTem0[indexPath.row];
        }
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (1 == indexPath.section) {
        if (1 == [self.typeArr1[indexPath.row] integerValue]) {//填的
            FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            cell0.FromsFillTableViewCellDelegate = self;
            cell0.rowIndex = indexPath.row;
            FormsCommonCellModel* model;
            if (self.isDataArr1) {
                model = self.dataArr1[indexPath.row];
            }else {
                model = self.dataArrTem1[indexPath.row];
            }
            [cell0 configCellWithModel:model];
            return cell0;
        }
        FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model;
        if (self.isDataArr1) {
            model = self.dataArr1[indexPath.row];
        }else {
            model = self.dataArrTem1[indexPath.row];
        }
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (2 == indexPath.section) {
        if (1 == [self.typeArr2[indexPath.row] integerValue]) {//填的
            FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            cell0.FromsFillTableViewCellDelegate = self;
            cell0.rowIndex = indexPath.row;
            FormsCommonCellModel* model;
            if (self.isDataArr2) {
                model = self.dataArr2[indexPath.row];
            }else {
                model = self.dataArrTem2[indexPath.row];
            }
            [cell0 configCellWithModel:model];
            return cell0;
        }
        FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model;
        if (self.isDataArr0) {
            model = self.dataArr2[indexPath.row];
        }else {
            model = self.dataArrTem2[indexPath.row];
        }
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (3 == indexPath.section) {
        if (1 == [self.typeArr3[indexPath.row] integerValue]) {//填的
            FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            cell0.FromsFillTableViewCellDelegate = self;
            cell0.rowIndex = indexPath.row;
            FormsCommonCellModel* model;
            if (self.isDataArr3) {
                model = self.dataArr3[indexPath.row];
            }else {
                model = self.dataArr3[indexPath.row];
            }
            [cell0 configCellWithModel:model];
            return cell0;
        }
        FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model = self.dataArr3[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (4 == indexPath.section) {
        if (1 == [self.typeArr4[indexPath.row] integerValue]) {//填的
            FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            cell0.FromsFillTableViewCellDelegate = self;
            cell0.rowIndex = indexPath.row;
            FormsCommonCellModel* model;
            if (self.isDataArr4) {
                model = self.dataArr4[indexPath.row];
            }else {
                model = self.dataArr4[indexPath.row];
            }
            [cell0 configCellWithModel:model];
            return cell0;
        }
        FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model;
        if (self.isDataArr4) {
            model = self.dataArr4[indexPath.row];
        }else {
            model = self.dataArr4[indexPath.row];
        }
        [cell0 configCellWithModel:model];
        return cell0;
    }
    return nil;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    headerV.backgroundColor = [UIColor whiteColor];
    
    UILabel* titL = [MyController createLabelWithFrame:headerV.frame Font:CFontSize1 Text:nil];
    [headerV addSubview:titL];
    if (0 == section) {
        titL.text = @"基本信息";
    }else if (1 == section) {
        titL.text = @"融资申请基本信息";
    }else if (2 == section) {
        titL.text = @"放款路径信息";
    }else if (3 == section) {
        titL.text = @"费用收取计划";
    }else if (4 == section) {
        titL.text = @"保证金收取计划";
    }
    
    [titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.centerY.mas_equalTo(headerV.mas_centerY);
    }];
    
    UIView* line1 = [MyController viewWithFrame:headerV.frame];
    line1.backgroundColor = [MyController colorWithHexString:CLineColor];
    [headerV addSubview:line1];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_offset(4);
    }];
    
    UIButton* addMXBtn = [MyController createButtonWithFrame:headerV.frame ImageName:@"更多" Target:self Action:@selector(addMXBtnClick:) Title:nil];
    addMXBtn.tag = 100 + section;
    [headerV addSubview:addMXBtn];
    
    [addMXBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.centerY.mas_equalTo(headerV.mas_centerY);
        make.width.mas_offset(20);
        make.height.mas_offset(20);
    }];
    
    UIButton* addMXBtn1 = [MyController createButtonWithFrame:headerV.frame ImageName:nil Target:self Action:@selector(addMXBtnClick:) Title:nil];
    addMXBtn1.tag = 100 + section;
    [headerV addSubview:addMXBtn1];
    
    return headerV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}


/**
 新增还款明细
 */
- (void)addMXBtnClick:(UIButton*)btn {
    if (100 == btn.tag) {
        self.isDataArr0 = !self.isDataArr0;
        [self.tableView reloadSections:[[NSIndexSet alloc]initWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else if (101 == btn.tag) {
        self.isDataArr1 = !self.isDataArr1;
        [self.tableView reloadSections:[[NSIndexSet alloc]initWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else if (102 == btn.tag) {
        self.isDataArr2 = !self.isDataArr2;
        [self.tableView reloadSections:[[NSIndexSet alloc]initWithIndex:2] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else if (103 == btn.tag) {
        self.isDataArr3 = !self.isDataArr3;
        [self.tableView reloadSections:[[NSIndexSet alloc]initWithIndex:3] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else if (104 == btn.tag) {
        self.isDataArr4= !self.isDataArr4;
        [self.tableView reloadSections:[[NSIndexSet alloc]initWithIndex:4] withRowAnimation:UITableViewRowAnimationAutomatic];
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

