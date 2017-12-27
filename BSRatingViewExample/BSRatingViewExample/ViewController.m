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
@property (weak, nonatomic) IBOutlet BSRating *ratingVew;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    BSRating *rating=[[BSRating alloc] initWithFrame:CGRectMake(20, 50, 110, 20) withStarCount:5 ratingValue:3 ratingType:BSRatingTypeOutlined withColor:[UIColor blueColor]];
//    [rating setRatingColor:[UIColor magentaColor]];
//    [self.view addSubview:rating];
//    
//    BSRating *rating2=[[BSRating alloc] initWithFrame:CGRectMake(20, 120, 100, 20) withStarCount:10 ratingValue:7 ratingType:BSRatingTypeOutlined withColor:[UIColor blueColor]];
//    [rating2 setRatingColor:[UIColor cyanColor]];
//    [self.view addSubview:rating2];
//
    
    [self.ratingVew setRatingColor:[UIColor redColor]];
    [self.ratingVew setFilledValue:4.0];
    [self.ratingVew setRatingType:BSRatingTypeOutlined];
}


@end
