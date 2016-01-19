//
//  ViewController.m
//  TestRunAnimation
//
//  Created by 吴迪玮 on 15/12/3.
//  Copyright © 2015年 Paodong. All rights reserved.
//

#import "ViewController.h"
#import "RunningViewController.h"
#import "TransitioningFromHomeToRunning.h"
#import "TransitionFromRunningToHome.h"
#import "HomePageAnimationUtil.h"
#import "TextPathAnimationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [HomePageAnimationUtil homeStartViewMaskAnimation:self.bottomBGView withBeginTime:0];
    [HomePageAnimationUtil homeStartBtnMaskAnimation:self.startBtn withBeginTime:1];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitioningFromHomeToRunning alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[TransitionFromRunningToHome alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionStartRunning:(id)sender{
//    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    RunningViewController *sec = [story instantiateViewControllerWithIdentifier:@"runnigVC"];
//    sec.transitioningDelegate = self;
//    [self presentViewController:sec animated:YES completion:nil];

    
    TextPathAnimationViewController *sec = [[TextPathAnimationViewController alloc] initWithNibName:@"TextPathAnimationViewController" bundle:nil];
    [self presentViewController:sec animated:YES completion:nil];
}

@end
