
//
//  DBBusinessinitiationViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/11.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "DBBusinessinitiationViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsDisplayTableViewCell.h"
@interface DBBusinessinitiationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray* typeArr;
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation DBBusinessinitiationViewController

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString *)content {
    FormsCommonCellModel* model = self.dataArr[rowIndex];
    model._rightContent = content;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeSaveBtn];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    
    NSArray* leftArr = [[NSArray alloc] initWithObjects:@"客户类型",@"客户名称",@"客户编号", nil];
    NSArray* placeArr = [[NSArray alloc] initWithObjects:@"请选择客户类型",@"请选择客户名称",@"自动填充",nil];
    NSArray* mustA = [[NSArray alloc] initWithObjects:@"1",@"1",@"1",@"0", nil];
    
    for (int i = 0; i < leftArr.count; i++) {
        FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
        model._leftTitle = leftArr[i];
        model._placeholder = placeArr[i];
        model._isMust = mustA[i];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormsCommonCellModel *model = nil;
    if (indexPath.row < self.dataArr.count) {
        model = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    return [FromsDisplayTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        FromsDisplayTableViewCell *cell = (FromsDisplayTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (2 == indexPath.row) {//填的
        FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
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

- (void)makeSaveBtn {
    UIButton* saveBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(saveBtnClick) Title:@"完成"];
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

- (void)saveBtnClick {
    DLog(@"发起");
    [HUD success:@"发起成功，可在业务受理待办中查看！"];
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

