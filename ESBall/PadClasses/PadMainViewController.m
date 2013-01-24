//
//  MainViewController.m
//  ESBall
//
//  Created by nelson on 12/11/14.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

/**
 StroyboardID contain key GameTypes to object arrary, which 
 contain storyboard id for view controllers
 **/

#import "PadMainViewController.h"
#import "FSVerticalTabBarController.h"
#import "FileFinder.h"


@interface PadMainViewController ()

@end

//key for GameTypes in file StoryboardID
const static NSString *keyGameTypes = @"GameTypes";

@implementation PadMainViewController

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
    NSLog(@"Pad main view dealloc");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.delegate = self;
    
    //contain controllers that will be added to tabbar
    NSMutableArray *controllersToAdd ;
    NSArray *gameTypesStr;
    
    //get back StoryboardID file path
    NSString *storyboardIDPath = [[NSBundle mainBundle] pathForResource:@"StoryboardID" ofType:@"plist"];
    if(storyboardIDPath != nil)
    {
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:storyboardIDPath];
        
        gameTypesStr = [NSArray arrayWithArray:[dic objectForKey:keyGameTypes]];
    }
    else
    {
        NSLog(@"can not find StoryboardID file from bundle");
        
        return;
    }
    
    if(gameTypesStr != nil)
    {
        controllersToAdd = [[NSMutableArray alloc] init];
        
        FileFinder *filefinder = [FileFinder fileFinder];
        
        //create view controller from storyboard with given storyboard identifier
        for(int i=0; i<[gameTypesStr count]; i++)
        {
            NSString *storyboardId = [gameTypesStr objectAtIndex:i];
            UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:storyboardId];
            NSString *title = storyboardId;
            viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:@"magnifying-glass.png"]] tag:0];
            
            [controllersToAdd addObject:viewController];
        }
    }
    else
    {
        NSLog(@"can not get storyboard ID");
    }
    
    //set controller for tabbar
    [self setViewControllers:[NSArray arrayWithArray:controllersToAdd]];
    
    //set background color
    NSArray *colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor, (id)[UIColor lightGrayColor].CGColor, nil];
    self.tabBar.backgroundGradientColors = colors;
    
    self.selectedViewController = [controllersToAdd objectAtIndex:0];
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //only landscape
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark - FSVerticalTabBarConrtoller delegate
- (void)tabBarController:(FSVerticalTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"selected controller:%@", viewController);
}

- (BOOL)tabBarController:(FSVerticalTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}


@end
