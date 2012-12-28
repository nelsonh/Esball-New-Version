//
//  SlotSectionViewController.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/27.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "SlotSectionViewController.h"
#import "SlotItemViewController.h"

@interface SlotSectionViewController ()

@property (nonatomic, weak) IBOutlet ListScrollView *scrollView;
-(void)loadData;

@end

@implementation SlotSectionViewController

@synthesize scrollView = _scrollView;

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
    [self loadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [_scrollView initWithDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData
{
    slotItemData = [[NSMutableArray alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SlotSection" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSDictionary *items = [dic objectForKey:@"Items"];
    NSArray *keys = [dic objectForKey:@"keyForItems"];
    
    for(NSString *key in keys)
    {
        NSDictionary *content = [items objectForKey:key];
        UIImage *slotImage = [UIImage imageNamed:[content objectForKey:@"SlotImage"]];
        
        SlotItemViewController *slotItem = [self.storyboard instantiateViewControllerWithIdentifier:@"SlotItemViewController"];
        
        if(!slotImage)
            NSLog(@"Slot image is nil");
        
        slotItem.imageForSlot = slotImage;
        
        [slotItemData addObject:slotItem];

    }
}

#pragma mark - ListScrollView delegate
-(NSUInteger)ListScrollViewNumberOfItem:(ListScrollView *)scrollView
{
    return [slotItemData count];
}

-(ItemViewController *)ListScrollView:(ListScrollView *)scrollView itemForIndex:(NSUInteger)itemIndex
{
    return [slotItemData objectAtIndex:itemIndex];
}

@end
