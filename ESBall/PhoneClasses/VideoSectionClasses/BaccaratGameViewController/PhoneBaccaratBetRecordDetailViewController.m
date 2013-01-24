//
//  PhoneBaccaratBetRecordDetailViewController.m
//  ESBall
//
//  Created by mobile on 13/1/18.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import "PhoneBaccaratBetRecordDetailViewController.h"

@interface PhoneBaccaratBetRecordDetailViewController ()

@end

@implementation PhoneBaccaratBetRecordDetailViewController

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

-(IBAction)exit:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
@end
