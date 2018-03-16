//
//  NSArray+NSArray_YUEJIE.m
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/3/5.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "NSArray+NSArray_YUEJIE.h"
#import <objc/runtime.h>
static void *strKey = &strKey;
static void *numKey = &numKey;
@implementation NSArray (NSArray_YUEJIE)

//利用静态变量地址唯一不变的特性
//1、static void *strKey = &strKey;
//
//2、static NSString *strKey = @"strKey";
//
//3、static char strKey;
//给test属性提供getter 和setter方法
- (void)setTest:(NSString *)test {
    objc_setAssociatedObject(self, strKey, test, OBJC_ASSOCIATION_COPY);
}

//get方法
- (NSString *)test {
     return objc_getAssociatedObject(self, &strKey);
}

//num Setter方法
- (void)setTestnum:(NSInteger)Testnum {
 
    NSNumber *num=[NSNumber numberWithInteger:Testnum];
    objc_setAssociatedObject(self, numKey, num, OBJC_ASSOCIATION_COPY);
}
//getter方法
- (NSInteger)Testnum {
    return [objc_getAssociatedObject(self, &numKey)  integerValue];
}

- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}
@end
