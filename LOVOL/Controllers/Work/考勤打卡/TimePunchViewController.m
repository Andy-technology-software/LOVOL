//
//  TimePunchViewController.m
//  LOVOL
//
//  Created by 徐仁强 on 2018/5/31.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "TimePunchViewController.h"

#import "TimePunch0Model.h"

#import "PostSign2Model.h"

#import "TimePunch0TableViewCell.h"

#import "PostSign2TableViewCell.h"
@interface TimePunchViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,PostSign2TableViewCellDelegate,MWPhotoBrowserDelegate>
@property(nonatomic,strong)NSMutableArray* dataArr0;
@property(nonatomic,strong)NSMutableArray* dataArr1;
@property(nonatomic,strong)NSMutableArray* dataSourceBase64Arr;
@property(nonatomic,strong)AMapLocationManager* locationManager;

@property (strong, nonatomic) UINavigationController *photoNavigationController;
@property (strong, nonatomic) MWPhotoBrowser *photoBrowser;
@property (strong, nonatomic) UIWindow *keyWindow;
@property(nonatomic,retain)NSMutableArray* photos;

@end

@implementation TimePunchViewController

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArr0 = [[NSMutableArray alloc] init];
    self.dataArr1 = [[NSMutableArray alloc] init];
    
    [self initUI];
    [HUD loading];
    [self loadteDK];
}

/**
 获取当前时间
 
 @return 返回时间
 */
- (NSString*)getCurrentDay1 {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}

- (void)loadteDK{
    [HUD loading];
    self.locationManager = [[AMapLocationManager alloc] init];
    // 带逆地理信息的一次定位（返回坐标和地址信息）
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    // 定位超时时间，最低2s，此处设置为2s
    self.locationManager.locationTimeout =2;
    // 逆地理请求超时时间，最低2s，此处设置为2s
    self.locationManager.reGeocodeTimeout = 2;
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error){
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            [HUD warning:@"定位失败,请重新尝试"];
            if (error.code == AMapLocationErrorLocateFailed){
                return;
            }
        }
        
        TimePunch0Model* model = [[TimePunch0Model alloc] init];
        model._name = @"张三";;
        model._cuurrentTime = [self getCurrentDay1];
        model._group = @"考勤组：考勤201712";
        model._cuurrentDesAdd = regeocode.POIName;
        model._cuurrentAdd = [NSString stringWithFormat:@"当前位置：%@",regeocode.formattedAddress];
        model._lat = [NSString stringWithFormat:@"%f",location.coordinate.latitude];
        model._lng = [NSString stringWithFormat:@"%f",location.coordinate.longitude];
        [self.dataArr0 addObject:model];
        [self makeData];
        if (regeocode){
            NSLog(@"reGeocode:%@", regeocode);
        }
    }];
}

/**
 数据初始化
 */
