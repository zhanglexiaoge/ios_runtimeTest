//
//  CustomTabBarViewController.m
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/2/7.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "BaseCustomTabBar.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "CustomNavViewController.h"
@interface CustomTabBarViewController ()<BaseCustomTabBarDelegate>

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}
-(void)setupUI{
    [self setupVC];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    //kvo形式添加自定义的 UITabBar  //添加不规则的tabbar时
//    BaseCustomTabBar*tab = [BaseCustomTabBar instanceCustomTabBarWithType:SamItemUIType_Five];
//    tab.centerBtnTitle = @"发布";
//    tab.centerBtnIcon = @"摄影机图标_点击后";
//    tab.tabDelegate = self;
//    [self setValue:tab forKey:@"tabBar"];
    
    
    //去除顶部很丑的border
//    [[UITabBar appearance] setShadowImage:[UIImage new]];
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    
    //改变tabbar 线条颜色
    CGRect rect = CGRectMake(0, 0, SCREENWIDTH, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextSetFillColorWithColor(context, [UIColor hexStringToColor:@"#f5f5f5"].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    　[self.tabBar setShadowImage:img];
    
    　[self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    
    
    //改变TabBar背景颜色
    UIView *view =[[UIView alloc]init];
    //view.backgroundColor =[UIColor hexStringToColor:@"#f8f8f8"];
    view.frame = self.tabBar.bounds;
    [[UITabBar appearance] insertSubview:view atIndex:0];
    self.tabBar.translucent = NO;
    
    
//    //自定义分割线颜色
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(self.tabBar.bounds.origin.x-0.5, self.tabBar.bounds.origin.y, self.tabBar.bounds.size.width+1, self.tabBar.bounds.size.height+2)];
//    bgView.layer.borderColor = [UIColor hexStringToColor:@"#f5f5f5"].CGColor;
//    bgView.layer.borderWidth = 0.5;
//    [tab insertSubview:bgView atIndex:0];
//    tab.opaque = YES;
}

- (void)setupVC{
    [self addChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"home" selectedImage:@"home2"];
    [self addChildVc:[[HomeViewController alloc] init] title:@"机构" image:@"jigou" selectedImage:@"jigou2"];
    [self addChildVc:[[MineViewController alloc] init] title:@"消息" image:@"news" selectedImage:@"news2"];
    [self addChildVc:[[MineViewController alloc] init] title:@"个人中心" image:@"my" selectedImage:@"my2"];
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    // 为子控制器包装导航控制器
 //   WBBaseNC *navigationVc = [[WBBaseNC alloc] initWithRootViewController:childVc];
    
   CustomNavViewController *navigationVc = [[CustomNavViewController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
    //自定义导航条
}

-(void)tabBar:(BaseCustomTabBar *)tabBar clickCenterButton:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了中间按钮" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
