//
//  ZXAgriculturalMachineryViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/3.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "ZXAgriculturalMachineryViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsFillTableViewCell.h"

#import "FromsDisplayTableViewCell.h"
@interface ZXAgriculturalMachineryViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate,UIAlertViewDelegate>
@property(nonatomic,strong)NSMutableArray* isCollapseArr;
/****客户信息*****/
@property(nonatomic,strong)NSArray* typeArr;
@property(nonatomic,strong)NSMutableArray* dataArr;
/*******担保人自然人*******/
@end

@implementation ZXAgriculturalMachineryViewController

- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString *)content {
    FormsCommonCellModel* model = self.dataArr[rowIndex];
    model._rightContent = content;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    self.isCollapseArr = [[NSMutableArray alloc] initWithObjects:@"0", nil];
    //1是填的   2是选的  3是显示的
    self.typeArr = [[NSArray alloc] initWithObjects:@"1",@"2",@"2",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"2",@"1",@"1",@"2",@"2",@"1",@"2",@"1",@"2", nil];
    self.dataArr = [[NSMutableArray alloc] init];
    
    [self initUI];
    [self makeSaveBtn];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    self.dataArr = [[NSMutableArray alloc] init];
    NSArray* leftArr = [[NSArray alloc] initWithObjects:@"经销商名称",@"调查时间",@"调查人员",@"客户名称",@"联系方式",@"职业",@"年龄",@"本地居住年限",@"文化程度",@"实际居住地址",@"婚姻状况",@"配偶姓名",@"联系方式",@"购机用途",@"补贴资金预计到位时间",@"第三方联系人",@"与承租人关系",@"联系方式",@"证件信息", nil];
    NSArray* placeArr = [[NSArray alloc] initWithObjects:@"请输入经销商名称",@"请选择调查时间",@"请选择调查人员",@"请输入客户名称",@"请输入联系方式",@"请输入职业",@"请输入年龄",@"请输入本地居住年限",@"请输入文化程度",@"请输入实际居住地址",@"请选择婚姻状况",@"请输入配偶姓名",@"请输入联系方式",@"请选择购机用途",@"请选择补贴资金预计到位时间",@"请输入第三方联系人",@"请选择与承租人关系",@"请输入联系方式",@"自动识别证件信息",nil];
    
    for (int i = 0; i < leftArr.count; i++) {
        FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
        model._leftTitle = leftArr[i];
        model._placeholder = placeArr[i];
        [self.dataArr addObject:model];
    }
    
    [self.tableView reloadData];
}

#pragma mark -  初始化UI
-(void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 50 - 40 - 40) style:UITableViewStylePlain];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        if ([self.isCollapseArr[section] intValue]) {
            return 0;
        }
        return self.dataArr.count;
    }
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormsCommonCellModel *model = nil;
    if (0 == indexPath.section) {
        if (indexPath.row < self.dataArr.count) {
            model = [self.dataArr objectAtIndex:indexPath.row];
        }
    }else {
        return 0;
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
    return nil;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    headerV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    UILabel* titL = [MyController createLabelWithFrame:headerV.frame Font:CFontSize1 Text:nil];
    titL.textAlignment = NSTextAlignmentCenter;
    [headerV addSubview:titL];
    
    [titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset(50);
    }];
    
    UIView* lineV = [MyController viewWithFrame:headerV.frame];
    lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
    [headerV addSubview:lineV];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(2);
    }];
    
    UIButton* collapseBtn = [MyController createButtonWithFrame:headerV.frame ImageName:@"添加" Target:self Action:@selector(collapseBtnClick:) Title:nil];
    collapseBtn.tag = 100 + section;
    [headerV addSubview:collapseBtn];
    
    [collapseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-KNormalSpace);
        make.width.mas_offset(30);
        make.height.mas_offset(30);
        make.centerY.mas_equalTo(headerV.mas_centerY);
    }];
    
    if (0 == section) {
        titL.text = @"客户信息";
        return headerV;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 50;
    }
    return 0;
}

#pragma mark - 创建保存按钮
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

#pragma mark - 保存响应
- (void)saveBtnClick {
    DLog(@"保存");
    [HUD success:@"保存成功"];
}

#pragma mark - 收起按钮响应
- (void)collapseBtnClick:(UIButton*)btn {
    DLog(@"收起%ld",btn.tag -100);
    if ([self.isCollapseArr[btn.tag -100] intValue]) {
        self.isCollapseArr[btn.tag -100] = @"0";
    }else {
        self.isCollapseArr[btn.tag -100] = @"1";
    }
    [self.tableView reloadSections:[[NSIndexSet alloc]initWithIndex:btn.tag - 100] withRowAnimation:UITableViewRowAnimationAutomatic];
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

