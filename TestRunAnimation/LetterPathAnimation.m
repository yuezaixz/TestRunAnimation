//
//  TextPathAnimation.m
//  TestRunAnimation
//
//  Created by 吴迪玮 on 16/1/18.
//  Copyright © 2016年 Paodong. All rights reserved.
//

#import "LetterPathAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

@implementation LetterPathAnimation

+ (UIBezierPath *)pathByLetter:(NSString *)letter {
    CGMutablePathRef letters = CGPathCreateMutable();
    
    // 通过Text创建Layer
    // 详细见: http://www.codeproject.com/KB/iPhone/Glyph.aspx
    // License: The Code Project Open License (CPOL) 1.02 http://www.codeproject.com/info/cpol10.aspx
    CTFontRef font = CTFontCreateWithName(CFSTR("HelveticaNeue-UltraLight"), 32.0f, NULL);
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge id)font, kCTFontAttributeName,
                           nil];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:letter
                                                                     attributes:attrs];
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    // for each RUN
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        // Get FONT for this run
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        // for each GLYPH in run
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            // get Glyph & Glyph-data
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            // Get PATH of outline
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    
    CGPathRelease(letters);
    CFRelease(font);
    
    return path;
}

+(CAShapeLayer *)animationForView:(UIView *)contrainerView byPath:(UIBezierPath *)path color:(UIColor *)color duration:(NSInteger)duration {
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = contrainerView.bounds;
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = color.CGColor;
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 1.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    
    [contrainerView.layer addSublayer:pathLayer];
    
    CABasicAnimation *pathAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = duration;
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue=[NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses=NO;
    pathLayer.path=path.CGPath;
    //增加动画
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    return pathLayer;
}

@end