- (void)makeData {
    [HUD hide];
    self.dataArr1 = [[NSMutableArray alloc] init];
    PostSign2Model* model2 = [[PostSign2Model alloc] init];
    model2.imageArr = [[NSMutableArray alloc] init];
    [self.dataArr1 addObject:model2];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return self.dataArr0.count;
    }else if (1 == section) {
        return self.dataArr1.count;
    }
    if (self.dataArr0.count && self.dataArr1.count) {
        return 1;
    }
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        TimePunch0Model *model = nil;
        if (indexPath.row < self.dataArr0.count) {
            model = [self.dataArr0 objectAtIndex:indexPath.row];
        }
        
        return [TimePunch0TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            TimePunch0TableViewCell *cell = (TimePunch0TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
        
    }else if (1 == indexPath.section) {
        PostSign2Model *model = nil;
        if (indexPath.row < self.dataArr1.count) {
            model = [self.dataArr1 objectAtIndex:indexPath.row];
        }
        
        return [PostSign2TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            PostSign2TableViewCell *cell = (PostSign2TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    
    return 100;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        TimePunch0TableViewCell* cell0 = [[TimePunch0TableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        //        cell0.FromsFillTableViewCellDelegate = self;
        TimePunch0Model* model = self.dataArr0[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (1 == indexPath.section) {
        PostSign2TableViewCell *celll = [[PostSign2TableViewCell alloc] init];
        celll.selectionStyle = UITableViewCellSelectionStyleNone;
        PostSign2Model* model = self.dataArr1[indexPath.row];
        celll.PostSign2TableViewCellDelegate = self;
        [celll configCellWithModel:model];
        return celll;
    }
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [MyController colorWithHexString:CDefaultColor];
    
    NSArray* titA = [[NSArray alloc] initWithObjects:@"早签",@"午签",@"晚签", nil];
    float bWidth = ([MyController getScreenWidth] - 80) / 3;
    for (int i = 0; i < titA.count; i++) {
        UIButton* temB = [MyController createButtonWithFrame:CGRectMake((bWidth * i) + 20 * (i + 1), 10, bWidth, 40) ImageName:nil Target:self Action:@selector(temBClick:) Title:titA[i]];
        [temB setBackgroundColor:[MyController colorWithHexString:CNavBgColor]];
        [temB setTitleColor:[MyController colorWithHexString:CDefaultColor] forState:UIControlStateNormal];
        temB.titleLabel.font = [UIFont systemFontOfSize:14];
        temB.tag = 100 + i;
        [cell addSubview:temB];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark - 签到按钮响应
- (void)temBClick:(UIButton*)btn {
    if (100 == btn.tag) {
        DLog(@"早签");
    }else if (101 == btn.tag) {
        DLog(@"午签");
    }else if (102 == btn.tag) {
        DLog(@"晚签");
    }
}

- (void)sendBackDeleImage:(NSInteger)index{
    PostSign2Model* model = [self.dataArr1 lastObject];
    [model.imageArr removeObjectAtIndex:index];
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.dataSourceBase64Arr removeObjectAtIndex:index];
}

/**
 查看图片代理回调
 
 @param index 点击了第几张图片
 */
- (void)sendBackSelectImage:(NSInteger)index{
    UIViewController *rootController = [self.keyWindow rootViewController];
    [rootController presentViewController:self.photoNavigationController animated:YES completion:nil];
    [_photoBrowser setCurrentPhotoIndex:index];
    
}

/**
 添加图片代理方法
 */
- (void)sendBackAddImage{
    PostSign2Model* model = [self.dataArr1 lastObject];
    if (!(model.imageArr.count < 1)) {
        [HUD warning:@"最多支持上传1张"];
        return;
    }
    
    /*
     NSData *data = UIImageJPEGRepresentation(image, 0.1f);
     NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
     */
    ZLPhotoActionSheet *ac = [[ZLPhotoActionSheet alloc] init];
    ac.configuration.maxSelectCount = 1 - model.imageArr.count;
    ac.sender = self;
    zl_weakify(self);
    [ac setSelectImageBlock:^(NSArray<UIImage *> * _Nonnull images, NSArray<PHAsset *> * _Nonnull assets, BOOL isOriginal) {
        zl_strongify(weakSelf);
        [model.imageArr addObjectsFromArray:images];
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        
        for (UIImage* img in images) {
            NSData *data = UIImageJPEGRepresentation(img, 0.1f);
            NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            [self.dataSourceBase64Arr addObject:encodedImageStr];
        }
        
        self.photos = [[NSMutableArray alloc] init];
        for (int i = 0; i < model.imageArr.count; i++) {
            [self.photos addObject:[MWPhoto photoWithImage:model.imageArr[i]]];
        }
    }];
    [ac showPreviewAnimated:YES];
    
}

#pragma mark - getter 创建一个显示图片的window
- (UIWindow *)keyWindow{
    if(_keyWindow == nil){
        _keyWindow = [[UIApplication sharedApplication] keyWindow];
    }
    return _keyWindow;
}
#pragma mark - 初始化MWPhotoBrowser
- (MWPhotoBrowser *)photoBrowser{
    if (_photoBrowser == nil) {
        _photoBrowser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        _photoBrowser.displayActionButton = YES;
        _photoBrowser.displayNavArrows = YES;
        _photoBrowser.displaySelectionButtons = NO;
        _photoBrowser.alwaysShowControls = NO;
        _photoBrowser.wantsFullScreenLayout = YES;
        _photoBrowser.zoomPhotosToFill = YES;
        _photoBrowser.enableGrid = NO;
        _photoBrowser.startOnGrid = NO;
    }
    return _photoBrowser;
}

- (UINavigationController *)photoNavigationController{
    if (_photoNavigationController == nil) {
        _photoNavigationController = [[UINavigationController alloc] initWithRootViewController:self.photoBrowser];
        _photoNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    [self.photoBrowser reloadData];
    return _photoNavigationController;
}

#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return [self.photos count];
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    if (index < self.photos.count){
        return [self.photos objectAtIndex:index];
    }
    return nil;
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

