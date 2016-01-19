//
//  TextPathAnimation.h
//  TestRunAnimation
//
//  Created by 吴迪玮 on 16/1/18.
//  Copyright © 2016年 Paodong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LetterPathAnimation : NSObject

+ (UIBezierPath *)pathByLetter:(NSString *)letter;

+(CAShapeLayer *)animationForView:(UIView *)contrainerView byPath:(UIBezierPath *)path color:(UIColor *)color duration:(NSInteger)duration;

@end
