//
//  MoreViewController.m
//  ESBall
//
//  Created by Nelson on 12/11/18.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "MoreSectionBaseViewController.h"

@interface MoreSectionBaseViewController ()

@end

@implementation MoreSectionBaseViewController

@synthesize infoView = _infoView;

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
