//
//  PadViewController.m
//  ESBall
//
//  Created by Nelson on 12/11/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "PadViewController.h"
#import "PadLoginViewController.h"
#import "VideoSectionViewController.h"

@interface PadViewController ()


@end

@implementation PadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    
    firstLaunch = YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(firstLaunch)
    {
        [self performSegueWithIdentifier:@"PadLoginView" sender:self];
        firstLaunch = NO;
    }
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //only landscape
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - override
-(void)connectionLost:(NSNotification *)notification
{
    [super connectionLost:notification];
    
    [self.presentedViewController dismissModalViewControllerAnimated:NO];
    
    [self performSegueWithIdentifier:@"PadLoginView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"PadLoginView"])
    {
        PadLoginViewController *controller = segue.destinationViewController;
        controller.theDelegate = self;
    }
}

#pragma mark - PadLoginViewController delegate
-(void)PadLoginViewControllerDidLogin:(PadLoginViewController *)controller
{
    
    [self.presentedViewController dismissModalViewControllerAnimated:NO];
    
    [self performSegueWithIdentifier:@"PadMainView" sender:self];
    
    /*
    //go into video section directly
    VideoSectionViewController *vidController = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoSection"];
    
    [self presentViewController:vidController animated:NO completion:nil];
     */
}

@end
