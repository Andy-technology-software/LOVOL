//
//  DealerAccessPendingDetailViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/6/11.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "DealerAccessPendingDetailViewController.h"

#import "FormsCommonCellModel.h"

#import "FromsDisplayTableViewCell.h"
@interface DealerAccessPendingDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation DealerAccessPendingDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
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
    NSArray* leftArr = [[NSArray alloc] initWithObjects:@"流程编号",@"流程状态",@"经销商",@"申请人", nil];
    NSArray* conArr = [[NSArray alloc] initWithObjects:@"NO.201800000001",@"待审批",@"李磊",@"韩梅梅", nil];
    
    for (int i = 0; i < leftArr.count; i++) {
        FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
        model._leftTitle = leftArr[i];
        model._rightContent = conArr[i];
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
    FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    FormsCommonCellModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

- (void)makeSaveBtn {
    UIButton* saveBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(saveBtnClick) Title:@"立即审批"];
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
    DLog(@"立即审批");
    [HUD success:@"审批完成"];
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

