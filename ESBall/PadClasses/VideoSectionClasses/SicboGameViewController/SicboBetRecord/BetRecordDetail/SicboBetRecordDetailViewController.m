//
//  SicboBetRecordDetailViewController.m
//  ESBall
//
//  Created by Nelson on 1/24/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SicboBetRecordDetailViewController.h"

@interface SicboBetRecordDetailViewController ()

@end

@implementation SicboBetRecordDetailViewController

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
-(NSString *)cellIdentifier
{
    //must match id in IB
    return @"RowCell";
}

-(NSString *)cellIdentifierForTotalBet
{
    //must match id in IB
    return @"TotalRowCell";
}

@end
