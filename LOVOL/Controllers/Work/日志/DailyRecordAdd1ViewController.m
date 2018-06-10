//
//  DailyRecordAdd1ViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/6/1.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "DailyRecordAdd1ViewController.h"

#import "FormsCommonCellModel.h"

#import "FormsSelectedTableViewCell.h"

#import "NeighborhoodSend0TableViewCell.h"
@interface DailyRecordAdd1ViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate> {
    CGFloat textCellHeight;
}
@property(nonatomic,strong)NSArray* typeArr;
@property(nonatomic,strong)NSMutableArray* dataArr;

@end

@implementation DailyRecordAdd1ViewController

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] init];
    //1是填的   2是选的
    self.typeArr = [[NSArray alloc] initWithObjects:@"2",@"1",@"1",@"1",@"1",@"1",@"1",@"2", nil];
    [self initUI];
    [self makeSaveBtn];
    [self makeData];
}

/**
 数据初始化
 */
- (void)makeData {
    
    NSArray* leftArr = [[NSArray alloc] initWithObjects:@"日报类型",@"签单情况",@"邮寄情况",@"工作情况",@"当日住宿地点",@"明日工作计划",@"工作心得体会",@"厂商任务关联", nil];
    NSArray* placeArr = [[NSArray alloc] initWithObjects:@"请选择日报类型",@"请输入签单情况",@"请输入邮寄情况",@"请输入工作情况",@"请输入当日住宿地点",@"请输入明日工作计划",@"请输入工作心得体会",@"请选择厂商任务关联",nil];
    
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
    if (2 == [self.typeArr[indexPath.row] intValue]) {
        FormsCommonCellModel *model = nil;
        if (indexPath.row < self.dataArr.count) {
            model = [self.dataArr objectAtIndex:indexPath.row];
        }
        
        return [FormsSelectedTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            FormsSelectedTableViewCell *cell = (FormsSelectedTableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    return MAX(120, textCellHeight + 10);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (1 == [self.typeArr[indexPath.row] integerValue]) {//填的
        NeighborhoodSend0TableViewCell *textCell = [tableView advancedExpandableTextCellWithId2:@"MakeSureOrderTimeTableViewCell"];
        textCell.placeholder = @"说点什么...可以召集、搭车、出游、运动、二手货...";
        textCell.selectionStyle = UITableViewCellSelectionStyleNone;
        textCell.maxCharacter = 1000;
        return textCell;
    }else if (2 == [self.typeArr[indexPath.row] integerValue]) {//选的
        FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        FormsCommonCellModel* model = self.dataArr[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }
    return nil;
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

#pragma mark - 这是事由cell代理
- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath{
    textCellHeight = height;
}
- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"debug : updatedText\n%@", text);
    //    self.saySomething = text;
}

- (void)saveBtnClick {
    DLog(@"保存");
    [HUD success:@"保存成功"];
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


