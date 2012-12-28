//
//  ItemViewController.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/23.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

//@property (nonatomic, weak) IBOutlet UIImageView *gameImageView;
@property (nonatomic, weak) IBOutlet UIButton *button;
-(IBAction)dropdownItem:(id)sender;

-(void)didTap;

@end

@implementation ItemViewController

@synthesize theDelegate = _theDelegate;
//@synthesize gameImageView = _gameImageView;
@synthesize button = _button;
@synthesize scrollView = _scrollView;
@synthesize imageForDown = _imageForDown;
@synthesize imageForNormal = _imageForNormal;
@synthesize index = _index;
@synthesize tableNumber = _tableNumber;
@synthesize gameType = _gameType;
@synthesize storyboardControllerID = _storyboardControllerID;

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
    
    //_gameImageView.image = imageNormal;
    [_button setImage:imageNormal forState:UIControlStateNormal];
    [_button setImage:imageDown forState:UIControlStateHighlighted];
    [_button setImage:imageDown forState:UIControlStateSelected];
    [_button addTarget:self action:@selector(didTap) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dropdownItem:(id)sender
{
    //inform delegate this item dropdown
    if([_theDelegate respondsToSelector:@selector(ItemViewControllerDidDropdown:)])
    {
        [_theDelegate ItemViewControllerDidDropdown:self];
    }
}

-(void)didTap
{
    //inform delegate this item selected
    if([_theDelegate respondsToSelector:@selector(ItemViewControllerDidSelected:)])
    {
        [_theDelegate ItemViewControllerDidSelected:self];
    }
    
}

#pragma mark - read write images
-(void)setImageForNormal:(UIImage *)imageForNormal
{
    imageNormal = imageForNormal;
    
}

-(void)setImageForDown:(UIImage *)imageForDown
{
    imageDown = imageForDown;
}

-(UIImage *)imageForNormal
{
    return imageNormal;
}

-(UIImage *)imageForDown
{
    return imageDown;
}


@end
