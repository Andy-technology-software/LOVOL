//
//  ZXContractSignViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/6/4.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "ZXContractSignViewController.h"

#import "LivenessViewController.h"
#import "LivingConfigModel.h"
#import "IDLFaceSDK/IDLFaceSDK.h"
#import "FaceParameterConfig.h"
@interface ZXContractSignViewController ()

@end

@implementation ZXContractSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton* startB = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(startBClick) Title:@"开始面签"];
    [startB setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    startB.titleLabel.font = [UIFont systemFontOfSize:CFontSize1];
    [self.view addSubview:startB];
    
    [startB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KNormalSpace);
        make.right.mas_equalTo(-KNormalSpace);
        make.top.mas_equalTo(100);
        make.height.mas_offset(50);
    }];
    
    
}

- (void)startBClick {
    if ([[FaceSDKManager sharedInstance] canWork]) {
        NSString* licensePath = [[NSBundle mainBundle] pathForResource:FACE_LICENSE_NAME ofType:FACE_LICENSE_SUFFIX];
        [[FaceSDKManager sharedInstance] setLicenseID:FACE_LICENSE_ID andLocalLicenceFile:licensePath];
    }
    LivenessViewController* lvc = [[LivenessViewController alloc] init];
    LivingConfigModel* model = [LivingConfigModel sharedInstance];
    [lvc livenesswithList:model.liveActionArray order:model.isByOrder numberOfLiveness:model.numOfLiveness];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:lvc];
    navi.navigationBarHidden = true;
    [self presentViewController:navi animated:YES completion:nil];
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
