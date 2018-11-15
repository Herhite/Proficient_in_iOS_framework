//
//  ViewController.m
//  UIKit_Dynamics
//
//  Created by 曾傲 on 2018/11/15.
//  Copyright © 2018 曾傲. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UIKIT Dynamics";
    [self.view addSubview:self.table];
    self.dataSource = [NSMutableArray arrayWithArray:@[@"Gravity 重力"]];
}

- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHight, kScreenWidth, kScreenHeight-SafeAreaTopHight-SafeAreaBoomHight)style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _table;
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


@end
