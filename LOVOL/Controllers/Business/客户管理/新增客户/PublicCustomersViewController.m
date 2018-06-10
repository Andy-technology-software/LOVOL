//
//  PublicCustomersViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/14.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "PublicCustomersViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsFillTableViewCell.h"

#import "FromsDisplayTableViewCell.h"
@interface PublicCustomersViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate,UIAlertViewDelegate>
@property(nonatomic,strong)NSArray* typeArr;
@property(nonatomic,strong)NSArray* typeArr21;
@property(nonatomic,strong)NSArray* typeArr22;
@property(nonatomic,strong)NSArray* typeArr23;
@property(nonatomic,strong)NSArray* typeArr3;
@property(nonatomic,strong)NSArray* typeArr4;
@property(nonatomic,strong)NSArray* typeArr5;

@property(nonatomic,strong)NSMutableArray* dataArr;
//是三证合一的数据源 - 三证
@property(nonatomic,strong)NSMutableArray* dataArr21;
//不是三证合一的数据源 - 不是三证
@property(nonatomic,strong)NSMutableArray* dataArr22;
@property(nonatomic,strong)NSMutableArray* dataArr23;

@property(nonatomic,strong)NSMutableArray* dataArr3;
@property(nonatomic,strong)NSMutableArray* dataArr4;
@property(nonatomic,strong)NSMutableArray* dataArr5;
@property(nonatomic,assign)BOOL isNotFirstIncome;//是不是第一次进页面
@property(nonatomic,assign)BOOL isThreeCertificatese;//是不是三证合一

@end

@implementation PublicCustomersViewController {
    // 默认的识别成功的回调
    void (^_successHandler)(id);
    // 默认的识别失败的回调
    void (^_failHandler)(NSError *);
}


- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString *)content {
    if (0 == sectionIndex) {
        FormsCommonCellModel* model = self.dataArr[rowIndex];
        model._rightContent = content;
    }
    
    if (self.isThreeCertificatese) {
        if (1 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr21[rowIndex];
            model._rightContent = content;
        }else if (2 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr3[rowIndex];
            model._rightContent = content;
        }else if (3 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr4[rowIndex];
            model._rightContent = content;
        }else if (4 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr5[rowIndex];
            model._rightContent = content;
        }
    }else {
        if (1 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr22[rowIndex];
            model._rightContent = content;
        }else if (2 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr23[rowIndex];
            model._rightContent = content;
        }else if (3 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr3[rowIndex];
            model._rightContent = content;
        }else if (4 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr4[rowIndex];
            model._rightContent = content;
        }else if (5 == sectionIndex) {
            FormsCommonCellModel* model = self.dataArr5[rowIndex];
            model._rightContent = content;
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr] forKey:@"AddPublicCustomer1"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr21] forKey:@"AddPublicCustomer21"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr22] forKey:@"AddPublicCustomer22"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr23] forKey:@"AddPublicCustomer23"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr3] forKey:@"AddPublicCustomer3"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr4] forKey:@"AddPublicCustomer4"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr5] forKey:@"AddPublicCustomer5"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*********************************************************************百度OCR识别********************************************************************************************/
    [[AipOcrService shardService] authWithAK:BAIDUAPIKEY andSK:BAIDUSECRETKEY];
    [self configCallback];
    self.isThreeCertificatese = YES;
    self.dataArr = [[NSMutableArray alloc] init];
    self.dataArr21 = [[NSMutableArray alloc] init];
    self.dataArr22 = [[NSMutableArray alloc] init];
    self.dataArr23 = [[NSMutableArray alloc] init];
    self.dataArr3 = [[NSMutableArray alloc] init];
    self.dataArr4 = [[NSMutableArray alloc] init];
    self.dataArr5 = [[NSMutableArray alloc] init];
    //1是填的   2是选的  3是显示的
    self.typeArr = [[NSArray alloc] initWithObjects:@"3",@"2",@"1",@"2",@"2",@"2", nil];
    self.typeArr21 = [[NSArray alloc] initWithObjects:@"2",@"3",@"2",@"3",@"1",@"3",@"3",@"3", nil];
    self.typeArr22 = [[NSArray alloc] initWithObjects:@"2",@"3",@"2",@"3",@"1",@"3",@"3",@"3", nil];
    self.typeArr23 = [[NSArray alloc] initWithObjects:@"2",@"3",@"2",@"3",@"1",@"3",@"3",@"3", nil];
    self.typeArr3 = [[NSArray alloc] initWithObjects:@"1",@"1",@"1",@"1",@"1", nil];
    self.typeArr4 = [[NSArray alloc] initWithObjects:@"1",@"1",@"1",@"1", nil];
    self.typeArr5 = [[NSArray alloc] initWithObjects:@"2",@"1",@"2",@"3",@"2",@"1", nil];
    
    [self initUI];
    [self makeSaveBtn];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    NSData* data = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPublicCustomer1"];
    NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSData* data21 = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPublicCustomer21"];
    NSArray *oldSavedArray21 = [NSKeyedUnarchiver unarchiveObjectWithData:data21];
    
    NSData* data22 = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPublicCustomer22"];
    NSArray *oldSavedArray22 = [NSKeyedUnarchiver unarchiveObjectWithData:data22];
    
    NSData* data23 = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPublicCustomer23"];
    NSArray *oldSavedArray23 = [NSKeyedUnarchiver unarchiveObjectWithData:data23];
    
    NSData* data3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPublicCustomer3"];
    NSArray *oldSavedArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:data3];
    
    NSData* data4 = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPublicCustomer4"];
    NSArray *oldSavedArray4 = [NSKeyedUnarchiver unarchiveObjectWithData:data4];
    
    NSData* data5 = [[NSUserDefaults standardUserDefaults] objectForKey:@"AddPublicCustomer5"];
    NSArray *oldSavedArray5 = [NSKeyedUnarchiver unarchiveObjectWithData:data5];
    
    if (oldSavedArray.count || oldSavedArray21.count || oldSavedArray22.count || oldSavedArray23.count || oldSavedArray3.count || oldSavedArray4.count || oldSavedArray5.count) {
        [self.dataArr addObjectsFromArray:oldSavedArray];
        [self.dataArr21 addObjectsFromArray:oldSavedArray21];
        [self.dataArr22 addObjectsFromArray:oldSavedArray22];
        [self.dataArr23 addObjectsFromArray:oldSavedArray23];
        [self.dataArr3 addObjectsFromArray:oldSavedArray3];
        [self.dataArr4 addObjectsFromArray:oldSavedArray4];
        [self.dataArr5 addObjectsFromArray:oldSavedArray5];
    }else {
        NSArray* leftArr = [[NSArray alloc] initWithObjects:@"客户编号",@"客户性质",@"客户中文名称",@"客户类型",@"客户角色",@"三证合一", nil];
        NSArray* placeArr = [[NSArray alloc] initWithObjects:@"自动生成",@"请选择客户性质",@"请输入客户中文名称",@"请选择客户类型",@"请选择客户角色",@"请选择是否三证合一", nil];
        
        for (int i = 0; i < leftArr.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr[i];
            model._placeholder = placeArr[i];
            if (5 == i) {
                model._rightContent = @"是";
            }
            [self.dataArr addObject:model];
        }
        
        NSArray* leftArr3 = [[NSArray alloc] initWithObjects:@"纳税人识别号",@"固定电话",@"开户行户名",@"开户行",@"开户行账号", nil];
        NSArray* placeArr3 = [[NSArray alloc] initWithObjects:@"请输入纳税人识别号",@"请输入固定电话",@"请输入开户行户名",@"请输入开户行",@"请输入开户行账号", nil];
        
        for (int i = 0; i < leftArr3.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr3[i];
            model._placeholder = placeArr3[i];
            [self.dataArr3 addObject:model];
        }
        
        NSArray* leftArr4 = [[NSArray alloc] initWithObjects:@"联系人",@"手机号码",@"邮寄地址",@"备注", nil];
        NSArray* placeArr4 = [[NSArray alloc] initWithObjects:@"请输入联系人",@"请输入手机号码",@"请输入邮寄地址",@"请输入备注", nil];
        
        for (int i = 0; i < leftArr4.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr4[i];
            model._placeholder = placeArr4[i];
            [self.dataArr4 addObject:model];
        }
        
        NSArray* leftArr5 = [[NSArray alloc] initWithObjects:@"账户类别",@"账户户名",@"账号",@"开户行分支行",@"账户用途",@"备注", nil];
        NSArray* placeArr5 = [[NSArray alloc] initWithObjects:@"请选择账户类别",@"请输入账户户名",@"点击右侧按钮进行自动识别",@"识别成功后自动填充",@"请选择账户用途",@"请输入备注信息", nil];
        
        for (int i = 0; i < leftArr5.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr5[i];
            model._placeholder = placeArr5[i];
            [self.dataArr5 addObject:model];
        }
        
        NSArray* leftArr21 = [[NSArray alloc] initWithObjects:@"组织机构代码",@"代码证有效期",@"所属行业",@"法人",@"法人证件号",@"注册地址",@"注册资本",@"注册时间", nil];
        NSArray* placeArr21 = [[NSArray alloc] initWithObjects:@"点击右侧按钮进行自动识别",@"识别成功后自动填充",@"请选择所属行业",@"识别成功后自动填充",@"请输入法人证件号",@"识别成功后自动填充",@"识别成功后自动填充",@"识别成功后自动填充", nil];
        
        for (int i = 0; i < leftArr21.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr21[i];
            model._placeholder = placeArr21[i];
            if (0 == i) {
                model._selectRightImg = @"识别";
            }
            [self.dataArr21 addObject:model];
        }
        
        NSArray* leftArr22 = [[NSArray alloc] initWithObjects:@"营业执照号码",@"注册登记日期",@"营业执照到期",@"注册地址",@"注册资本", nil];
        NSArray* placeArr22 = [[NSArray alloc] initWithObjects:@"点击右侧按钮进行自动识别",@"识别成功后自动填充",@"识别成功后自动填充",@"识别成功后自动填充",@"识别成功后自动填充", nil];
        
        for (int i = 0; i < leftArr22.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr22[i];
            model._placeholder = placeArr22[i];
            if (0 == i) {
                model._selectRightImg = @"首页-选中";
            }
            [self.dataArr22 addObject:model];
        }
        
        NSArray* leftArr23 = [[NSArray alloc] initWithObjects:@"国地税登记证",@"税务登记证",@"登记日期",@"是否一般纳税", nil];
        NSArray* placeArr23 = [[NSArray alloc] initWithObjects:@"请选择",@"点击右侧按钮进行自动识别",@"识别成功后自动填充",@"请选择", nil];
        
        for (int i = 0; i < leftArr23.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr23[i];
            model._placeholder = placeArr23[i];
            if (1 == i) {
                model._selectRightImg = @"首页-选中";
            }
            [self.dataArr23 addObject:model];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.isThreeCertificatese) {
        return 5;
    }
    return 6;
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return self.dataArr.count;
    }
    if (self.isThreeCertificatese) {
        if (1 == section) {
            return self.dataArr21.count;
        }else if (2 == section) {
            return self.dataArr3.count;
        }else if (3 == section) {
            return self.dataArr4.count;
        }else if (4 == section) {
            return self.dataArr5.count;
        }
    }else {
        if (1 == section) {
            return self.dataArr22.count;
        }else if (2 == section) {
            return self.dataArr23.count;
        }else if (3 == section) {
            return self.dataArr3.count;
        }else if (4 == section) {
            return self.dataArr4.count;
        }else if (5 == section) {
            return self.dataArr5.count;
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormsCommonCellModel *model = nil;
    if (0 == indexPath.section) {
        if (indexPath.row < self.dataArr.count) {
            model = [self.dataArr objectAtIndex:indexPath.row];
        }
        return [FromsDisplayTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            FromsDisplayTableViewCell *cell = (FromsDisplayTableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    
    if (self.isThreeCertificatese) {
        if (1 == indexPath.section) {
            if (indexPath.row < self.dataArr21.count) {
                model = [self.dataArr21 objectAtIndex:indexPath.row];
            }
        }else if (2 == indexPath.section) {
            if (indexPath.row < self.dataArr3.count) {
                model = [self.dataArr3 objectAtIndex:indexPath.row];
            }
        }else if (3 == indexPath.section) {
            if (indexPath.row < self.dataArr4.count) {
                model = [self.dataArr4 objectAtIndex:indexPath.row];
            }
        }else if (4 == indexPath.section) {
            if (indexPath.row < self.dataArr5.count) {
                model = [self.dataArr5 objectAtIndex:indexPath.row];
            }
        }
    }else {
        if (1 == indexPath.section) {
            if (indexPath.row < self.dataArr22.count) {
                model = [self.dataArr22 objectAtIndex:indexPath.row];
            }
        }else if (2 == indexPath.section) {
            if (indexPath.row < self.dataArr23.count) {
                model = [self.dataArr23 objectAtIndex:indexPath.row];
            }
        }else if (3 == indexPath.section) {
            if (indexPath.row < self.dataArr3.count) {
                model = [self.dataArr3 objectAtIndex:indexPath.row];
            }
        }else if (4 == indexPath.section) {
            if (indexPath.row < self.dataArr4.count) {
                model = [self.dataArr4 objectAtIndex:indexPath.row];
            }
        }else if (5 == indexPath.section) {
            if (indexPath.row < self.dataArr5.count) {
                model = [self.dataArr5 objectAtIndex:indexPath.row];
            }
        }
    }
    
    return [FromsDisplayTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        FromsDisplayTableViewCell *cell = (FromsDisplayTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        if (1 == [self.typeArr[indexPath.row] integerValue]) {//填的
            FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            cell0.FromsFillTableViewCellDelegate = self;
            cell0.rowIndex = indexPath.row;
            cell0.sectionIndex = indexPath.section;
            FormsCommonCellModel* model = self.dataArr[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }else if (2 == [self.typeArr[indexPath.row] integerValue]) {//选的
            FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }
        //显示的
        FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model = self.dataArr[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }
    
    if (self.isThreeCertificatese) {
        if (1 == indexPath.section) {
            if (1 == [self.typeArr21[indexPath.row] integerValue]) {//填的
                FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                cell0.FromsFillTableViewCellDelegate = self;
                cell0.rowIndex = indexPath.row;
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr21[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr21[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr21[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr21[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }else if (2 == indexPath.section) {
            if (1 == [self.typeArr3[indexPath.row] integerValue]) {//填的
                FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                cell0.FromsFillTableViewCellDelegate = self;
                cell0.rowIndex = indexPath.row;
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr3[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr3[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr3[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr3[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }else if (3 == indexPath.section) {
            if (1 == [self.typeArr4[indexPath.row] integerValue]) {//填的
                FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                cell0.FromsFillTableViewCellDelegate = self;
                cell0.rowIndex = indexPath.row;
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr4[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr4[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr4[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr4[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }else if (4 == indexPath.section) {
            if (1 == [self.typeArr5[indexPath.row] integerValue]) {//填的
                FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                cell0.FromsFillTableViewCellDelegate = self;
                cell0.rowIndex = indexPath.row;
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr5[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr5[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr5[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr5[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }
    }else {
        if (1 == indexPath.section) {
            if (1 == [self.typeArr22[indexPath.row] integerValue]) {//填的
                FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                cell0.FromsFillTableViewCellDelegate = self;
                cell0.rowIndex = indexPath.row;
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr22[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr22[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr22[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr22[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }else if (2 == indexPath.section) {
            if (1 == [self.typeArr23[indexPath.row] integerValue]) {//填的
                FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                cell0.FromsFillTableViewCellDelegate = self;
                cell0.rowIndex = indexPath.row;
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr23[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr23[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr23[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr23[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }else if (3 == indexPath.section) {
            if (1 == [self.typeArr3[indexPath.row] integerValue]) {//填的
                FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                cell0.FromsFillTableViewCellDelegate = self;
                cell0.rowIndex = indexPath.row;
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr3[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr3[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr3[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
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
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr4[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr4[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr4[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr4[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }else if (5 == indexPath.section) {
            if (1 == [self.typeArr5[indexPath.row] integerValue]) {//填的
                FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                cell0.FromsFillTableViewCellDelegate = self;
                cell0.rowIndex = indexPath.row;
                cell0.sectionIndex = indexPath.section;
                FormsCommonCellModel* model = self.dataArr5[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }else if (2 == [self.typeArr5[indexPath.row] integerValue]) {//选的
                FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
                cell0.selectionStyle = UITableViewCellSelectionStyleNone;
                FormsCommonCellModel* model = self.dataArr5[indexPath.row];
                [cell0 configCellWithModel:model];
                return cell0;
            }
            //显示的
            FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr5[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        if (5 == indexPath.row) {
            NSArray *arrayTitle = @[@"是",@"否"];
            [self.view createAlertViewTitleArray:arrayTitle textColor:[MyController colorWithHexString:CNavBgColor] font:[UIFont systemFontOfSize:16] actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
                if (0 == didRow) {
                    self.isThreeCertificatese = YES;
                    FormsCommonCellModel* model = self.dataArr[5];
                    model._rightContent = @"是";
                }else if (1 == didRow) {
                    self.isThreeCertificatese = NO;
                    FormsCommonCellModel* model = self.dataArr[5];
                    model._rightContent = @"否";
                }
                [self.tableView reloadData];
            }];
        }
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    headerV.backgroundColor = [UIColor whiteColor];
    
    UILabel* titL = [MyController createLabelWithFrame:headerV.frame Font:CFontSize1 Text:@"基础信息"];
    if (1 == section) {
        titL.text = @"营业执照";
    }else if (0 == section) {
        titL.text = @"基础信息";
    }
    
    if (self.isThreeCertificatese) {//是三证合一
        if (2 == section) {
            titL.text = @"开票信息";
        }else if (3 == section) {
            titL.text = @"联系方式";
        }else if (4 == section) {
            titL.text = @"客户账号信息";
        }
    }else {
        if (2 == section) {
            titL.text = @"税务登记信息";
        }else if (3 == section) {
            titL.text = @"开票信息";
        }else if (4 == section) {
            titL.text = @"联系方式";
        }else if (5 == section) {
            titL.text = @"客户账号信息";
        }
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

- (void)makeSaveBtn {
    UIButton* saveBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(saveBtnClick) Title:@"保存"];
    [saveBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    [saveBtn setTitleColor:[MyController colorWithHexString:CDefaultColor] forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:saveBtn];
    
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_offset(50);
        make.top.mas_equalTo(self.tableView.mas_bottom);
    }];
    
}

/**
 保存按钮响应
 */
- (void)saveBtnClick {
    DLog(@"保存");
    [HUD success:@"保存成功"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configCallback {
    __weak typeof(self) weakSelf = self;
    
    // 这是默认的识别成功的回调
    _successHandler = ^(id result){
        NSLog(@"%@", result);
        NSString *title = @"识别结果";
        NSMutableString *message = [NSMutableString string];
        
        if(result[@"words_result"]){
            if([result[@"words_result"] isKindOfClass:[NSDictionary class]]){
                [result[@"words_result"] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                    if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        [message appendFormat:@"%@: %@\n", key, obj[@"words"]];
                    }else{
                        [message appendFormat:@"%@: %@\n", key, obj];
                    }
                    
                }];
            }else if([result[@"words_result"] isKindOfClass:[NSArray class]]){
                for(NSDictionary *obj in result[@"words_result"]){
                    if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        [message appendFormat:@"%@\n", obj[@"words"]];
                    }else{
                        [message appendFormat:@"%@\n", obj];
                    }
                    
                }
            }
            
        }else{
            [message appendFormat:@"%@", result];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:weakSelf cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
        }];
    };
    
    _failHandler = ^(NSError *error){
        NSLog(@"%@", error);
        NSString *msg = [NSString stringWithFormat:@"%li:%@", (long)[error code], [error localizedDescription]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [[[UIAlertView alloc] initWithTitle:@"识别失败" message:msg delegate:weakSelf cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
        }];
    };
}

-(BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 银行卡正面拍照识别
 */
- (void)bankCardOCROnline {
    
    UIViewController * vc =
    [AipCaptureCardVC ViewControllerWithCardType:CardTypeBankCard
                                 andImageHandler:^(UIImage *image) {
                                     
                                     [[AipOcrService shardService] detectBankCardFromImage:image
                                                                            successHandler:_successHandler
                                                                               failHandler:_failHandler];
                                     
                                 }];
    [self presentViewController:vc animated:YES completion:nil];
    
}

/**
 身份证正面(嵌入式质量控制+云端识别)
 */
- (void)localIdcardOCROnlineFront {
    UIViewController * vc =
    [AipCaptureCardVC ViewControllerWithCardType:CardTypeLocalIdCardFont
                                 andImageHandler:^(UIImage *image) {
                                     [[AipOcrService shardService] detectIdCardFrontFromImage:image
                                                                                  withOptions:nil
                                                                               successHandler:^(id result){
                                                                                   _successHandler(result);
                                                                                   // 这里可以存入相册
                                                                                   //UIImageWriteToSavedPhotosAlbum(image, nil, nil, (__bridge void *)self);
                                                                               }
                                                                                  failHandler:_failHandler];
                                 }];
    [self presentViewController:vc animated:YES completion:nil];
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

