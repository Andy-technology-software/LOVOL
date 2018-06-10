//
//  AppDelegate+MapService.m
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "AppDelegate+MapService.h"

@implementation AppDelegate (MapService)

- (void)initMapService {
    [AMapServices sharedServices].apiKey = MAPKEY;
}
@end
