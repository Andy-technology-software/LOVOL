//
//  PostSignViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/5/15.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "PostSignViewController.h"

#import "PostSign0Model.h"

#import "FormsCommonCellModel.h"

#import "PostSign2Model.h"

#import "PostSign0TableViewCell.h"

#import "FormsSelectedTableViewCell.h"

#import "FromsFillTableViewCell.h"

#import "PostSign2TableViewCell.h"
@interface PostSignViewController ()<UITableViewDelegate,UITableViewDataSource,FromsFillTableViewCellDelegate,UIAlertViewDelegate,PostSign2TableViewCellDelegate,MWPhotoBrowserDelegate>
@property(nonatomic,strong)NSArray* typeArr;
@property(nonatomic,strong)NSMutableArray* dataArr0;
@property(nonatomic,strong)NSMutableArray* dataArr1;
@property(nonatomic,strong)NSMutableArray* dataArr2;
@property(nonatomic,strong)NSMutableArray* dataSourceBase64Arr;
@property(nonatomic,strong)AMapLocationManager* locationManager;

@property (strong, nonatomic) UINavigationController *photoNavigationController;
@property (strong, nonatomic) MWPhotoBrowser *photoBrowser;
@property (strong, nonatomic) UIWindow *keyWindow;
@property(nonatomic,retain)NSMutableArray* photos;

@end

@implementation PostSignViewController

- (void)sendBackFormsFillValue:(NSInteger)rowIndex AndSectionIndex:(NSInteger)sectionIndex AndContent:(NSString *)content {
    FormsCommonCellModel* model = self.dataArr1[rowIndex];
    model._rightContent = content;
}

