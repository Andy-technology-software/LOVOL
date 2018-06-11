//
//  BusinessReceptionDetailViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/29.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "BusinessReceptionDetailViewController.h"

#import "TransactionConditionsAddViewController.h"//资信成交条件新增

#import "LeaseItemAddViewController.h"//资信租赁物新增

#import "RentalPaymentTableAddViewController.h"//资信租金支付表新增

#import "GuarantorListViewController.h"//资信担保人新增

#import "CreditRatingAddViewController.h"//资信评级

#import "ZXContractCategoryViewController.h"//资信合同类别

#import "ZXDataUploadViewController.h"//资信资料上传

#import "ZXContractPreviewViewController.h"//资信合同预览

#import "ZXContractSignViewController.h"//资信合同面签

#import "ImmediateApprovalViewController.h"//立即审批
@interface BusinessReceptionDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@end

@implementation BusinessReceptionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    
    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"融资申请", @"租赁物信息",@"租金支付表",@"担保人信息",@"资信评级",@"合同预览",@"合同面签",@"资料上传"]];
    self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    self.segmentedControl.frame = CGRectMake(0, 0, viewWidth, 40);
    //    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [MyController colorWithHexString:@"393939"]};
    self.segmentedControl.selectionIndicatorColor = [MyController colorWithHexString:CNavBgColor];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.segmentEdgeInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.verticalDividerEnabled = YES;
    self.segmentedControl.verticalDividerColor = [MyController colorWithHexString:CLineColor];
    self.segmentedControl.verticalDividerWidth = 1.0f;
    self.segmentedControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    [self.segmentedControl setTitleFormatter:^NSAttributedString *(HMSegmentedControl *segmentedControl, NSString *title, NSUInteger index, BOOL selected) {
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : [MyController colorWithHexString:CFontColor0]}];
        return attString;
    }];
//    [self.segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];

    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake([MyController getScreenWidth] * index, 40, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50) animated:YES];
    }];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, viewWidth, [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50)];
    self.scrollView.backgroundColor = [MyController colorWithHexString:CLineColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(viewWidth * 8, [MyController getScreenHeight] - [MyController isIOS7] - 0 - 40 - 50);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 40, viewWidth, [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50) animated:NO];
    [self.view addSubview:self.scrollView];
    
    [self createSliderView];
    
    //    UIView* linV1 = [MyController viewWithFrame:CGRectMake(0, 40 - 2, [MyController getScreenWidth], 2)];
    //    linV1.backgroundColor = [MyController colorWithHexString:CLineColor];
    //    [self.view addSubview:linV1];
    
    UIButton* saveBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(saveBtnClick) Title:@"立即审批"];
    [saveBtn setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
    [saveBtn setTitleColor:[MyController colorWithHexString:CDefaultColor] forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:saveBtn];
    
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_offset(50);
        make.top.mas_equalTo(self.scrollView.mas_bottom);
    }];
}

#pragma mark - 创建滑动
- (void)createSliderView{
    TransactionConditionsAddViewController* rzsqvc = [[TransactionConditionsAddViewController alloc] init];
    rzsqvc.view.frame = CGRectMake([MyController getScreenWidth] * 0, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50);
    [self addChildViewController:rzsqvc];
    [self.scrollView addSubview:rzsqvc.view];
    
    LeaseItemAddViewController* zlwxxvc = [[LeaseItemAddViewController alloc] init];
    zlwxxvc.view.frame = CGRectMake([MyController getScreenWidth] * 1, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50);
    [self addChildViewController:zlwxxvc];
    [self.scrollView addSubview:zlwxxvc.view];
    
    RentalPaymentTableAddViewController* zjzfbvc = [[RentalPaymentTableAddViewController alloc] init];
    zjzfbvc.view.frame = CGRectMake([MyController getScreenWidth] * 2, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50);
    [self addChildViewController:zjzfbvc];
    [self.scrollView addSubview:zjzfbvc.view];
    
    GuarantorListViewController* dbrxxvc = [[GuarantorListViewController alloc] init];
    dbrxxvc.view.frame = CGRectMake([MyController getScreenWidth] * 3, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50);
    [self addChildViewController:dbrxxvc];
    [self.scrollView addSubview:dbrxxvc.view];
    
    CreditRatingAddViewController* zxpjvc = [[CreditRatingAddViewController alloc] init];
    zxpjvc.view.frame = CGRectMake([MyController getScreenWidth] * 4, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50);
    [self addChildViewController:zxpjvc];
    [self.scrollView addSubview:zxpjvc.view];
    
    ZXContractPreviewViewController* htylvc = [[ZXContractPreviewViewController alloc] init];
    htylvc.view.frame = CGRectMake([MyController getScreenWidth] * 5, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50);
    [self addChildViewController:htylvc];
    [self.scrollView addSubview:htylvc.view];
    
    ZXContractSignViewController* htmqvc = [[ZXContractSignViewController alloc] init];
    htmqvc.view.frame = CGRectMake([MyController getScreenWidth] * 6, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50);
    [self addChildViewController:htmqvc];
    [self.scrollView addSubview:htmqvc.view];
    
    ZXDataUploadViewController* zlscvc = [[ZXDataUploadViewController alloc] init];
    zlscvc.view.frame = CGRectMake([MyController getScreenWidth] * 7, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 50);
    [self addChildViewController:zlscvc];
    [self.scrollView addSubview:zlscvc.view];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (![scrollView isKindOfClass:[UITableView class]]) {
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
        NSLog(@"-----%ld",page);
    }
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    [self.segmentedControl setSelectedSegmentIndex:segmentedControl.selectedSegmentIndex animated:YES];
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
    [self.segmentedControl setSelectedSegmentIndex:segmentedControl.selectedSegmentIndex animated:YES];
}

- (void)saveBtnClick {
    ImmediateApprovalViewController* vc = [[ImmediateApprovalViewController alloc] init];
    vc.title = @"审批";
    [self.navigationController pushViewController:vc animated:YES];
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

