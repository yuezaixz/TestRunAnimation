//
//  TextPathAnimationViewController.m
//  TestRunAnimation
//
//  Created by 吴迪玮 on 16/1/18.
//  Copyright © 2016年 Paodong. All rights reserved.
//

#import "TextPathAnimationViewController.h"
#import "LetterPathAnimation.h"

@interface TextPathAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *pathConstainer;
@property (strong, nonatomic) CAShapeLayer *layer;

@end

@implementation TextPathAnimationViewController{
    BOOL isAnimation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self startAnimation];
}

- (void)startAnimation {
    if (!isAnimation) {
        isAnimation = YES;
        UIBezierPath *path = [LetterPathAnimation pathByLetter:@"My name is David Woo"];
        self.layer = [LetterPathAnimation animationForView:self.pathConstainer byPath:path color:[UIColor colorWithRed:126.0/255 green:211.0/255 blue:33.0/255 alpha:1] duration:6];
        [self performSelector:@selector(clearAnimation) withObject:nil afterDelay:6];
        
    }
}

- (void)clearAnimation {
    [self.layer removeFromSuperlayer];
    isAnimation = NO;
}
- (IBAction)replayAction:(id)sender {
    [self startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
