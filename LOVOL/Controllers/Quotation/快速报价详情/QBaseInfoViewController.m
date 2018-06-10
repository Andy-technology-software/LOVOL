//
//  QBaseInfoViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/11.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "QBaseInfoViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsFillTableViewCell.h"

#import "QuotationIndex1TableViewCell.h"
@interface QBaseInfoViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate>
@property(nonatomic,strong)NSArray* typeArr;
@property(nonatomic,strong)NSMutableArray* dataArr;
@property(nonatomic,strong)NSMutableArray* dataArr2;
@property(nonatomic,assign)BOOL isNotFirstIncome;//是不是第一次进页面

@end

@implementation QBaseInfoViewController

- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString *)content{
    FormsCommonCellModel* model = self.dataArr[rowIndex];
    model._rightContent = content;
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr] forKey:@"QuotationBaseInfo"];
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.isNotFirstIncome) {
        [self.dataArr removeAllObjects];
        NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:@"QuotationBaseInfo"];
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if (oldSavedArray.count) {
            [self.dataArr addObjectsFromArray:oldSavedArray];
            [self.tableView reloadData];
        }
    }else {
        self.isNotFirstIncome = YES;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    self.dataArr2 = [[NSMutableArray alloc] init];
    //1是填的   2是选的
    self.typeArr = [[NSArray alloc] initWithObjects:@"1",@"2",@"1",@"1",@"2",@"2",@"1",@"1",@"1",@"1",@"2",@"2",@"1",@"1",@"2", nil];
    [self initUI];
    [self makeEditBtn];
    [self makeData];
}

- (void)makeEditBtn {
    UIButton* editBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(editBtnClick) Title:@"编辑"];
    [editBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    [editBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    editBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:editBtn];
    
    [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.tableView.mas_bottom);
        make.height.mas_offset(50);
    }];
}

- (void)editBtnClick {
    DLog(@"编辑");
}

/**
 数据初始化
 */
- (void)makeData {
    NSData* data  = [[NSUserDefaults standardUserDefaults] objectForKey:@"QuotationBaseInfo"];
    NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (oldSavedArray.count) {
        [self.dataArr addObjectsFromArray:oldSavedArray];
    }else {
        NSArray* leftArr = [[NSArray alloc] initWithObjects:@"产品编号",@"产品名称",@"模拟台账名称",@"模拟台账编号",@"起租日",@"租赁类型",@"设备价款",@"租赁期",@"租金收取频次",@"每期还款日",@"租金计算方法",@"年利率类型",@"年利率",@"名义货价",@"放款类型", nil];
        NSArray* isMustArr = [[NSArray alloc] initWithObjects:@"0",@"0",@"1",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"0", nil];
        NSArray* placeArr = [[NSArray alloc] initWithObjects:@"选择产品后自动填写",@"请选择产品",@"请输入模拟台账名称",@"",@"请选择起租日",@"请选择租赁类型",@"请输入设备价款",@"请输入租赁期",@"请输入租金收取频次",@"请输入每期还款日",@"请选择租金计算方法",@"请选择年利率类型",@"请输入年利率",@"请输入名义货价",@"请选择放款类型", nil];
        
        for (int i = 0; i < leftArr.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr[i];
            model._isMust = isMustArr[i];
            model._placeholder = placeArr[i];
            if (7 == i) {
                model._rightUnit = @"月";
            }
            [self.dataArr addObject:model];
        }
    }
    [self.tableView reloadData];
}

#pragma mark -  初始化UI
-(void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50) style:UITableViewStylePlain];
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
    return 3;
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return self.dataArr.count;
    }else if (2 == section) {
        return self.dataArr2.count;
    }
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
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
    }else if (1 == indexPath.section) {
        return [QuotationIndex1TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            QuotationIndex1TableViewCell *cell = (QuotationIndex1TableViewCell *)sourceCell;
            [cell configCellWithModel];
        }];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
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
    }else if (1 == indexPath.section) {
        QuotationIndex1TableViewCell* cell0 = [[QuotationIndex1TableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel];
        return cell0;
    }
    return nil;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (2 == section) {
        UIView* headerV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
        headerV.backgroundColor = [UIColor whiteColor];
        
        UILabel* titL = [MyController createLabelWithFrame:headerV.frame Font:CFontSize1 Text:@"约定还款明细"];
        [headerV addSubview:titL];
        
        [titL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KNormalSpace);
            make.centerY.mas_equalTo(headerV.mas_centerY);
        }];
        
        UIButton* addMXBtn = [MyController createButtonWithFrame:headerV.frame ImageName:@"个人中心-选中" Target:self Action:@selector(addMXBtnClick) Title:nil];
        [headerV addSubview:addMXBtn];
        
        [addMXBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-KNormalSpace);
            make.centerY.mas_equalTo(headerV.mas_centerY);
            make.width.mas_offset(20);
            make.height.mas_offset(20);
        }];
        
        return headerV;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (2 == section) {
        return 50;
    }
    return 0;
}


/**
 新增还款明细
 */
- (void)addMXBtnClick {
    DLog(@"新增还款明细");
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

