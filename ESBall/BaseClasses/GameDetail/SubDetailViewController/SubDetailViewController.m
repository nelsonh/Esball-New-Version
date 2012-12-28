//
//  SubDetailViewController.m
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "SubDetailViewController.h"

@interface SubDetailViewController ()

@end

@implementation SubDetailViewController

@synthesize theDelegate = _theDelegate;

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
-(void)removeFromParentViewController
{
    [self.view removeFromSuperview];
    [self willMoveToParentViewController:nil];
    [super removeFromParentViewController];
    
    if([_theDelegate respondsToSelector:@selector(SubDetailViewControllerDidRemoveFromParentController:)])
    {
        [_theDelegate SubDetailViewControllerDidRemoveFromParentController:self];
    }
}

#pragma mark - public interface

-(void)addToController:(UIViewController *)parentController inRect:(CGRect)newRect
{
    [parentController addChildViewController:self];
    [parentController.view addSubview:self.view];
    
    //CGRect newRect = CGRectMake(pos.x, pos.y, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = newRect;
    
    if([_theDelegate respondsToSelector:@selector(SubDetailViewControllerDidAddToParentController:)])
    {
        [_theDelegate SubDetailViewControllerDidAddToParentController:self];
    }
}

@end
