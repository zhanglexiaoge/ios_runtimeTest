//
//  NSArray+NSArray_YUEJIE.h
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/3/5.
//  Copyright © 2018年 zhangle. All rights reserved.
//
//判断数组越界  + 给分类添加额外属性
#import <Foundation/Foundation.h>

@interface NSArray (NSArray_YUEJIE)

@property (nonatomic, copy)NSString *test; //给分类添加的属性

@property (nonatomic, assign)NSInteger Testnum;
- (id)objectAtIndexCheck:(NSUInteger)index;


@end
