//
//  UIImage+UIImage_Placeholder.m
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/3/5.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "UIImage+UIImage_Placeholder.h"
#import <objc/runtime.h>
@implementation UIImage (UIImage_Placeholder)
///** 没有测试成功
// 给imageNamed方法提供功能，每次加载图片就判断下图片是否加载成功。
// */
//
//
//+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//       Class class =[self class];
//        
//        
//        SEL originalSelector = @selector(imageNamed:);
//         SEL swizzledSelector = @selector(myTestimageNamed:);
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzleMethod = class_getInstanceMethod(class, swizzledSelector);
//        //实现方法的交换
//         method_exchangeImplementations(originalMethod, swizzleMethod);
//       
//        
////        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
////        if (didAddMethod) {
////            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
////        }else{
////            method_exchangeImplementations(originalMethod, swizzleMethod);
////        }
//        
//     
//        
//    });
//}
//
//// 不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super.
//// 既能加载图片又能打印
//- (UIImage *)myTestimageNamed:(NSString *)name {
//    NSLog(@"viewWillAppear: %@", self);
//    
//    if (name == nil || name.length == 0) {
//       // = @"输入的字符串为空哦！！";
//        NSLog(@"加载失败");
//    }
//    
//    return [self myTestimageNamed:name];
//    
////    UIImage *image =[UIImage myTestimageNamed:name];
////    if (image) {
////        NSLog(@"加载成功");
////    } else {
////        NSLog(@"加载失败");
////    }
////    
////    return image;
//}

@end
