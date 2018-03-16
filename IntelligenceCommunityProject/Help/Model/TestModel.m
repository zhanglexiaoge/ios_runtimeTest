//
//  TestModel.m
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/3/13.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

////.要想遍历Model类的属性，首先得通过Runtime来获取该Model类有哪些属性，输出Model的所有属性的值可不像遍历Dictionary和Array那样一个for循环搞定的，下面的方法是通过Runtime来获取Model类的属性字符串，并以数组的形式返回
/////通过运行时获取当前对象的所有属性的名称，以数组的形式返回
//
////2.获取到Model类的属性方法后需要把属性字符串生成get方法，我们可以执行get方法来获取Model属性的值，下方的方法是根据属性字符串来获取属性的getter方法，OC中属性的getter方法的名字和属性的名字是一致的，生成getter方法比较简单
//#pragma mark -- 通过字符串来创建该字符串的Setter方法，并返回
//- (SEL) ls_creatGetterWithPropertyName: (NSString *) propertyName{
//
//    //1.返回get方法: oc中的get方法就是属性的本身
//    return NSSelectorFromString(propertyName);
//}
////接下来要做的是通过Runtime来执行Getter方法，这一块需要通过方法的签名来执行Getter方法。在OC的运行时中要执行的方法需要传入参数或者需要接收返回值时，需要通过方法的签名来调用方法。下面的代码就是创建方法的签名，然后通过签名来获取调用的对象，在下边的方中回调用上述两个方法在通过方法的签名来获取Model属性的值，
/////通过运行时获取当前对象的所有属性的名称，以数组的形式返回
//const char *propertiesKey = "propertiesKey";
//- (NSArray *) ls_allPropertyNames{
//    //参数一 关联到对象
//    //参数二 关联的属性key
//    //在oc 中 类的本质就是一个对象 将属性列表缓存
//    NSArray *plist = objc_getAssociatedObject(self, propertiesKey);
//    if(plist != nil)
//    {
//        return plist;
//    }
//
//
//    ///存储所有的属性名称
//    NSMutableArray *allNames = [[NSMutableArray alloc] init];
//
//    ///存储属性的个数
//    unsigned int propertyCount = 0;
//
//    ///通过运行时获取当前类的属性
//    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
//
//    //把属性放到数组中
//    for (int i = 0; i < propertyCount; i ++) {
//        ///取出第一个属性
//        objc_property_t property = propertys[i];
//
//        const char * propertyName = property_getName(property);
//
//        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
//    }
//
//    ///释放
//    free(propertys);
//    //5 设置关联对象
//    //参数1>关联的对象
//    //参数2>关联对象的key
//    //参数3>属性数值
//    //属性的持有方式 retain copy assign
//    objc_setAssociatedObject(self, propertiesKey, allNames, OBJC_ASSOCIATION_COPY_NONATOMIC);
//
//    NSLog(@"%@",allNames);
//    return allNames;
//}
//




//.根据Key值生成set方法
//
//首先要编写的方法是传入一个字符串，然后返回该字符串所对应属性的setter方法。这个方法其实很简单的，就是把对应的字符串的首字母大写并且拼接上set关键字，再生产SEL并返回，该方法的具体实现如下

#pragma mark -- 通过字符串来创建该字符串的Setter方法，并返回
- (SEL) creatSetterWithPropertyName: (NSString *) propertyName{

    //1.首字母大写
    propertyName = propertyName.capitalizedString;

    //2.拼接上set关键字
    propertyName = [NSString stringWithFormat:@"set%@:", propertyName];

    //3.返回set方法
    return NSSelectorFromString(propertyName);
}
//2.把字典传入到方法中，并把字典的值赋给相应实体类的属性，该方法需要调用上述方法来生成setter方法，通过setter方法把字典的Value赋值给实体类对应的属性，
/************************************************************************
 *把字典赋值给当前实体类的属性
 *参数：字典
 *适用情况：当网络请求的数据的key与实体类的属性相同时可以通过此方法吧字典的Value
 *        赋值给实体类的属性
 ************************************************************************/

-(void) assginToPropertyWithDictionary: (NSDictionary *) data{

    if (data == nil) {
        return;
    }

    ///1.获取字典的key
    NSArray *dicKey = [data allKeys];

    ///2.循环遍历字典key, 并且动态生成实体类的setter方法，把字典的Value通过setter方法
    ///赋值给实体类的属性
    for (int i = 0; i < dicKey.count; i ++) {

        ///2.1 通过getSetterSelWithAttibuteName 方法来获取实体类的set方法
        SEL setSel = [self creatSetterWithPropertyName:dicKey[i]];

        if ([self respondsToSelector:setSel]) {
            ///2.2 获取字典中key对应的value
            NSString  *value = [NSString stringWithFormat:@"%@", data[dicKey[i]]];

            ///2.3 把值通过setter方法赋值给实体类的属性
            [self performSelectorOnMainThread:setSel
                                   withObject:value
                                waitUntilDone:[NSThread isMainThread]];
        }

    }

}

- (instancetype)initWithDictionary: (NSDictionary *) data{
    {
        self = [super init];
        if (self) {
            [self assginToPropertyWithDictionary:data];
        }
        return self;
    }
}

+ (instancetype)ls_modelWithDictionary: (NSDictionary *) data{

    return [[self alloc] initWithDictionary:data];

}


@end
