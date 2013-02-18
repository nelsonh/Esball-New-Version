//
//  PhoneViewController.m
//  ESBall
//
//  Created by mobile on 12/12/20.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PhoneViewController.h"
#import "PhoneMainViewController.h"
#import "PhoneVideoSectionChangeControllerViewController.h"
#import "PhoneLoginViewController.h"

@interface PhoneViewController ()

@end

@implementation PhoneViewController

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //only Portrait
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

#pragma mark - override
-(void)connectionLost:(NSNotification *)notification
{
    //[super connectionLost:notification];
    
    if([self.presentedViewController isKindOfClass:[PhoneVideoSectionChangeControllerViewController class]])
    {
        PhoneVideoSectionChangeControllerViewController *controller = (PhoneVideoSectionChangeControllerViewController *)self.presentedViewController;
        [controller dismiss];
    }

    
    [self.presentedViewController dismissModalViewControllerAnimated:NO];
    
    [self performSegueWithIdentifier:@"PadLoginView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"PadLoginView"])
    {
        /*
        PadLoginViewController *controller = segue.destinationViewController;
        controller.theDelegate = self;
         */
        PhoneLoginViewController *controller = segue.destinationViewController;
        controller.theDelegate = self;
    }
}


#pragma mark - PadLoginViewController delegate
-(void)PadLoginViewControllerDidLogin:(PadLoginViewController *)controller
{
    
    [self.presentedViewController dismissModalViewControllerAnimated:NO];
    
    //[self performSegueWithIdentifier:@"PadMainView" sender:self];
    
    /*
    //go into video section directly
    PhoneMainViewController *mainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PhoneMainViewController"];
    
    [self presentViewController:mainViewController animated:NO completion:nil];
    */
    
    
    PhoneVideoSectionChangeControllerViewController *theController = [self.storyboard instantiateViewControllerWithIdentifier:@"phoneVideoSectionChangeViewController"];
    
    [self presentViewController:theController animated:NO completion:nil];
    
}


@end
