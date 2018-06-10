//
//  requestService.h
//  WhereAreYou
//
//  Created by lingnet on 2017/7/5.
//  Copyright © 2017年 徐仁强. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XRQRequestClient.h"
@interface requestService : NSObject

/**
 1.1.1 首页
 
 @param reqParam 某请求参数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postHomepageWithReqParam:(NSString*)reqParam complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.2.1 城市记忆
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param year 年份
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postCityMemoryWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize year:(NSString*)year complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.3.1 非遗类型
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFYLXWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.3.2 非遗级别
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFYJBWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.3.3 非遗传承列表
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param levelId 级别id
 @param typeId 类型id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFYCHListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize levelId:(NSString*)levelId typeId:(NSString*)typeId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.3.4 非遗详情
 
 @param _id 非遗id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFYDetailWithFYid:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.4.1 书籍分类
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postBookCategoryWithFYid:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.4.2 书籍列表
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param search 搜索关键字
 @param categoryId 分类id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postBookListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize search:(NSString*)search categoryId:(NSString*)categoryId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.4.3 书籍详情
 
 @param _id 书籍id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postBookDetailWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.5.1 数字资源
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postDigitalResourceWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.6.1 分类
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postNewsCategoryWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.6.2 资讯列表
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param categoryId 分类id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postNewsListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize categoryId:(NSString*)categoryId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.7.1 风光列表
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param categoryId 分类id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFengGuangListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize categoryId:(NSString*)categoryId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.7.2 风光类型
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postScenmeCategoryWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 1.7.3 风光详情
 
 @param _id 风光id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFGDetailWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 2.1.1 文化类型
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postCultureTypeWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 2.1.2 文化阶段 == 没有该功能
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postCultureStageWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 2.1.3 文化活动列表
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param categoryId 分类id
 @param stageId 阶段id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postCultureActivityListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize categoryId:(NSString*)categoryId stageId:(NSString*)stageId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 2.2.1 场馆分类
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postVenueCategoryWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 2.2.2 场馆地图
 
 @param search 分类
 @param categoryId 分类id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postVenueMapWithSearch:(NSString*)search categoryId:(NSString*)categoryId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 2.3.1 活动列表==数据库中没有状态字段
 
 @param date 日期
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postActivityListWithDate:(NSString*)date complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 2.4.1 文化饮食列表
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postCultureFoodListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 3.1.1 场馆分类
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postZHVenueCategoryWithId:(NSString*)_id pageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 3.1.2 智慧场馆列表
 
 @param categoryId 类别id
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postZHVenueListWithCategoryId:(NSString*)categoryId pageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 3.2.1 数字博物馆列表
 
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postMuseumListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 3.2.2 博物馆详情
 
 @param _id 博物馆id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postMuseumDetailWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 3.2.3 博物馆藏品
 
 @param categoryId 类别id
 @param _id 博物馆id
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postCollectionListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize categoryId:(NSString*)categoryId _id:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 3.2.4 藏品分类
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postCollectionCategoryWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 4.1.1 我的课程
 
 @param userId 用户id
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postMyClassListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize userId:(NSString*)userId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 4.2.1 我的收藏
 
 @param userId 用户id
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postMyFavourListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize userId:(NSString*)userId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 4.3.1 我的书架
 
 @param userId 用户id
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postMyBooklistWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize userId:(NSString*)userId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 4.4.1 密码修改
 
 @param password 新密码
 @param vcode 验证码
 @param account 手机号
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postPasswordModifyWithPassword:(NSString*)password vcode:(NSString*)vcode account:(NSString*)account complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 4.4.2 短信验证码==没有短信接口
 
 @param account 手机号
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postGetVcodeWithAccount:(NSString*)account complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 4.5.1 登陆
 
 @param password 密码
 @param userName 手机号
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postLoginWithPassword:(NSString*)password userName:(NSString*)userName complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 4.6.1 我的借阅
 
 @param userId 用户id
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postMyBorrowListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize userId:(NSString*)userId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 4.7.1 消息列表
 
 @param userId 用户id
 @param pageIndex 页码
 @param pageSize 每页条数
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postMessageListWithPageIndex:(NSString*)pageIndex pageSize:(NSString*)pageSize userId:(NSString*)userId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;



@end
