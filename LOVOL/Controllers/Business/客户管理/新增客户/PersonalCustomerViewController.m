//
//  PersonalCustomerViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/14.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "PersonalCustomerViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsFillTableViewCell.h"

#import "FromsDisplayTableViewCell.h"
@interface PersonalCustomerViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate,UIAlertViewDelegate>
@property(nonatomic,strong)NSArray* typeArr;
@property(nonatomic,strong)NSArray* typeArr2;
@property(nonatomic,strong)NSMutableArray* dataArr;
@property(nonatomic,strong)NSMutableArray* dataArr2;
@property(nonatomic,assign)BOOL isNotFirstIncome;//是不是第一次进页面

@end

@implementation PersonalCustomerViewController {
    // 默认的识别成功的回调
    void (^_successHandler)(id);
    // 默认的识别失败的回调
    void (^_failHandler)(NSError *);
}

- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString *)content {
    if (0 == sectionIndex) {
        FormsCommonCellModel* model = self.dataArr[rowIndex];
        model._rightContent = content;
    }else if (1 == sectionIndex) {
        FormsCommonCellModel* model = self.dataArr2[rowIndex];
        model._rightContent = content;
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr] forKey:@"AddPersonalCustomer"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.dataArr2] forKey:@"AddPersonalCustomer2"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*********************************************************************百度OCR识别********************************************************************************************/
    [[AipOcrService shardService] authWithAK:BAIDUAPIKEY andSK:BAIDUSECRETKEY];
    [self configCallback];
    self.dataArr = [[NSMutableArray alloc] init];
    self.dataArr2 = [[NSMutableArray alloc] init];
    //1是填的   2是选的  3是显示的
    self.typeArr = [[NSArray alloc] initWithObjects:@"3",@"2",@"2",@"3",@"3",@"2",@"1",@"3",@"3",@"2",@"3",@"3",@"3",@"3",@"2",@"2",@"1",@"1",@"1",@"1",@"1",@"1", nil];
    self.typeArr2 = [[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    
    [self initUI];
    [self makeSaveBtn];
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
        NSArray* isMustArr = [[NSArray alloc] initWithObjects:@"0",@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"1",@"1",@"1", nil];
        NSArray* placeArr = [[NSArray alloc] initWithObjects:@"自动生成",@"点击右侧按钮进行自动识别",@"请选择证件类型",@"识别成功后自动填充",@"识别成功后自动填充",@"请选择客户角色",@"请输入经销商名称",@"",@"",@"请选择国籍",@"识别成功后自动填充",@"识别成功后自动填充",@"识别成功后自动填充",@"识别成功后自动填充",@"请选择文化程度",@"请选择婚姻状况",@"请输入配偶姓名",@"请输入配偶身份证号",@"请输入联系方式",@"请输入邮寄地址",@"请输入常住地址",@"请输入手机号码", nil];
        
        for (int i = 0; i < leftArr.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr[i];
            model._isMust = isMustArr[i];
            model._placeholder = placeArr[i];
            if (1 == i) {
                model._selectRightImg = @"识别";
            }
            [self.dataArr addObject:model];
        }
        
        
        NSArray* leftArr2 = [[NSArray alloc] initWithObjects:@"开户名",@"开户行分支行",@"卡号", nil];
        NSArray* isMustArr2 = [[NSArray alloc] initWithObjects:@"1",@"1",@"1", nil];
        NSArray* placeArr2 = [[NSArray alloc] initWithObjects:@"请输入开户名",@"点击右侧按钮进行自动识别",@"识别成功后自动填充", nil];
        
        for (int i = 0; i < leftArr2.count; i++) {
            FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
            model._leftTitle = leftArr2[i];
            model._isMust = isMustArr2[i];
            model._placeholder = placeArr2[i];
            if (1 == i) {
                model._selectRightImg = @"首页-选中";
            }
            [self.dataArr2 addObject:model];
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
    
    if (1 == [self.typeArr2[indexPath.row] integerValue]) {//填的
        FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        cell0.FromsFillTableViewCellDelegate = self;
        cell0.rowIndex = indexPath.row;
        cell0.sectionIndex = indexPath.section;
        FormsCommonCellModel* model = self.dataArr2[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (2 == [self.typeArr2[indexPath.row] integerValue]) {//选的
        FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model = self.dataArr2[indexPath.row];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        if (1 == indexPath.row) {
            [self localIdcardOCROnlineFront];//身份证正面
        }
    }else if (1 == indexPath.section) {
        if (1 == indexPath.row) {
            [self bankCardOCROnline];//银行卡正面
        }
    }
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
