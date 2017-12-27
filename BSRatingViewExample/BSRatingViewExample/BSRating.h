//
//  BSRating.h
//  BSRatingViewExample
//
//  Created by Bisma on 08/09/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BSRatingTypeOutlined,
    BSRatingTypeGrayed,
} BSRatingType;

@interface BSRating : UIView<CAAnimationDelegate>
-(id)init;
-(id)initWithFrame:(CGRect)frame withStarCount:(int)starCount ratingValue:(float)ratingValue ratingType:(BSRatingType)ratingType withColor:(UIColor*)color;

-(void)setRatingColor:(UIColor*)color;
-(void)setRatingType:(BSRatingType)ratingType;
-(void)settTotalStars:(int)totalStars;
-(void)setFilledValue:(float)filledValue;



@end
