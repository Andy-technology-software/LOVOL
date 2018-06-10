//
//  ResetPassWordViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/3.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "ResetPassWordViewController.h"

#import "FormsCommonCellModel.h"

#import "FromsFillTableViewCell.h"
@interface ResetPassWordViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation ResetPassWordViewController

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
    
    NSArray* leftArr = [[NSArray alloc] initWithObjects:@"原密码",@"新密码",@"确认新密码", nil];
    NSArray* placeArr = [[NSArray alloc] initWithObjects:@"请输入原密码",@"请输入新密码",@"请确认新密码",nil];
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
    
    return [FromsFillTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        FromsFillTableViewCell *cell = (FromsFillTableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    cell0.FromsFillTableViewCellDelegate = self;
    cell0.rowIndex = indexPath.row;
    cell0.sectionIndex = indexPath.section;
    FormsCommonCellModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
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

- (void)saveBtnClick {
    DLog(@"保存");
    NSString * savedPW = [[NSUserDefaults standardUserDefaults] objectForKey:@"SAVEDPASSWORD"];
    
    FormsCommonCellModel *model0 = self.dataArr[0];
    FormsCommonCellModel *model1 = self.dataArr[1];
    FormsCommonCellModel *model2 = self.dataArr[2];
    
    if (![MyController returnStr:model0._rightContent].length) {
        [HUD warning:@"请输入原密码"];
        return;
    }else if (![model0._rightContent isEqualToString:savedPW]) {
        [HUD warning:@"原密码输入有误，请重新输入"];
        return;
    }else if (![MyController returnStr:model1._rightContent].length) {
        [HUD warning:@"请输入新密码"];
        return;
    }else if (![MyController returnStr:model2._rightContent].length) {
        [HUD warning:@"请确认新密码"];
        return;
    }else if (![model1._rightContent isEqualToString:model2._rightContent]) {
        [HUD warning:@"两次新密码输入不一致"];
        return;
    }else if ([MyController returnStr:model1._rightContent].length < 6) {
        [HUD warning:@"密码至少6位"];
        return;
    }
    
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

