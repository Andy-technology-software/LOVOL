//
//  MsgDetailViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "MsgDetailViewController.h"

#import "FormsCommonCellModel.h"

#import "MsgDetailModel.h"

#import "FromsDisplayTableViewCell.h"

#import "MsgDetailTableViewCell.h"
@interface MsgDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArr;
@property(nonatomic,strong)NSMutableArray* dataArr1;

@end

@implementation MsgDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    self.dataArr1 = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeData];
    [self makeBottomBtn];
}

/**
 数据初始化
 */
- (void)makeData {
    NSArray* leftA = [[NSArray alloc] initWithObjects:@"合同编号",@"承租人",@"手机号码",@"产品型号",@"融资期限",@"首期还款日",@"最后还款日",@"租金金额",@"月租余额", nil];
    for (int i = 0; i < leftA.count; i++) {
        FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
        model._leftTitle = leftA[i];
        model._rightContent = @"暂无信息";
        [self.dataArr addObject:model];
    }
    
    for (int i = 0; i < 2; i++) {
        MsgDetailModel* model = [[MsgDetailModel alloc] init];
        model.tit = @"还款方式：现金转账";
        model.time = @"2018-01-01 10:00";
        model.des = @"足额还款";
        model.reason = @"按期完整还款";
        [self.dataArr1 addObject:model];
    }
    [self.tableView reloadData];
}

- (void)makeBottomBtn {
    UIButton* addBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(addBtnClick) Title:@"新增补录"];
    [addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:addBtn];
    
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.tableView.mas_bottom);
        make.height.mas_offset(50);
    }];
}

/**
 新增补录按钮响应
 */
- (void)addBtnClick {
    DLog(@"新增补录");
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
    if (1 == section) {
        return self.dataArr1.count;
    }
    return self.dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (1 == indexPath.section) {
        MsgDetailModel *model = nil;
        if (indexPath.row < self.dataArr1.count) {
            model = [self.dataArr1 objectAtIndex:indexPath.row];
        }
        
        return [MsgDetailTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            MsgDetailTableViewCell *cell = (MsgDetailTableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
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
    if (1 == indexPath.section) {
        MsgDetailTableViewCell* cell0 = [[MsgDetailTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        MsgDetailModel* model = self.dataArr1[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }
    FromsDisplayTableViewCell* cell0 = [[FromsDisplayTableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    FormsCommonCellModel* model = self.dataArr[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (1 == section) {
        UIView* titV = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
        titV.backgroundColor = [UIColor whiteColor];
        
        UILabel* topL = [MyController createLabelWithFrame:titV.frame Font:CFontSize1 Text:@"补录字段"];
        [titV addSubview:topL];
        
        [topL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KNormalSpace);
            make.centerY.mas_equalTo(titV.mas_centerY).mas_offset(4);
        }];
        
        UIView* lineV = [MyController viewWithFrame:titV.frame];
        lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
        [titV addSubview:lineV];
        
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_offset(0.5);
            make.bottom.mas_equalTo(titV.mas_bottom);
        }];
        
        UIView* lineV1 = [MyController viewWithFrame:titV.frame];
        lineV1.backgroundColor = [MyController colorWithHexString:CViewF5Color];
        [titV addSubview:lineV1];
        
        [lineV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_offset(4);
            make.top.mas_equalTo(0);
        }];
        return titV;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (1 == section) {
        return 50;
    }
    return 0;
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
