//
//  BSRating.m
//  BSRatingViewExample
//
//  Created by Bisma on 08/09/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import "BSRating.h"

@implementation BSRating

-(id)init{
    
    if (self=[super init]) {
        
        self.frame=CGRectMake(20, 60, 200, 20);
        [self initializeRatingView:5 withFilled:2 type:BSRatingTypeOutlined withColor:[UIColor yellowColor]];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame withStarCount:(int)starCount filledCount:(int)filledCount ratingType:(BSRatingType)ratingType withColor:(UIColor *)color{
    
    if (self=[super initWithFrame:frame]) {
        
        self.frame=frame;
        [self initializeRatingView:starCount withFilled:filledCount type:ratingType withColor:color];
    }
    return self;
}

-(void)initializeRatingView:(int)starCount withFilled:(int)filled type:(BSRatingType)type withColor:(UIColor *)color{
    
    float width=(self.frame.size.width/starCount);
    for (int star=0; star<starCount; star++) {
        
        
        CAShapeLayer* shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame=CGRectMake((star*width), 0, width, width);
        
        UIBezierPath* starPath = [UIBezierPath bezierPath];
        
        CGFloat arcPerPoint = 2.0f * M_PI / 5;
        CGFloat theta = M_PI / 2.0f;
        CGPoint center = shapeLayer.position;

        float circumscribedRadius = shapeLayer.bounds.size.width;
        float outerRadius = circumscribedRadius * 1.039;
        float innerRadius = outerRadius * 0.382;
        
        CGPoint pt = CGPointMake(center.x - (outerRadius * cosf(theta)), center.y - (outerRadius * sinf(theta)));
        
        [starPath moveToPoint:pt];

        
        for (int i = 0; i < starCount; i = i + 1) {
        
            theta = theta - (arcPerPoint / 2.0f);
            if (theta < 0.0f) {
                theta = theta + (2 * M_PI);
            }
            pt = CGPointMake(center.x - (innerRadius * cosf(theta)), center.y - (innerRadius * sinf(theta)));
            
            [starPath addLineToPoint:pt];
            
            theta = theta - (arcPerPoint / 2.0f);
            if (theta < 0.0f) {
                theta = theta + (2 * M_PI);
            }
            pt = CGPointMake(center.x - (outerRadius * cosf(theta)), center.y - (outerRadius * sinf(theta)));
            [starPath addLineToPoint:pt];
        }
        
        [starPath closePath];
        [shapeLayer setPath:[starPath CGPath]];
        
        if (type==BSRatingTypeOutlined) {
            
            if (star>=filled) {
                
                shapeLayer.fillColor=[UIColor clearColor].CGColor;
            }else{
                
                shapeLayer.fillColor=color.CGColor;
            }
            shapeLayer.strokeColor=color.CGColor;
            
        }else{
            
            if (star>=filled) {
                
                shapeLayer.fillColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0].CGColor;
            }else{
                
                shapeLayer.fillColor=color.CGColor;
            }
        }
        
        
        [[self layer] addSublayer:shapeLayer];
        
    }
    
}
//-(CAKeyframeAnimation*)createAnimation{
//    
//    CAKeyframeAnimation *colorsAnimation = [CAKeyframeAnimation animationWithKeyPath:@"fillColor"];
//    
//    colorsAnimation.values = [NSArray arrayWithObjects: (id)UIColorFromRGB(0xe45f56).CGColor,
//                              (id)UIColorFromRGB(0xa3d39c).CGColor,
//                              (id)UIColorFromRGB(0x7accc8).CGColor,
//                              (id)UIColorFromRGB(0x4aaaa5).CGColor,
//                              (id)UIColorFromRGB(0x35404f).CGColor, nil];
//    
//    colorsAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.20], [NSNumber numberWithFloat:0.4], [NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.8],[NSNumber numberWithFloat:1.0], nil];
//    colorsAnimation.calculationMode = kCAAnimationPaced;
//    colorsAnimation.removedOnCompletion = NO;
//    colorsAnimation.fillMode = kCAFillModeForwards;
//    colorsAnimation.duration = k_Animation_Duration;
//    
//    
//    return colorsAnimation;
//}
//-(void)startAnimations{
//    
//    [_circleLayerOne removeAllAnimations];
//    [_circleLayerTwo removeAllAnimations];
//    [_circleLayerThree removeAllAnimations];
//    [_circleLayerFour removeAllAnimations];
//    [_circleLayerFive removeAllAnimations];
//    
//    CAKeyframeAnimation *oneAnimation=[self createAnimation];
//    [_circleLayerOne addAnimation:oneAnimation forKey:@"fillColor"];
//    
//    CAKeyframeAnimation *twoAnimation=[self createAnimation];
//    twoAnimation.beginTime=CACurrentMediaTime() +k_Animation_Duration*0.15;
//    [_circleLayerTwo addAnimation:twoAnimation forKey:@"fillColor"];
//    
//    CAKeyframeAnimation *threeAnimation=[self createAnimation];
//    threeAnimation.beginTime=CACurrentMediaTime() +(k_Animation_Duration*0.30);
//    [_circleLayerThree addAnimation:threeAnimation forKey:@"fillColor"];
//    
//    CAKeyframeAnimation *fourAnimation=[self createAnimation];
//    fourAnimation.beginTime=CACurrentMediaTime() +(k_Animation_Duration*0.45);
//    [_circleLayerFour addAnimation:fourAnimation forKey:@"fillColor"];
//    
//    CAKeyframeAnimation *fiveAnimation=[self createAnimation];
//    fiveAnimation.beginTime=CACurrentMediaTime() +(k_Animation_Duration*0.60);
//    [_circleLayerFive addAnimation:fiveAnimation forKey:@"fillColor"];
//    
//}

@end
