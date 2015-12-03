//
//  TransitioningFromHomeToRunning.m
//  TestRunAnimation
//
//  Created by 吴迪玮 on 15/12/3.
//  Copyright © 2015年 Paodong. All rights reserved.
//

#import "TransitioningFromHomeToRunning.h"
#import "ViewController.h"
#import "RunningViewController.h"

@implementation TransitioningFromHomeToRunning 

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UINavigationController *nav = (UINavigationController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *fromViewController = (ViewController *)nav.topViewController;
    RunningViewController *toViewController = (RunningViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
    UIView *cellImageSnapshot = [fromViewController.deviceShoeImageView snapshotViewAfterScreenUpdates:YES];
    
    cellImageSnapshot.frame = [containerView convertRect:fromViewController.deviceShoeImageView.frame fromView:fromViewController.contrainerView];
    fromViewController.deviceShoeImageView.hidden = YES;
    
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.animationImageview.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        
        toViewController.view.alpha = 1.0;
        
        
        CGRect frame = [containerView convertRect:toViewController.animationImageview.frame fromView:toViewController.view];
        NSLog(@"frame is %@",NSStringFromCGRect(toViewController.animationImageview.frame));
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        
        toViewController.animationImageview.hidden = NO;
        fromViewController.deviceShoeImageView.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

@end
