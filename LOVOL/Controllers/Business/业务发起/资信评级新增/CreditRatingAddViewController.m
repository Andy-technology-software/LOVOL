//
//  CreditRatingAddViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/25.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "CreditRatingAddViewController.h"

#import "ZXAgriculturalMachineryViewController.h"//农业机械

#import "ZXConstructionMachineryViewController.h"//工程机械
@interface CreditRatingAddViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@end

@implementation CreditRatingAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    
    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"农业机械", @"工程机械"]];
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
    [self.segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, viewWidth, [MyController getScreenHeight] - [MyController isIOS7] - 40 - 40)];
    self.scrollView.backgroundColor = [MyController colorWithHexString:CLineColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(viewWidth * 2, [MyController getScreenHeight] - [MyController isIOS7] - 0 - 40 - 40);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 40, viewWidth, [MyController getScreenHeight] - [MyController isIOS7] - 40 - 40) animated:NO];
    [self.view addSubview:self.scrollView];
    
    [self createSliderView];
    
//    UIView* linV1 = [MyController viewWithFrame:CGRectMake(0, 40 - 2, [MyController getScreenWidth], 2)];
//    linV1.backgroundColor = [MyController colorWithHexString:CLineColor];
//    [self.view addSubview:linV1];
}

#pragma mark - 创建滑动
- (void)createSliderView{
    ZXAgriculturalMachineryViewController* agvc = [[ZXAgriculturalMachineryViewController alloc] init];
    agvc.view.frame = CGRectMake([MyController getScreenWidth] * 0, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 40);
    [self addChildViewController:agvc];
    [self.scrollView addSubview:agvc.view];
    
    ZXConstructionMachineryViewController* convc = [[ZXConstructionMachineryViewController alloc] init];
    convc.view.frame = CGRectMake([MyController getScreenWidth] * 1, 0, [MyController getScreenWidth], [MyController getScreenHeight] - [MyController isIOS7] - 40 - 40);
    [self addChildViewController:convc];
    [self.scrollView addSubview:convc.view];
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
