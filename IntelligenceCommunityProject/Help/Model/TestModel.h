//
//  TestModel.h
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/3/13.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import <Foundation/Foundation.h>
//runtime 字典转模型测试用model
@interface TestModel : NSObject
@property (nonatomic, copy) NSString *girl0;
@property (nonatomic, copy) NSString *girl1;
@property (nonatomic, copy) NSString *girl2;
@property (nonatomic, copy) NSString *girl3;
@property (nonatomic, copy) NSString *girl4;
@property (nonatomic, copy) NSString *girl5;
@property (nonatomic, copy) NSString *girl6;
@property (nonatomic, copy) NSString *girl7;
@property (nonatomic, copy) NSString *girl8;
@property (nonatomic, copy) NSString *girl9;
@property (nonatomic, copy) NSString *girl10;
@property (nonatomic, copy)NSString *test1;

+ (instancetype)ls_modelWithDictionary: (NSDictionary *) data;
@end
