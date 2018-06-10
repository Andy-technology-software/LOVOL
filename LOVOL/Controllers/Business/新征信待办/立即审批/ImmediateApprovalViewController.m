//
//  ImmediateApprovalViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/18.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "ImmediateApprovalViewController.h"

#import "ImmediateApprovalTableViewCell.h"
@interface ImmediateApprovalViewController ()<UITableViewDelegate,UITableViewDataSource,AdvancedExpandableTableViewDelegate,UIAlertViewDelegate> {
    CGFloat textCellHeight;
}
@property(nonatomic,strong)NSMutableArray* dataArr;
//说点什么
@property(nonatomic,copy)NSString* saySomething;
@end

@implementation ImmediateApprovalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self makeSaveBtn];
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

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return MAX(110, textCellHeight + 10);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImmediateApprovalTableViewCell *textCell = [tableView advancedExpandableTextCellWithId2:@"ImmediateApprovalTableViewCell"];
    textCell.placeholder = @"请输入审批意见";
    textCell.selectionStyle = UITableViewCellSelectionStyleNone;
    textCell.maxCharacter = 1000;
    return textCell;
}

- (void)makeSaveBtn {
    UIView* bottmV = [MyController viewWithFrame:self.view.frame];
    bottmV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottmV];
    
    [bottmV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_offset(50);
        make.top.mas_equalTo(self.tableView.mas_bottom);
    }];
    
    UIButton* saveBtn = [MyController createButtonWithFrame:bottmV.frame ImageName:nil Target:self Action:@selector(saveBtnClick) Title:@"同意"];
    [saveBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    [saveBtn setTitleColor:[MyController colorWithHexString:CDefaultColor] forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bottmV addSubview:saveBtn];
    
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_offset([MyController getScreenWidth] * 2/ 3);
        make.height.mas_offset(50);
        make.top.mas_equalTo(0);
    }];
    
    UIButton* cancelBtn = [MyController createButtonWithFrame:bottmV.frame ImageName:nil Target:self Action:@selector(cancelBtnBtnClick) Title:@"打回"];
    [cancelBtn setBackgroundColor:[MyController colorWithHexString:@"FF4040"]];
    [cancelBtn setTitleColor:[MyController colorWithHexString:CDefaultColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bottmV addSubview:cancelBtn];
    
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(saveBtn.mas_right);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(saveBtn);
        make.top.mas_equalTo(saveBtn);
    }];
    
}

- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath{
    textCellHeight = height;
}
- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath{
    self.saySomething = text;
    
}

/**
 同意
 */
- (void)saveBtnClick {
    DLog(@"同意");
    
}

/**
 打回
 */
- (void)cancelBtnBtnClick {
    DLog(@"打回");
    if (![MyController returnStr:self.saySomething].length) {
        [HUD warning:@"请填写审批意见"];
        return;
    }
    UIAlertView* al = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定打回该审批吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [al show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (1 == buttonIndex) {
        DLog(@"打回");
    }
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
