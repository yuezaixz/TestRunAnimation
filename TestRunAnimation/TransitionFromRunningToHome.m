//
//  TransitionFromRunningToHome.m
//  TestRunAnimation
//
//  Created by 吴迪玮 on 15/12/3.
//  Copyright © 2015年 Paodong. All rights reserved.
//

#import "TransitionFromRunningToHome.h"
#import "RunningViewController.h"
#import "ViewController.h"

@implementation TransitionFromRunningToHome

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UINavigationController *nav = (UINavigationController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ViewController *toViewController = (ViewController *)nav.topViewController;
    RunningViewController *fromViewController = (RunningViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
    UIView *cellImageSnapshot = [fromViewController.animationImageview snapshotViewAfterScreenUpdates:YES];
    
    cellImageSnapshot.frame = [containerView convertRect:fromViewController.animationImageview.frame fromView:fromViewController.view];
    fromViewController.animationImageview.hidden = YES;
    
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.deviceShoeImageView.hidden = YES;
    
    [containerView addSubview:nav.view];
    [containerView addSubview:cellImageSnapshot];
    
    
    
    [UIView animateWithDuration:duration animations:^{
        
        toViewController.view.alpha = 1.0;
        
        
        CGRect frame = [containerView convertRect:toViewController.deviceShoeImageView.frame fromView:toViewController.contrainerView];
        
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        
        toViewController.deviceShoeImageView.hidden = NO;
        fromViewController.animationImageview.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}
@end
