//
//  BSRating.m
//  BSRatingViewExample
//
//  Created by Bisma on 08/09/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import "BSRating.h"

@implementation BSRating{
    
    BSRatingType ratingType;
    int totalStars;
    int filledValue;
}

-(id)init{
    
    if (self=[super init]) {
        
        self.frame=CGRectMake(20, 60, 200, 20);
        [self initializeRatingView:5 withFilled:2 type:BSRatingTypeOutlined withColor:[UIColor yellowColor]];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame withStarCount:(int)starCount filledCount:(int)filledCount ratingType:(BSRatingType)type withColor:(UIColor *)color{
    
    if (self=[super initWithFrame:frame]) {
        
        self.frame=frame;
        [self initializeRatingView:starCount withFilled:filledCount type:type withColor:color];
    }
    return self;
}

-(void)initializeRatingView:(int)starCount withFilled:(int)filled type:(BSRatingType)type withColor:(UIColor *)color{
    
    float width=(self.frame.size.width/starCount);
    
    ratingType=type;
    filledValue=filled;
    totalStars=starCount;
    
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

        
        for (int i = 0; i < 5; i = i + 1) {
        
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
-(void)setRatingColor:(UIColor*)color{
    
    NSArray *layers=[self layer].sublayers;
    for (int star=0; star<layers.count; star++) {
        
        CAShapeLayer *shape=[layers objectAtIndex:star];
        
        if ([shape isKindOfClass:[CAShapeLayer class]]) {
            
            if (ratingType==BSRatingTypeOutlined) {
                
                if (star>=filledValue) {
                    
                    shape.fillColor=[UIColor clearColor].CGColor;
                }else{
                    
                    shape.fillColor=color.CGColor;
                }
                shape.strokeColor=color.CGColor;
                
            }else{
                
                if (star>=filledValue) {
                    
                    shape.fillColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0].CGColor;
                }else{
                    
                    shape.fillColor=color.CGColor;
                }
            }

        }
    }
    
}

@end
