//
//  ViewController.m
//  study
//
//  Created by luoshuai on 15/8/6.
//  Copyright (c) 2015年 WS. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "OneView.h"
#import "BaseAnimator.h"
@interface ViewController ()
@property (nonatomic, strong) OneView *oneview;
@property (nonatomic, strong) UIButton *oneButton;
@end

@implementation ViewController
- (UIButton *)oneButton{
    if (_oneButton) {
        return _oneButton;
    }
    _oneButton = [UIButton buttonWithType:0];
    [_oneButton setFrame:CGRectMake(10, 70, 50, 30)];
    [_oneButton setBackgroundColor:[UIColor redColor]];
    [_oneButton setTitle:@"开始" forState:0];
    [_oneButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    return _oneButton;
}
- (OneView *)oneview{
    if (_oneview) {
        return _oneview;
    }
    _oneview = [[OneView alloc]initWithFrame:CGRectMake(40, 200, 100, 100)];
    return _oneview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.view addSubview:self.oneButton];
    [self.view addSubview:self.oneview];
    
    
}
#define angle2Radian(angle)  ((angle)/180.0*M_PI)

- (void)click{
    
//    CGMutablePathRef path=CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, NULL, CGRectMake(self.oneview.center.x, self.oneview.center.y, 100, 100));
//    keyframe.path = path;
//    CGPathRelease(path);
    
    
    
    
    CAKeyframeAnimation *move = [CAKeyframeAnimation animation];
    move.keyPath = @"position";
    NSValue *value1=[NSValue valueWithCGPoint:self.oneview.center];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5=[NSValue valueWithCGPoint:self.oneview.center];
    move.values=@[value1,value2,value3,value4,value5];
    move.duration=5;

    //1.2设置动画执行完毕后，不删除动画
    move.removedOnCompletion=YES;
    //1.3设置保存动画的最新状态
    move.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
//    keyframe.duration=4.0;
    //1.5设置动画的节奏
    move.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //设置代理，开始—结束
    move.delegate=self;
    //2.添加核心动画
    [self.oneview.layer addAnimation:move forKey:nil];
}
-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始动画");
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animation];
    keyframe.keyPath = @"transform.rotation";
    keyframe.duration = 0.1;
    keyframe.values=@[@(-angle2Radian(4)),@(angle2Radian(4)),@(-angle2Radian(4))];
    keyframe.repeatCount=MAXFLOAT;
    keyframe.fillMode=kCAFillModeForwards;
    keyframe.removedOnCompletion=NO;
    [self.oneview.layer addAnimation:keyframe forKey:@"key"];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"结束动画");
    [self.oneview.layer removeAnimationForKey:@"key"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
