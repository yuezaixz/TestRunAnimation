//
//  ViewController.h
//  TestRunAnimation
//
//  Created by 吴迪玮 on 15/12/3.
//  Copyright © 2015年 Paodong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *bottomBGView;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIImageView *deviceShoeImageView;
@property (weak, nonatomic) IBOutlet UIView *contrainerView;

@end

