//
//  XRQRequestClient.m
//  ProgressManage
//
//  Created by lingnet on 2017/5/3.
//  Copyright © 2017年 xurenqinag. All rights reserved.
//

#import "XRQRequestClient.h"

@implementation XRQRequestClient
+(void)postWithURLString:(NSString *)urlString params:(NSDictionary *)params  WithSuccess:(HttpSuccessBlock)success WithFailure:(HttpFailureBlock)failure{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    
//    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"text/html",nil];
//    manager.requestSerializer.timeoutInterval = 30;
//
//    [manager POST:urlString parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        NSLog(@"请求结果:%@",responseObject);
//        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            if ([responseObject[@"statusCode"] isEqualToString:@"200"]) {
//                !success?:success(responseObject);
//            }else{
//                NSString *errorDomainValue = @"RequestError";
//                NSError *error = [NSError errorWithDomain:errorDomainValue code:[responseObject[@"statusCode"]intValue] userInfo:@{NSURLErrorFailingURLStringErrorKey:[MyController returnStr:responseObject[@"msg"]]}];
//                !failure?:failure(error);
//            }
//
//        }
//        else{
//            NSString *errorDomainValue = @"RequestError";
//            NSError *error = [NSError errorWithDomain:errorDomainValue code:-999 userInfo:@{NSURLErrorFailingURLStringErrorKey:@"返回的数据不是json"}];
//            !failure?:failure(error);
//        }
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        !failure?:failure(error);
//    }];
}

+(void)postWithOldURLString:(NSString *)urlString params:(NSDictionary *)params  WithSuccess:(HttpSuccessBlock)success WithFailure:(HttpFailureBlock)failure{    
    [PPNetworkHelper POST:urlString parameters:params success:^(id responseObject) {
        if (1 == [responseObject[@"code"] intValue]) {
            !success?:success(responseObject);
        }else if (0 == [responseObject[@"code"] intValue]){
            [HUD error:@"请求出错"];
        }else if (11 == [responseObject[@"code"] intValue]){
            [HUD error:@"没有更多数据"];
        }else if (2 == [responseObject[@"code"] intValue]){
            [HUD error:@"已在另一处登录"];
        }else if (3 == [responseObject[@"code"] intValue]){
            [HUD error:@"登录超时"];
        }
    } failure:^(NSError *error) {
        [HUD warning:@"请检查网络连接"];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        !failure?:failure(error);
        
    }];
}

+(void)getWithURLString:(NSString *)urlString params:(NSDictionary *)params WithSuccess:(HttpSuccessBlock)success WithFailure:(HttpFailureBlock)failure{
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"text/html",nil];
//    mgr.requestSerializer.timeoutInterval = 30;
//
//    [mgr GET:urlString parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        NSLog(@"请求结果:%@",responseObject);
//        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            if ([responseObject[@"statusCode"] isEqualToString:@"200"]) {
//                !success?:success(responseObject);
//            }else{
//                NSString *errorDomainValue = @"RequestError";
//                NSError *error = [NSError errorWithDomain:errorDomainValue code:[responseObject[@"statusCode"]intValue] userInfo:@{NSURLErrorFailingURLStringErrorKey:[MyController returnStr:responseObject[@"msg"]]}];
//                !failure?:failure(error);
//            }
//
//        }
//        else{
//            NSString *errorDomainValue = @"RequestError";
//            NSError *error = [NSError errorWithDomain:errorDomainValue code:-999 userInfo:@{NSURLErrorFailingURLStringErrorKey:@"返回的数据不是json"}];
//            !failure?:failure(error);
//        }
//
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        !failure?:failure(error);
//    }];
    
}

@end
