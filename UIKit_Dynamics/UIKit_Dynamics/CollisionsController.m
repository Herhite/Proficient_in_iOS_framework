//
//  CollisionsController.m
//  UIKit_Dynamics
//
//  Created by 曾傲 on 2018/11/15.
//  Copyright © 2018 曾傲. All rights reserved.
//

#import "CollisionsController.h"

@interface CollisionsController ()
    
/**
 同一animator下只能设置一个 UIGravityBehavior
 */
@property (nonatomic,strong) UIDynamicAnimator *animator;
@end

@implementation CollisionsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *ballItem = [[UIImageView alloc]initWithFrame:CGRectMake(0, SafeAreaBoomHight+64, 150, 150.0/1920*1080)];
    UIImageView *ballItem2 = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-30, SafeAreaBoomHight+64, 150, 150.0/1920*1080)];
    ballItem2.image = kGetImage(@"59102243872ab");
    
    
    [self.view addSubview:ballItem2];
    ballItem.image = kGetImage(@"5910223872452");
    [self.view addSubview:ballItem];
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    //item 为动画作用的对象
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[ballItem2]];
    gravityBehavior.gravityDirection = CGVectorMake(-0.5, 1.0);
    //    magnitude 影响下降速度
    gravityBehavior.magnitude = 0.1;
    
    UIGravityBehavior *gravityBehavior2 = [[UIGravityBehavior alloc]initWithItems:@[ballItem]];
    gravityBehavior2.gravityDirection = CGVectorMake(0.5, 1.0);
    //    magnitude 影响下降速度
    gravityBehavior2.magnitude = 0.3;
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc]initWithItems:@[ballItem,ballItem2]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeItems;
    //添加一个边界轨迹  UIBezierPath    collisionMode 设置为UICollisionBehaviorModeBoundaries时候有效
//    [collisionBehavior addBoundaryWithIdentifier:@"XX" forPath:[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 500, 200)]];
    /*
    UICollisionBehaviorModeItems        = 1 << 0,   //碰到item
    UICollisionBehaviorModeBoundaries   = 1 << 1,   //碰到边界
    UICollisionBehaviorModeEverything   = NSUIntegerMax //碰到边界和item
     */
    //设置参照视图为边界
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
//    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:gravityBehavior2];
    [self.animator addBehavior:collisionBehavior];
//    [self.animator addBehavior:collisionBehavior];
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
