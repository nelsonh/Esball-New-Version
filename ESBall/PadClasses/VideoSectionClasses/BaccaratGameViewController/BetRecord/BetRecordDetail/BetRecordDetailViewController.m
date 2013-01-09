//
//  BetRecordDetailViewController.m
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordDetailViewController.h"

@interface BetRecordDetailViewController ()

@end

@implementation BetRecordDetailViewController

@synthesize cid = _cid;
@synthesize gameType = _gameType;
@synthesize roundNumberLabel = _roundNumberLabel;
@synthesize tableNumberLabel = _tableNumberLabel;
@synthesize dateTimeLabel = _dateTimeLabel;
@synthesize commentLabel = _commentLabel;

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

@end
