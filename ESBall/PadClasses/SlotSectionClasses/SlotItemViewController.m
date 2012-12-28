//
//  SlotItemViewController.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/27.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "SlotItemViewController.h"

@interface SlotItemViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *slotImageView;

@end

@implementation SlotItemViewController

@synthesize slotImageView = _slotImageView;

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
    
    _slotImageView.image = slotImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - slot image read write
-(void)setImageForSlot:(UIImage *)imageForSlot
{
    slotImage = imageForSlot;
}

-(UIImage *)imageForSlot
{
    return slotImage;
}

@end
