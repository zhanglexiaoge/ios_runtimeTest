//
//  NetworkRequest.m
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/2/7.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest
+ (NetworkRequest *)shareNetWord {
    static NetworkRequest * request = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!request) {
            request = [[NetworkRequest alloc] init];
        }
    });
    return request;
}

//http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=218.4.255.255
- (void)requstParams:(NSDictionary *)params requestSuccess:(successBlock)suc requestFailure:(failureBlock)fai   {
    
    AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
    //    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    //添加请求头
   // [manager.requestSerializer setValue:tokenStr forHTTPHeaderField:@"token"];
   // [parameters addEntriesFromDictionary:[SSTool appInfo]]; //添加APP信息
    
    NSString *url =[NSString stringWithFormat:@"https://api.weibo.com/oauth2/access_token"];
    
    // 拼接请求参数
         NSMutableDictionary *testparams = [NSMutableDictionary dictionary];
         testparams[@"client_id"] = @"2331570398";
        testparams[@"client_secret"] = @"240608336b729e27685af0ec496c1a60";
         testparams[@"grant_type"] = @"authorization_code";
        testparams[@"redirect_uri"] = @"http://";
        // testparams[@"code"] = code;
    
    
    [manager POST:url parameters:testparams progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSString *json          = (NSString *)responseObject;
        //需要判断是否登录成功
          suc(json);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"----%@",error);
    }];
    
   
    
}
- (void)GETrequstParams:(NSDictionary *)params requestSuccess:(successBlock)suc requestFailure:(failureBlock)fai{
    
    AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
    //    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // [parameters addEntriesFromDictionary:[SSTool appInfo]]; //添加APP信息
    // NSString *url                   = [NSString stringWithFormat:@"%@", baseUrl];
    //@{@"service":@"topic.channel.get",@"id":[NSString stringWithFormat:@"%@",model.channelId]}
    
    //    NSString *url = [NSString stringWithFormat:@"http://douban.fm/j/mine/playlist?type=0&sid=0&pt=0.000000&channel=0&from=mainsite"];
    
    NSString *url =[NSString stringWithFormat:@"http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=218.4.255.255"];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *json          = (NSString *)responseObject;
        //        //需要判断是否登录成功
        suc(json);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----%@",error);
    }];
    
    
}


@end
