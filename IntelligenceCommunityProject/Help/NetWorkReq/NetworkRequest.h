//
//  NetworkRequest.h
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/2/7.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlock)(NSString *json); //请求成功
typedef void (^failureBlock)(NSString *json, NSString *error); //请求失败
@interface NetworkRequest : NSObject

/**
 *  单例
 */
+ (NetworkRequest *)shareNetWord;

/**
 *
 *
 *  @param params  参数
 *  @param service 服务名
 *  @param suc     成功回调
 *  @param fai     失败回调
 */
- (void)requstParams:(NSDictionary *)params requestSuccess:(successBlock)suc requestFailure:(failureBlock)fai;
//- (void)requstNewVersionParams:(NSDictionary *)params requestSuccess:(successBlock)suc requestFailure:(failureBlock)fai;
//
//- (void)requstDataWithH5:(NSDictionary *)params requestSuccess:(successBlock)suc requestFailure:(failureBlock)fai;
- (void)GETrequstParams:(NSDictionary *)params requestSuccess:(successBlock)suc requestFailure:(failureBlock)fai;

@end
