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
    float filledValue;
    UIColor *ratingColor;
}

-(id)init{
    
    if (self=[super init]) {
        
        self.frame=CGRectMake(20, 60, 200, 20);
        
        ratingType=BSRatingTypeOutlined;
        filledValue=2.0;
        totalStars=5;
        ratingColor = [UIColor yellowColor];
        [self populateRatingView];
        
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame withStarCount:(int)starCount ratingValue:(float)ratingValue ratingType:(BSRatingType)type withColor:(UIColor *)color{
    
    if (self=[super initWithFrame:frame]) {
        
        self.frame=frame;
        
        ratingType=type;
        filledValue=ratingValue;
        totalStars=starCount;
        ratingColor = color;
        [self populateRatingView];
        
    }
    return self;
}
-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    NSLog(@"frame: x:%f , y:%f , w:%f , h:%f",self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height);
    
    ratingType=BSRatingTypeGrayed;
    filledValue=2.0;
    totalStars=5;
    ratingColor = [UIColor blackColor];
    [self populateRatingView];
}

-(void)populateRatingView{
    
    [[self.layer.sublayers copy] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CALayer * subLayer = obj;
        if([subLayer isKindOfClass:[CAShapeLayer class]]){
            [subLayer removeFromSuperlayer];
        }
        
    }];
    
    float width=(self.frame.size.width/totalStars);
    if (self.frame.size.height<width) {
        width=self.frame.size.height;
    }

    
    for (int star=0; star<totalStars; star++) {
        
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
        
        if (ratingType==BSRatingTypeOutlined) {
            
            if (star>=filledValue) {
                
                shapeLayer.fillColor=[UIColor clearColor].CGColor;
            }else{
                
                shapeLayer.fillColor=ratingColor.CGColor;
            }
            shapeLayer.strokeColor=ratingColor.CGColor;
            
        }else{
            
            if (star>=filledValue) {
                
                shapeLayer.fillColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0].CGColor;
            }else{
                
                shapeLayer.fillColor=ratingColor.CGColor;
            }
        }
        
        
        [[self layer] addSublayer:shapeLayer];
        
    }
    
}
-(void)setRatingColor:(UIColor*)color{
    
    ratingColor = color;
    [self populateRatingView];

}

-(void)setRatingType:(BSRatingType)type{
    
    ratingType=type;
    [self populateRatingView];
    
}
-(void)settTotalStars:(int)stars{
    
    totalStars = stars;
    [self populateRatingView];
    
}
-(void)setFilledValue:(float)value{

    filledValue = value;
    [self populateRatingView];
}

@end
