//
//  DynamicDetailController.m
//  UIKit_Dynamics
//
//  Created by 曾傲 on 2018/11/15.
//  Copyright © 2018 曾傲. All rights reserved.
//

#import "DynamicDetailController.h"

@interface DynamicDetailController ()

/**
 UIDynamicAnimator 对象必须设置为成员变量或者属性 行为才会生效
 */

@property (nonatomic,strong)UIDynamicAnimator *animator;


@end

@implementation DynamicDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"重力效果";
    self.view.backgroundColor = ZARandomColor;
    
    UIImageView *ballItem = [[UIImageView alloc]initWithFrame:CGRectMake(0, SafeAreaBoomHight+64, kScreenWidth/2, kScreenWidth/2/1920*1080)];
    
    UIImageView *ballItem2 = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2, SafeAreaBoomHight+64, kScreenWidth/2, kScreenWidth/2/1920*1080)];
    ballItem2.image = kGetImage(@"59102243872ab");
    [self.view addSubview:ballItem2];
    ballItem.image = kGetImage(@"5910223872452");
    [self.view addSubview:ballItem];
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    [self.animator removeAllBehaviors];
    //item 为动画作用的对象
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[ballItem,ballItem2]];
    /*
     CGVector 表示 方向的结构体
     struct CGVector {
     CGFloat dx; x轴的方向
     CGFloat dy; y轴的方向
     };
     gravityDirection 默认（0.0，1.0）向下 每秒下降 1000个像素点
     */
    gravityBehavior.gravityDirection = CGVectorMake(0.1, 1.0);
    /*
    //    角度 影响到重力的方向
    //0 （初始）向右  M_PI 向左    M_PI_2 向下 PI代表180度，角度为顺时针方向转动
     gravityDirection  和  angle 只会生效一个 都是影响运动方向
     */
    gravityBehavior.angle = M_PI_2;
    //    magnitude 影响下降速度
    gravityBehavior.magnitude = 0.1;
    //    把重力效果 添加到 动力效果的操纵者上
    [self.animator addBehavior:gravityBehavior];
    // Do any additional setup after loading the view.
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
