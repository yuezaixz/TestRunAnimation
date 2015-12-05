//
//  HomePageAnimationUtil.h
//  TestRunAnimation
//
//  Created by 吴迪玮 on 15/12/4.
//  Copyright © 2015年 Paodong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomePageAnimationUtil : NSObject

+ (void)homeStartViewMaskAnimation:(UIView *) view withBeginTime:(NSTimeInterval)beginTime;
+ (void)homeStartBtnMaskAnimation:(UIView *) view withBeginTime:(NSTimeInterval)beginTime;

@end
