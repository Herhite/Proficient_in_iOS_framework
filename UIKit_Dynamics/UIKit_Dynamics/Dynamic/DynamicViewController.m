//
//  DynamicViewController.m
//  UIKit_Dynamics
//
//  Created by 曾傲 on 2018/11/15.
//  Copyright © 2018 曾傲. All rights reserved.
//

#import "DynamicViewController.h"
#import "DynamicDetailController.h"
#import "CollisionsController.h"

#import "ChangeRootViewController.h"

@interface DynamicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NSMutableArray *dataSource;


@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIKIT Dynamics";
    [self.view addSubview:self.table];
//    UIButton *button = [self getFootView];
//    [self.view addSubview:button];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.dataSource = [NSMutableArray arrayWithArray:@[@"Gravity 重力",@"Collisions 碰撞效果",@"Attachments 附着效果"]];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeRootVC2) name:@"HEHHEH" object:nil];
}

- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHight, kScreenWidth, kScreenHeight-SafeAreaTopHight-SafeAreaBoomHight)style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _table.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _table.tableFooterView = [self getFootView];
    }
    return _table;
}

-(UIButton *)getFootView{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, kScreenWidth, 44);
//    [button addTarget:self action:@selector(changeRootVC) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"切换根视图控制器" forState:UIControlStateNormal];
    [button setTitleColor:ZARandomColor forState:UIControlStateNormal];
    return button;
}
- (void)changeRootVC2{
    ZALog(@"呵呵呵");
}

- (void)changeRootVC{
    DynamicViewController *rootVC = [[DynamicViewController alloc]init];
//    __strong typeof(self)strongSelf = self;
    [UIApplication sharedApplication].keyWindow.rootViewController = rootVC;
//    [self presentViewController:rootVC animated:YES completion:nil];
//    __weak typeof(self)weakSelf = self;
//    [self dismissViewControllerAnimated:NO completion:^{
////        __strong typeof(weakSelf)strongSelf = weakSelf;
//
//    }];
}

- (void)dealloc{
    ZALog(@"dealloc");
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"Dynamics";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        //        cell.accessoryType = UITableViewCellAccessoryNone;//cell没有任何的样式
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell的右边有一个小箭头，距离右边有十几像素
        //        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;//cell右边有一个蓝色的圆形button
        //        cell.accessoryType = UITableViewCellAccessoryCheckmark;//cell右边的形状是对号
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        DynamicDetailController *dynamicVC = [[DynamicDetailController alloc]init];
        dynamicVC.title = self.dataSource[indexPath.row];
        [self.navigationController pushViewController:dynamicVC animated:YES];
    }else if (indexPath.row == 1){
        CollisionsController *collisionsVC = [[CollisionsController alloc]init];
        collisionsVC.title = self.dataSource[indexPath.row];
        [self.navigationController pushViewController:collisionsVC animated:YES];
    }


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
