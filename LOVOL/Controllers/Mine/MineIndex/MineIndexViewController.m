//
//  MineIndexViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "MineIndexViewController.h"

#import "TestBaiDuViewController.h"

#import "AboutUsViewController.h"//关于我们

#import "ResetPassWordViewController.h"//密码重置
@interface MineIndexViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property(nonatomic,strong)UIView* topView;
@property(nonatomic,strong)UIView* bottomView;
@end

@implementation MineIndexViewController

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    [self initUI];
}

/**
 数据请求
 */
- (void)sourceRequestList {

}

#pragma mark -  初始化UI
-(void)initUI {
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
    
}

#pragma mark -  tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MyController getScreenHeight] - [MyController isIOS7];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell0 = [[UITableViewCell alloc] init];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    cell0.backgroundColor = [MyController colorWithHexString:CViewF5Color];
    
    self.topView = [MyController viewWithFrame:cell0.contentView.frame];
    self.topView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    [cell0 addSubview:self.topView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(6);
        make.right.mas_equalTo(0);
        make.height.mas_offset(100);
    }];
    
    NSArray* titA = [[NSArray alloc] initWithObjects:@"当前账号",@"手机串码", nil];
    NSArray* titA1 = [[NSArray alloc] initWithObjects:@"admin(经销商)",@"ADC123", nil];
    for (int i = 0; i < titA.count; i++) {
        UIView* leftV = [MyController viewWithFrame:CGRectMake(0, 50 * i, [MyController getScreenWidth], 50)];
        leftV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
        [self.topView addSubview:leftV];
        
        UIImageView* leftIV = [MyController createImageViewWithFrame:leftV.frame ImageName:titA[i]];
        [leftV addSubview:leftIV];
        
        [leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KNormalSpace);
            make.centerY.mas_equalTo(leftV.mas_centerY);
            make.width.mas_offset(20);
            make.height.mas_offset(20);
        }];
        
        UILabel* titL = [MyController createLabelWithFrame:leftV.frame Font:CFontSize1 Text:titA[i]];
        [leftV addSubview:titL];
        
        [titL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftIV.mas_right).mas_offset(KNormalSpace);
            make.centerY.mas_equalTo(leftIV.mas_centerY);
            make.width.mas_offset(100);
        }];
        
        
        UILabel* titL1 = [MyController createLabelWithFrame:leftV.frame Font:CFontSize1 Text:titA1[i]];
        titL1.textColor = [MyController colorWithHexString:CFontColor2];
        titL1.textAlignment = NSTextAlignmentRight;
        [leftV addSubview:titL1];
        
        [titL1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftIV.mas_right).mas_offset(KNormalSpace);
            make.centerY.mas_equalTo(leftIV.mas_centerY);
            make.right.mas_equalTo(-KNormalSpace);
        }];
        
    }
    
    UIView* lineV = [MyController viewWithFrame:self.topView.frame];
    lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.topView addSubview:lineV];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.centerY.mas_equalTo(self.topView.mas_centerY);
        make.height.mas_offset(0.5);
        make.right.mas_equalTo(0);
    }];
    
    /************************************************************************************************************************************************************/
    
    self.bottomView = [MyController viewWithFrame:cell0.contentView.frame];
    self.bottomView.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    [cell0 addSubview:self.bottomView];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.topView.mas_bottom).mas_offset(6);
        make.right.mas_equalTo(0);
        make.height.mas_offset(200);
    }];
    
    NSArray* titA2 = [[NSArray alloc] initWithObjects:@"密码重置",@"关于我们",@"版本更新",@"退出登录", nil];
    NSArray* titA3 = [[NSArray alloc] initWithObjects:@"",@"",@"新版本V1.0(点击更新)",@"", nil];
    for (int i = 0; i < titA2.count; i++) {
        UIView* leftV = [MyController viewWithFrame:CGRectMake(0, 50 * i, [MyController getScreenWidth], 50)];
        leftV.backgroundColor = [MyController colorWithHexString:CDefaultColor];
        [self.bottomView addSubview:leftV];
        
        UIImageView* leftIV = [MyController createImageViewWithFrame:leftV.frame ImageName:titA2[i]];
        [leftV addSubview:leftIV];
        
        [leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KNormalSpace);
            make.centerY.mas_equalTo(leftV.mas_centerY);
            make.width.mas_offset(20);
            make.height.mas_offset(20);
        }];
        
        UILabel* titL = [MyController createLabelWithFrame:leftV.frame Font:CFontSize1 Text:titA2[i]];
        [leftV addSubview:titL];
        
        [titL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftIV.mas_right).mas_offset(KNormalSpace);
            make.centerY.mas_equalTo(leftIV.mas_centerY);
            make.width.mas_offset(100);
        }];
        
        if (2 == i) {
            UILabel* titL1 = [MyController createLabelWithFrame:leftV.frame Font:CFontSize2 Text:titA3[i]];
            titL1.textColor = [MyController colorWithHexString:CFontColor2];
            titL1.textAlignment = NSTextAlignmentRight;
            [leftV addSubview:titL1];
            
            [titL1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(leftIV.mas_right).mas_offset(KNormalSpace);
                make.centerY.mas_equalTo(leftIV.mas_centerY);
                make.right.mas_equalTo(-KNormalSpace);
            }];
        }else {
            UIImageView* rIV = [MyController createImageViewWithFrame:leftV.frame ImageName:@"更多"];
            [leftV addSubview:rIV];
            
            [rIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-KNormalSpace);
                make.centerY.mas_equalTo(leftV.mas_centerY);
                make.width.mas_offset(20);
                make.height.mas_offset(20);
            }];
        }
        
        UIView* lineV = [MyController viewWithFrame:self.topView.frame];
        lineV.backgroundColor = [MyController colorWithHexString:CLineColor];
        [leftV addSubview:lineV];
        
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(40);
            make.centerY.mas_equalTo(leftV.mas_bottom).mas_offset(-0.5);
            make.height.mas_offset(0.5);
            make.right.mas_equalTo(0);
        }];
        
        UIButton* seleB = [MyController createButtonWithFrame:leftV.frame ImageName:nil Target:self Action:@selector(seleBClick:) Title:nil];
        seleB.tag = 100 + i;
        [self.bottomView addSubview:seleB];
    }
    
    /************************************************************************************************************************************************************/

    UILabel* currentVL = [MyController createLabelWithFrame:cell0.contentView.frame Font:10 Text:@"当前版本V1.0"];
    currentVL.textColor = [MyController colorWithHexString:@"c6c6c6"];
    currentVL.backgroundColor = [MyController colorWithHexString:@"ededed"];
    currentVL.textAlignment = NSTextAlignmentCenter;
    currentVL.layer.cornerRadius = 10.0f;
    [currentVL.layer setMasksToBounds:YES];
    [cell0 addSubview:currentVL];
    
    [currentVL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(cell0.contentView.mas_centerX);
        make.top.mas_equalTo(self.bottomView.mas_bottom).mas_offset(20);
        make.width.mas_offset(100);
        make.height.mas_offset(20);
    }];
    
    return cell0;
    
}


/**
 密码重置、关于我们点击方法

 @param btn tag值
 */
- (void)seleBClick:(UIButton*)btn {
    if (100 == btn.tag) {
        DLog(@"密码重置");
        ResetPassWordViewController* vc = [[ResetPassWordViewController alloc] init];
        vc.title = @"密码重置";
        [self.navigationController pushViewController:vc animated:YES];
//        TestBaiDuViewController* vc = [[TestBaiDuViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
    }else if (101 == btn.tag) {
        DLog(@"关于我们");
        AboutUsViewController* vc = [[AboutUsViewController alloc] init];
        vc.title = @"关于我们";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (102 == btn.tag) {
        DLog(@"版本更新");
        [HUD warning:@"当前已是最新版本"];
    }else if (103 == btn.tag) {
        DLog(@"退出登录");
        UIAlertView* al = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否要退出登录？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
        [al show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (1 == buttonIndex) {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults removeObjectForKey:UUIDKey];
        //全部删除
        NSString *appDomainStr = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomainStr];
        [(AppDelegate *)[UIApplication sharedApplication].delegate setLoginRoot];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
