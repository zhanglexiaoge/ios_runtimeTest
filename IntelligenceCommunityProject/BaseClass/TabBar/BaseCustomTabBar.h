//
//  BaseCustomTabBar.h
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/2/7.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import <UIKit/UIKit.h>
//tab页面个数
typedef NS_ENUM(NSInteger, SamItemUIType) {
    SamItemUIType_Two = 2,//底部2个选项
    SamItemUIType_Three = 3,//底部3个选项
    SamItemUIType_Five = 5,//底部5个选项
};

@class BaseCustomTabBar;
@protocol BaseCustomTabBarDelegate <NSObject>

-(void)tabBar:(BaseCustomTabBar *)tabBar clickCenterButton:(UIButton *)sender;

@end
@interface BaseCustomTabBar : UITabBar
@property (nonatomic, weak) id<BaseCustomTabBarDelegate> tabDelegate;

@property (nonatomic, strong) NSString *centerBtnTitle;  //tabbar文字
@property (nonatomic, strong) NSString *centerBtnIcon;   //tabbar图片名字

+(instancetype)instanceCustomTabBarWithType:(SamItemUIType)type;

@end
