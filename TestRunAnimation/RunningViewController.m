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

@implementation RunningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_device_shoe"]];
    self.animationImageview.frame = CGRectMake(0, 0, 304, 231);
    self.animationImageview.center = self.view.center;
    [self.view addSubview:_animationImageview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionStop:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
