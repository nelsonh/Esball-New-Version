//
//  SicboItemViewController.m
//  ESBall
//
//  Created by Nelson on 3/5/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SicboItemViewController.h"

@interface SicboItemViewController ()

@end

@implementation SicboItemViewController

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

#pragma mark - override
-(void)updateTimeWithTime:(NSUInteger)time
{
    //sicbo timer go to -1 so convert to 0 when -1
    int theTime = time;
    
    if(theTime < 0)
    {
        self.timeLabel.text = @"0";
    }
    else
    {
        self.timeLabel.text = [NSString stringWithFormat:@"%i", time];
    }
    
}

@end
