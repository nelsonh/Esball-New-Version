//
//  ItemDropdownViewController.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/26.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "ItemDropdownViewController.h"

@interface ItemDropdownViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *mainImage;
-(IBAction)dismiss:(id)sender;

@end

@implementation ItemDropdownViewController

@synthesize theDelegate = _theDelegate;
@synthesize mainImage = _mainImage;
@synthesize imageForMain = _imageForMain;
@synthesize index = _index;

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
    
    _mainImage.image = logoImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dismiss:(id)sender
{
    if([_theDelegate respondsToSelector:@selector(ItemDropdownViewControllerDidDismiss:)])
    {
        [_theDelegate ItemDropdownViewControllerDidDismiss:self];
    }
}

-(void)setImageForMain:(UIImage *)imageForMain
{
    logoImage = imageForMain;
}

-(UIImage *)imageForMain
{
    return logoImage;
}

@end
