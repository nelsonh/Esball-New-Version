//
//  PhoneLoginViewController.m
//  ESBall
//
//  Created by nelson on 12/11/15.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PhoneLoginViewController.h"

@interface PhoneLoginViewController ()

@end

@implementation PhoneLoginViewController

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
    
    self.accountTextFiled.placeholder = NSLocalizedString(@"Your account", @"Login account textfiled placeholder");
    self.passwordTextField.placeholder = NSLocalizedString(@"Your password", @"Login password textfiled placeholder");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //except upside down
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);    
}

//override method from super class
-(void)LogMe
{
    NSLog(@"Phone log in class LogMe");
}

@end
