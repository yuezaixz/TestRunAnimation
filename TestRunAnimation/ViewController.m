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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:74.0 / 255.0 green:74.0 / 255.0 blue:74.0 / 255.0 alpha:1.0]];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
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
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RunningViewController *sec = [story instantiateViewControllerWithIdentifier:@"runnigVC"];
    sec.transitioningDelegate = self;
    [self presentViewController:sec animated:YES completion:nil];
    
}

@end
