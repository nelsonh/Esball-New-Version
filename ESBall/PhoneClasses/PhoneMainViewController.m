//
//  PhoneMainViewController.m
//  ESBall
//
//  Created by nelson on 12/11/15.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PhoneMainViewController.h"
#import "BaseGameViewController.h"
#import "PhoneVideoSectionChangeControllerViewController.h"
@interface PhoneMainViewController ()

@end

@implementation PhoneMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
/*  BaseGameViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"BaccaratGameViewController"];
    
    controller.tableNumber = 1;
    controller.gameType = 3001;
    
    
    
    [self presentViewController:controller animated:YES completion:nil];*/
   /*
   PhoneVideoSectionChangeControllerViewController  *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"phoneVideoSectionChangeViewController"];
    
   [self presentViewController:controller animated:YES completion:nil];
    */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    /*
    PhoneVideoSectionChangeControllerViewController  *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"phoneVideoSectionChangeViewController"];
    
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    */
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




@end
