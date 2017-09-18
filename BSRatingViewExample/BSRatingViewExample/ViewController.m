//
//  ViewController.m
//  BSRatingViewExample
//
//  Created by Bisma on 08/09/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import "ViewController.h"
#import "BSRating.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BSRating *rating=[[BSRating alloc] initWithFrame:CGRectMake(20, 50, 110, 20) withStarCount:5 filledCount:3 ratingType:BSRatingTypeOutlined withColor:[UIColor blueColor]];
    [rating setRatingColor:[UIColor magentaColor]];
    [self.view addSubview:rating];
    
    BSRating *rating2=[[BSRating alloc] initWithFrame:CGRectMake(20, 120, 100, 20) withStarCount:10 filledCount:7 ratingType:BSRatingTypeGrayed withColor:[UIColor redColor]];
    [rating2 setRatingColor:[UIColor cyanColor]];
    [self.view addSubview:rating2];
    
}


@end
