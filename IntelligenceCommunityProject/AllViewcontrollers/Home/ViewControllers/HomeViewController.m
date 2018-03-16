//
//  HomeViewController.m
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/2/7.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "HomeViewController.h"
#import "TestViewController.h"
#import "SDCycleScrollView.h"
#import "NSArray+NSArray_YUEJIE.h"
#import "NSDictionary+NSDictionary_NSNull.h"
#import "NSString+NSString_NSNULL.h"
#import "NSObject+NSObject_Model.h"
#import "TestModel.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong)SDCycleScrollView *bannerview;

@property (nonatomic, strong)UIView *testview;
@end



@implementation HomeViewController
- (void)viewWillAppear:(BOOL)animated {
   //  [self.navigationController setNavigationBarHidden:YES animated:YES];
    //导航条显示
     [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
   //  [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //测试数组是否越界
    NSArray * array =@[@"1",@"2"];
    NSLog(@"---------- %@", [array objectAtIndexCheck:3]);
    array.test= @"tets";//给NSArray 使用runtime添加的属性
    array.Testnum = 18;
    NSLog(@"%@ %ld",array.test,array.Testnum);
    
    NSDictionary *testdic =@{ @"key2":@"",@"key3":@"key3"};

    NSLog(@"+++++++++%@",[NSDictionary nullDic:testdic]);
    
    NSString *testmy = @"";
    NSLog(@"%@",testmy);
      NSLog(@"+++++++++%d",[NSString nullstr:testmy]);
    
    //测试改变全局字体
    UILabel * plabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 450, 280, 30)];
    plabel.text = @"你是从initWithFrame来的label";
    UILabel * label2 = [[UILabel alloc]init];
    label2.frame= CGRectMake(20, 500, 280, 30);
    label2.text = @"你是从init来的label";
    [self.view addSubview:plabel];
    [self.view addSubview:label2];
    
//    UIImageView * imageview= [[UIImageView alloc]initWithFrame:CGRectMake(20, 540, 30, 30)];
//   // imageview.image =[UIImage imageNamed:@"smile"];
//    UIImage *imgaetest =[UIImage imageNamed:@"smile"];;
//    [self.view addSubview:imageview];
    
    // runtime 字典转模型测试
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:11];
    
    //创建测试适用的字典
    for(int i = 0; i <= 10; i ++){
        NSString *key = [NSString stringWithFormat:@"girl%d", i];
        
        NSString *value = [NSString stringWithFormat:@"我是第%d个女孩", i];
        
        [data setObject:value forKey:key];
    }
    
    TestModel *testmodel =[TestModel ls_modelWithDictionary:data];
    NSLog(@"%@",testmodel.test1);
    
    
    
    
    
    self.view.backgroundColor =[UIColor whiteColor];
    CGFloat bannertop = 64.0;
    CGFloat bannerbannerheight = 150;
     if (IS_IPHONE_X) {
          bannertop = 88;
          bannerbannerheight = 175;
     }else {
         bannertop = 64;
         bannerbannerheight = 150;
     }
    self.bannerview =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, bannertop, SCREENWIDTH, bannerbannerheight) delegate:self placeholderImage:[UIImage imageNamed:@"艾特票banner"]];
     _bannerview.imageURLStringsGroup = @[@"https://img.alicdn.com/simba/img/TB1AhFnPVXXXXa.XFXXSutbFXXX.jpg_q50.jpg",@"https://gw.alicdn.com/imgextra/i2/118/TB22AjYg7qvpuFjSZFhXXaOgXXa_!!118-0-yamato.jpg_q50.jpg",@"https://gw.alicdn.com/imgextra/i1/34/TB2Kea5fYVkpuFjSspcXXbSMVXa_!!34-0-yamato.jpg_q50.jpg",@"https://gw.alicdn.com/imgextra/i1/101/TB2Dz1ScYtlpuFjSspoXXbcDpXa_!!101-0-yamato.jpg_q50.jpg"];
    [self.view addSubview:self.bannerview];

    
    self.testview =[UIView new];
    [self.view addSubview:self.testview];
    
    [self.testview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bannerview.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.bannerview.frame.origin.x).mas_offset(0);
        make.width.mas_equalTo(SCREENWIDTH / 2);
        make.height.mas_equalTo(SCREENWIDTH /2);
        
    }];
    self.testview.backgroundColor =[UIColor hexStringToColor:@"#f1f1f1"];
    self.testview.layer.masksToBounds = YES;
    self.testview.layer.cornerRadius = 5.0;
    
    UIImageView *testimageview =[UIImageView new];
    [self.testview addSubview:testimageview];
    [testimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.testview).mas_offset(20);
        make.left.mas_equalTo(self.testview).mas_offset(60);
        make.bottom.mas_equalTo(self.testview).mas_offset(-50);
        make.right.mas_equalTo(self.testview).mas_offset(-60);
       
    }];
    testimageview.image =[UIImage imageNamed:@"我的发票"];
    testimageview.contentMode= UIViewContentModeScaleAspectFit;
    //改变不了这样布局的字体样式
    UILabel *testLabel =[[UILabel alloc] init];
    [self.testview addSubview:testLabel];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(testimageview.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(self.testview).mas_offset(-20);
        make.right.mas_equalTo(self.testview).mas_offset(0);
    }];
    testLabel.text = @"test";
    testLabel.textColor =[UIColor hexStringToColor:@"#999999"];
    testLabel.textAlignment =NSTextAlignmentCenter;
    testLabel.font =[UIFont systemFontOfSize:FONT_SIZE(14)];
    NSLog(@"%d",FONT_SIZE(14));
    
    
    
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    if (IS_IPHONE_X) {
         btn.frame = CGRectMake(0, SCREENHEIGHT -103, 60, 20);
    }else {
         btn.frame = CGRectMake(0, SCREENHEIGHT -69, 60, 20);
    }
   
    [btn setTitle:@"test" forState:UIControlStateNormal];
    btn.backgroundColor =[UIColor redColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(handelbtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%d",index);
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    NSLog(@"index %d",index);
}


- (void)handelbtn {
    
    TestViewController *testVC =[TestViewController new];
    PUSH(testVC);
    
    
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
