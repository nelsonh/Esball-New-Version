//
//  PhoneBaccaratGameViewController.m
//  ESBall
//
//  Created by mobile on 12/12/27.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PhoneBaccaratGameViewController.h"

@interface PhoneBaccaratGameViewController ()

@end

@implementation PhoneBaccaratGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)videoImageIPAddressForTableNumber:(NSUInteger)tableNumber
{
    return @"http://183.182.66.239/baccaratsd1/sd2.jpg";
}

-(NSString *)backgroundImageNameForGameGreaterThanThirtyRound
{
    return @"Game_bg2s.png";
}

-(NSString *)backgroundImageNameForGameLessThanThirtyRound
{
    return @"Game_bgs.png";
}

-(CGFloat)chipSpaceWidth
{
    return 4.0;
}
-(CGFloat)chipSpaceHeight
{
    return 4.0;
}

-(CGFloat)chipSize
{
    return 50.0;
}

@end
