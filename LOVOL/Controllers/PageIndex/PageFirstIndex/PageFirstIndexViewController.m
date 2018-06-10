//
//  PageFirstIndexViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "PageFirstIndexViewController.h"

#import "PageFirstIndex0Model.h"

#import "PageFirstIndex1Model.h"

#import "PageFirstIndex0TableViewCell.h"

#import "PageFirstIndex1TableViewCell.h"

#import "NoticeViewController.h"

#import "MsgViewController.h"
@interface PageFirstIndexViewController ()<UITableViewDelegate,UITableViewDataSource,PageFirstIndex0TableViewCellDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *dataArray1;

@end

@implementation PageFirstIndexViewController

/**
 点击更多
 */
- (void)sendBackS0More {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    LYSSlideMenuController *slideMenu = [[LYSSlideMenuController alloc] init];
    slideMenu.title = @"通知";
    NoticeViewController *oneVC = [[NoticeViewController alloc] init];
    MsgViewController *twoVC = [[MsgViewController alloc] init];
    slideMenu.controllers = @[oneVC,twoVC];
    slideMenu.titles = @[@"通知通告",@"消息提醒"];
    slideMenu.bottomLineWidth = 60;
    slideMenu.bottomLineHeight = 2;
    slideMenu.bottomLineColor = [MyController colorWithHexString:CNavBgColor];
    slideMenu.titleColor = [MyController colorWithHexString:@"9d9ea3"];
    slideMenu.titleSelectColor = [MyController colorWithHexString:CNavBgColor];
    [self.navigationController pushViewController:slideMenu animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"汇银金融";
    self.dataArray = [[NSMutableArray alloc] init];
    self.dataArray1 = [[NSMutableArray alloc] init];
    [self initUI];
    [self makeData];
}

- (void)makeData {
    PageFirstIndex0Model* model0 = [[PageFirstIndex0Model alloc] init];
    model0.title = @"贷款到期提醒：";
    model0.des = @"你贷款号：D666666666于2018年07月07日到期，请知晓！";
    [self.dataArray addObject:model0];
    
    PageFirstIndex1Model* model1 = [[PageFirstIndex1Model alloc] init];
    [self.dataArray1 addObject:model1];
    
    [self.tableView reloadData];
}


/**
 数据请求
 */
- (void)sourceRequestList {
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

#pragma mark -  初始化UI
-(void)initUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [MyController isIOS7], [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7]) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setBackgroundColor:[MyController colorWithHexString:CViewF5Color]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:self.tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self headRefresh];
    }];
    
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    [self sourceRequestList];
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return self.dataArray.count;
    }
    return self.dataArray1.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        PageFirstIndex0Model *model = nil;
        if (indexPath.row < self.dataArray.count) {
            model = [self.dataArray objectAtIndex:indexPath.row];
        }
        
        return [PageFirstIndex0TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            PageFirstIndex0TableViewCell *cell = (PageFirstIndex0TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    
    PageFirstIndex1Model *model = nil;
    if (indexPath.row < self.dataArray1.count) {
        model = [self.dataArray1 objectAtIndex:indexPath.row];
    }
    
    return [PageFirstIndex1TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        PageFirstIndex1TableViewCell *cell = (PageFirstIndex1TableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        PageFirstIndex0TableViewCell* cell0 = [[PageFirstIndex0TableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        cell0.PageFirstIndex0TableViewCellDelegate = self;
        PageFirstIndex0Model* model = self.dataArray[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }
    
    PageFirstIndex1TableViewCell* cell0 = [[PageFirstIndex1TableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    PageFirstIndex1Model* model = self.dataArray1[indexPath.row];
    [cell0 configCellWithModel:model];
    return cell0;
    
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
