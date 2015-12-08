//
//  RunningViewController.m
//  TestRunAnimation
//
//  Created by 吴迪玮 on 15/12/3.
//  Copyright © 2015年 Paodong. All rights reserved.
//

#import "RunningViewController.h"

@interface RunningViewController ()

@end

@implementation RunningViewController{
    NSInteger currentIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_device_shoe"]];
    self.animationImageview.frame = CGRectMake(0, 0, 304, 231);
    self.animationImageview.center = self.view.center;
    [self.view addSubview:_animationImageview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)actionStop:(id)sender {
    if (currentIndex == 0 ) {
        UIBezierPath *aPath = [UIBezierPath bezierPath];
        
        aPath.lineWidth = 5.0;
        aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
        aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
        
        [aPath moveToPoint:CGPointMake(246, 91)];
        
        [aPath addQuadCurveToPoint:CGPointMake(120, 177) controlPoint:CGPointMake(192, 147)];
        
        [aPath stroke];
        
        //（2）加到CAShapeLayer，效果出来了
        
        CAShapeLayer *shapelayer = [CAShapeLayer layer];
        
        shapelayer.path = aPath.CGPath;
        //设置边框颜色
        
        shapelayer.strokeColor = [[UIColor redColor] CGColor];
        
        //设置填充颜色
        
        shapelayer.fillColor = [[UIColor clearColor] CGColor];
        
        
        [self.animationImageview.layer addSublayer:shapelayer];
        
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(0.0);
        animation.toValue = @(1.0);
        shapelayer.autoreverses = NO;
        animation.duration = 1.0;
        [shapelayer addAnimation:animation forKey:nil];
        shapelayer.strokeEnd = 1;
        currentIndex++;
    } else if (currentIndex == 1 ) {
        UIBezierPath *aPath = [UIBezierPath bezierPath];
        
        aPath.lineWidth = 5.0;
        aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
        aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
        
        [aPath moveToPoint:CGPointMake(120, 177)];
        
        [aPath addQuadCurveToPoint:CGPointMake(103, 144) controlPoint:CGPointMake(102, 79)];
        
        [aPath stroke];
        
        //（2）加到CAShapeLayer，效果出来了
        
        CAShapeLayer *shapelayer = [CAShapeLayer layer];
        
        shapelayer.path = aPath.CGPath;
        //设置边框颜色
        
        shapelayer.strokeColor = [[UIColor redColor] CGColor];
        
        //设置填充颜色
        
        shapelayer.fillColor = [[UIColor clearColor] CGColor];
        
        
        [self.animationImageview.layer addSublayer:shapelayer];
        
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(0.0);
        animation.toValue = @(1.0);
        shapelayer.autoreverses = NO;
        animation.duration = 1.0;
        [shapelayer addAnimation:animation forKey:nil];
        currentIndex ++;
    } else if (currentIndex == 2 ) {
        [self dismissViewControllerAnimated:YES completion:nil];
        currentIndex = 0;
    }
    
    
}

@end
