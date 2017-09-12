# BSRatingView
This library is to show rating as stars.

## How To Use:
Drop BSRating.h & BSRating.m in your project and import it
```
#import "BSRating.h"

BSRating *rating=[[BSRating alloc] initWithFrame:CGRectMake(20, 50, 110, 20) withStarCount:5 filledCount:3 ratingType:BSRatingTypeOutlined withColor:[UIColor blueColor]];
    [self.view addSubview:rating];
    
    BSRating *rating2=[[BSRating alloc] initWithFrame:CGRectMake(20, 120, 100, 20) withStarCount:10 filledCount:7 ratingType:BSRatingTypeGrayed withColor:[UIColor redColor]];
    [self.view addSubview:rating2];
```
![alt tag](https://user-images.githubusercontent.com/16186934/30312640-d1391f06-97b3-11e7-84f7-5855f4d06630.png) 
