//
//  Define.h
//  UIKit_Dynamics
//
//  Created by 曾傲 on 2018/11/15.
//  Copyright © 2018 曾傲. All rights reserved.
//

#ifndef Define_h
#define Define_h

//屏幕宽度
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define kScreenHeight  [[UIScreen mainScreen] bounds].size.height
//屏幕比例
#define ScreenScale SCREEN_WIDTH/375.0
//根据当前屏幕宽度得到宽度
#define pixw(p) (SCREEN_WIDTH/375.0)*p
#define pixh(p) (SCREEN_HEIGHT/667.0)*p
//iPhone X 顶部和底部安全操作区域
#define SafeAreaTopHight (kScreenHeight == 812.0?88:64)
#define SafeAreaBoomHight (kScreenHeight == 812.0?34:0)



//是否是iPhone X
#define IS_IPHONE_X (kScreenHeight == 812.0?YES:NO)
//随机颜色
#define ZARandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//颜色
#define ZARGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//颜色带透明度
#define ZARGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

//获取view的frame
#define kGetViewWidth(view) view.frame.size.width
#define kGetViewHeight(view) view.frame.size.height
#define kGetViewX(view) view.frame.origin.x
#define kGetViewY(view) view.frame.origin.y
#define kGetViewMaxX    CGRectGetMaxX(view.frame)
#define kGetViewMaxY    CGRectGetMaxY(view.frame)


//获取图片
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

#define ZAWeakSelf(type)  __weak typeof(type) weak##type = type;
#define ZAStrongSelf(type)  __strong typeof(type) type = weak##type;

//设置视图圆角
#define ZAViewBorderRadius(View, Radius) [View.layer setCornerRadius:(Radius)];[View.layer setMasksToBounds:YES];
//设置视图和圆角以及边框宽度和边框颜色
#define ZAViewBorderRadiusWithBorder(View, Radius, Width, Color) [View.layer setCornerRadius:(Radius)];[View.layer setMasksToBounds:YES];[View.layer setBorderWidth:(Width)];[View.layer setBorderColor:[Color CGColor]];


//log
#ifdef DEBUG
#define ZALog(fmt,...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d]\n" fmt),__FILE__,__FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define ZALog(...)
#endif






#endif /* Define_h */
