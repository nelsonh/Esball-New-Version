//
//  GameDetailViewController.m
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "GameDetailViewController.h"

@interface GameDetailViewController ()

@end

@implementation GameDetailViewController

@synthesize theDelegate = _theDelegate;
@synthesize bankerNameLabel = _bankerNameLabel;
@synthesize tableNameLabel = _tableNameLabel;
@synthesize currencyLabel = _currencyLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"game detail dealloc");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if([_theDelegate respondsToSelector:@selector(GameDetailViewControllerNameForDealer:)])
    {
        _bankerNameLabel.text = [_theDelegate GameDetailViewControllerNameForDealer:self];
    }
    
    if([_theDelegate respondsToSelector:@selector(GameDetailViewControllerNameForTable:)])
    {
        _tableNameLabel.text = [_theDelegate GameDetailViewControllerNameForTable:self];
    }
    
    if([_theDelegate respondsToSelector:@selector(GameDetailViewControllerNameForCurrency:)])
    {
        _currencyLabel.text = [_theDelegate GameDetailViewControllerNameForCurrency:self];
    }
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
    
    if([_theDelegate respondsToSelector:@selector(GameDetailViewControllerDidRemoveFromParentController:)])
    {
        [_theDelegate GameDetailViewControllerDidRemoveFromParentController:self];
    }
}

#pragma mark - public interface
-(void)addToConrtoller:(UIViewController *)parentController inPosition:(CGPoint)pos
{
    [parentController addChildViewController:self];
    [parentController.view addSubview:self.view];
    
    CGRect newRect = CGRectMake(pos.x, pos.y, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = newRect;
    
    if([_theDelegate respondsToSelector:@selector(GameDetailViewControllerDidAddToParentController:)])
    {
        [_theDelegate GameDetailViewControllerDidAddToParentController:self];
    }
}

@end
