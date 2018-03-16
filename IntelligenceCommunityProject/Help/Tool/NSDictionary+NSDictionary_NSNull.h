//
//  NSDictionary+NSDictionary_NSNull.h
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/3/5.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import <Foundation/Foundation.h>
//将NSDictionary中的Null类型的项目转化成@""
@interface NSDictionary (NSDictionary_NSNull)
+(NSDictionary *)nullDic:(NSDictionary *)myDic;
@end
