//
//  HomePageAnimationUtil.m
//  TestRunAnimation
//
//  Created by 吴迪玮 on 15/12/4.
//  Copyright © 2015年 Paodong. All rights reserved.
//

#import "HomePageAnimationUtil.h"

@implementation HomePageAnimationUtil

+ (void)homeStartViewMaskAnimation:(UIView *) view withBeginTime:(NSTimeInterval)beginTime{
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, CGRectGetHeight(view.bounds),
                                                                      CGRectGetWidth(view.bounds), 0)].CGPath;
    CGPathRef endPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(view.bounds),
                                                                    CGRectGetHeight(view.bounds))].CGPath;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor blackColor].CGColor;
    layer.path = beginPath;
    view.layer.mask = layer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 1;
    animation.beginTime = CACurrentMediaTime() + beginTime;
    animation.fromValue = (id)layer.path;
    animation.toValue = (__bridge id)endPath;
    animation.removedOnCompletion = NO;//这两句的效果是让动画结束后不会回到原处，必须加
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"shapeLayerPath"];
    
}


+ (void)homeStartBtnMaskAnimation:(UIView *) view withBeginTime:(NSTimeInterval)beginTime{
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0,
                                                                      CGRectGetWidth(view.bounds), 0)].CGPath;
    CGPathRef endPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(view.bounds),
                                                                    CGRectGetHeight(view.bounds))].CGPath;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor blackColor].CGColor;
    layer.path = beginPath;
    view.layer.mask = layer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 1;
    animation.beginTime = CACurrentMediaTime() + beginTime;
    animation.fromValue = (id)layer.path;
    animation.toValue = (__bridge id)endPath;
    animation.removedOnCompletion = NO;//这两句的效果是让动画结束后不会回到原处，必须加
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"shapeLayerPath"];
    
}

@end
