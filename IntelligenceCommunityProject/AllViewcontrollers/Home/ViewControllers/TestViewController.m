//
//  TestViewController.m
//  IntelligenceCommunityProject
//
//  Created by Miugodigital on 2018/2/7.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "TestViewController.h"

static NSString *CellId = @"idtest";
@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)NSMutableArray *dataarr;
@end

@implementation TestViewController

-(UITableView *)tableview {
    if (!_tableview) {
        _tableview =[UITableView new];
    }
    return _tableview;
}
-(NSMutableArray *)dataarr {
    if (!_dataarr) {
        _dataarr =[NSMutableArray array];
    }
    return _dataarr;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
//    backBtn.title = @"返回";
//    self.navigationItem.backBarButtonItem = backBtn;
    
    for (int i = 0; i < 100; i++) {
        [self.dataarr addObject:[NSString stringWithFormat:@"%@ %d",@"test",i]];
    }
    
    
    //test请求数据
    NSLog(@"%@",self.view.subviews);
    self.navigationItem.title = @"test";
    
     self.view.backgroundColor =[UIColor redColor];
    CGFloat Navheight = 64;
    if (IS_IPHONE_X) {
        Navheight = 88.0;
    }else {
        Navheight = 64.0;
    }
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:CellId];
       self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.backgroundColor =[UIColor orangeColor];
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(Navheight);
        make.left.mas_equalTo(self.view).mas_offset(0);// leftView 左边 = self.view 左边 +10
        make.right.mas_equalTo(self.view).mas_offset(0);// leftView 上边 = self.view 上边 +20
        make.bottom.mas_equalTo(self.view).mas_offset(0);
    }];
   
    [self.tableview setNeedsLayout];
    [self.tableview layoutIfNeeded];
    
 //   self._tableview.delegat
 
   
    
    
      
   
    
   // [self test];
}

- (void)test {
    [[ NetworkRequest  shareNetWord] requstParams:nil requestSuccess:^(NSString *json) {
        NSLog(@"%@",json);
    } requestFailure:^(NSString *json, NSString *error) {
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataarr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellId forIndexPath:indexPath];
    cell.textLabel.text = self.dataarr[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
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