- (void)viewWillAppear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArr0 = [[NSMutableArray alloc] init];
    self.dataArr1 = [[NSMutableArray alloc] init];
    self.dataArr2 = [[NSMutableArray alloc] init];
    //1是填的   2是选的  3是显示的
    self.typeArr = [[NSArray alloc] initWithObjects:@"1",@"2", nil];
    
    [self initUI];
    [self makeSaveBtn];
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
    [formatter setDateFormat:@"YYYY年MM月dd日 HH:mm"];
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
        
        PostSign0Model* model = [[PostSign0Model alloc] init];
        model._cuurrentAdd = regeocode.POIName;
        model._cuurrentDesAdd = [NSString stringWithFormat:@"当前位置：%@",regeocode.formattedAddress];
        model._lat = [NSString stringWithFormat:@"%f",location.coordinate.latitude];
        model._lng = [NSString stringWithFormat:@"%f",location.coordinate.longitude];
        model._cuurrentTime = [self getCurrentDay1];
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
    NSArray* leftArr = [[NSArray alloc] initWithObjects:@"拜访对象",@"厂端任务", nil];
    NSArray* placeArr = [[NSArray alloc] initWithObjects:@"请输入拜访客户",@"请选择关联任务", nil];
    for (int i = 0; i < leftArr.count; i++) {
        FormsCommonCellModel* model = [[FormsCommonCellModel alloc] init];
        model._leftTitle = leftArr[i];
        model._placeholder = placeArr[i];
        [self.dataArr1 addObject:model];
    }
    [HUD hide];
    
    self.dataArr2 = [[NSMutableArray alloc] init];
    PostSign2Model* model2 = [[PostSign2Model alloc] init];
    model2.imageArr = [[NSMutableArray alloc] init];
    [self.dataArr2 addObject:model2];
    
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
    return self.dataArr2.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        PostSign0Model *model = nil;
        if (indexPath.row < self.dataArr0.count) {
            model = [self.dataArr0 objectAtIndex:indexPath.row];
        }
        
        return [PostSign0TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            PostSign0TableViewCell *cell = (PostSign0TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
        
    }else if (1 == indexPath.section) {
        FormsCommonCellModel *model = nil;
        if (indexPath.row < self.dataArr1.count) {
            model = [self.dataArr1 objectAtIndex:indexPath.row];
        }
        
        return [FormsSelectedTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            FormsSelectedTableViewCell *cell = (FormsSelectedTableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    
    PostSign2Model *model = nil;
    if (indexPath.row < self.dataArr2.count) {
        model = [self.dataArr2 objectAtIndex:indexPath.row];
    }
    
    return [PostSign2TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        PostSign2TableViewCell *cell = (PostSign2TableViewCell *)sourceCell;
        [cell configCellWithModel:model];
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        PostSign0TableViewCell* cell0 = [[PostSign0TableViewCell alloc] init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell0.FromsFillTableViewCellDelegate = self;
        PostSign0Model* model = self.dataArr0[indexPath.row];
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (1 == indexPath.section) {
        if (1 == [self.typeArr[indexPath.row] integerValue]) {//填的
            FromsFillTableViewCell* cell0 = [[FromsFillTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            cell0.FromsFillTableViewCellDelegate = self;
            cell0.rowIndex = indexPath.row;
            cell0.sectionIndex = indexPath.section;
            FormsCommonCellModel* model = self.dataArr1[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }else if (2 == [self.typeArr[indexPath.row] integerValue]) {//选的
            FormsSelectedTableViewCell* cell0 = [[FormsSelectedTableViewCell alloc] init];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
            FormsCommonCellModel* model = self.dataArr1[indexPath.row];
            [cell0 configCellWithModel:model];
            return cell0;
        }
        return nil;
    }
    PostSign2TableViewCell *celll = [[PostSign2TableViewCell alloc] init];
    celll.selectionStyle = UITableViewCellSelectionStyleNone;
    PostSign2Model* model = self.dataArr2[indexPath.row];
    celll.PostSign2TableViewCellDelegate = self;
    [celll configCellWithModel:model];
    return celll;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (1 == indexPath.section) {
        if (1 == indexPath.row) {
            DLog(@"选择关联任务");
        }
    }
}

- (void)makeSaveBtn {
    UIButton* saveBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(saveBtnClick) Title:@"签到"];
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

/**
 保存按钮响应
 */
- (void)saveBtnClick {
    DLog(@"签到");
    [self locationErrorCorrectionlocation];
}

#pragma mark - 位置纠错 防止打开后未关闭  去另一个地方继续签到
- (void)locationErrorCorrectionlocation{
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
        
        PostSign0Model* model0 = [self.dataArr0 lastObject];
        //增加距离判断
        MAMapPoint point1 = MAMapPointForCoordinate(CLLocationCoordinate2DMake([model0._lat floatValue],[model0._lng floatValue]));
        MAMapPoint point2 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude));
        CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
        [HUD hide];
        if (distance > 1000) {
            UIAlertView* al = [[UIAlertView alloc] initWithTitle:@"提示" message:@"因当前位置发生变化，系统已重新为您定位。" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [al show];
            
            PostSign0Model* model0 = [self.dataArr0 lastObject];
            model0._cuurrentAdd = regeocode.POIName;
            model0._cuurrentDesAdd = [NSString stringWithFormat:@"当前位置：%@",regeocode.formattedAddress];
            model0._lat = [NSString stringWithFormat:@"%f",location.coordinate.latitude];
            model0._lng = [NSString stringWithFormat:@"%f",location.coordinate.longitude];
            model0._cuurrentTime = [self getCurrentDay1];
            [HUD hide];
            [self.tableView reloadSections:[[NSIndexSet alloc]initWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
            if (regeocode){
                NSLog(@"reGeocode:%@", regeocode);
            }
        }else{
            DLog(@"可正常签到");
            NSString* _img = @"";
            if (self.dataSourceBase64Arr.count) {
                for (int i = 0; i < self.dataSourceBase64Arr.count; i++) {
                    _img = [NSString stringWithFormat:@"%@,",self.dataSourceBase64Arr[i]];
                }
                _img = [_img substringToIndex:_img.length - 1];
            }
        }
        
    }];
}

- (void)sendBackDeleImage:(NSInteger)index{
    PostSign2Model* model = [self.dataArr2 lastObject];
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
    PostSign2Model* model = [self.dataArr2 lastObject];
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

