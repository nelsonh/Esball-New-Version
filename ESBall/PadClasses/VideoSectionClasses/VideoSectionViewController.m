//
//  SportSectionViewController.m
//  ESBall
//
//  Created by nelson on 12/11/15.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "VideoSectionViewController.h"
#import "ItemViewController.h"
#import "FileFinder.h"

#define kMaxDropdownItems 3
#define kSpaceWidth 5
#define kOffsetForItemDropdown 2

@interface VideoSectionViewController ()

-(void)loadItemData;
-(void)createDropdownitemWithItem:(ItemViewController *)item;
-(void)displayDropdownItemWithItem;
-(void)enterGame;
-(void)displayLoadingView;
-(void)dismissLoadingView;

@property (nonatomic, weak) IBOutlet ListScrollView *scrollView;//ListScrollView


@end

@implementation VideoSectionViewController

@synthesize scrollView = _scrollView;


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
    NSLog(@"video section dealloc");
}

-(void)loadView
{
    [super loadView];
    
    ServerInterface *theInterface = [ServerInterface serverInterface];
    theInterface.theDelegate = self;
    
    //isChangingTable = NO;
    tableNumberToChange = -1;
    
    [self loadItemData];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    rectForListScrollView = _scrollView.frame;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    removedItemDataIndex = [[NSMutableArray alloc] init];
    
    [_scrollView initWithDelegate:self];

    //test purpose
    tableNumberToChange = 0;
    gameTypeNumberToChange = 3001;
    storyboardControllerID = @"PadBaccaratGameViewController";
    [self enterGame];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Internal
-(void)loadItemData
{
    /**
     create ItemViewController from VideoSection.plist
     **/
    itemsData = [[NSMutableArray alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"VideoSection" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSDictionary *items = [dic objectForKey:@"Items"];
    NSArray *keys = [dic objectForKey:@"KeyForItems"];
    
    FileFinder *fileFinder = [FileFinder fileFinder];

    int index = 0;
    for(NSString *key in keys)
    {
        NSDictionary *content = [items objectForKey:key];
        
        NSString *imageName = [content objectForKey:@"ImageNormal"];
        UIImage *imageNormal = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];

        if(!imageNormal)
            NSLog(@"%@ not found", imageName);
        
        imageName = [content objectForKey:@"ImageDown"]; 
        UIImage *imageDown = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
        
        if(!imageDown)
            NSLog(@"%@ not found", imageName);
        
        NSNumber *tableNumber = [content objectForKey:@"TableNumber"];
        NSNumber *gameTypeNumber = [content objectForKey:@"GameType"];
        int tableNo = [tableNumber intValue];
        int gameType = [gameTypeNumber intValue];
        NSString *controllerIdentifier = [content objectForKey:@"StoryboardControllerID"];
        
        
        ItemViewController *item = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemViewController"];
        
       /*
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 330, 300)];
        //view.autoresizesSubviews = NO;
        view.backgroundColor = [UIColor redColor];
        //item.view = view;
        */
        
        item.imageForNormal = imageNormal;
        item.imageForDown = imageDown;
        item.index = index;
        item.tableNumber = tableNo;
        item.gameType = gameType;
        item.storyboardControllerID = controllerIdentifier;
        
        [itemsData addObject:item];
        index++;
    }
    
    //get a copy for itemDataOrigin
    itemsDataOrigin = [NSMutableArray arrayWithArray:itemsData];
}

-(void)enterGame
{
    BaseGameViewController *gameController = [self.storyboard instantiateViewControllerWithIdentifier:storyboardControllerID];
    gameController.theDelegate = self;
    gameController.tableNumber = tableNumberToChange;
    gameController.gameType = gameTypeNumberToChange;
    //we want game controller to take care pause and resume when disappear
    gameController.autoPauseGameWhenDisappear = YES;
    [self addChildViewController:gameController];
    [self.view addSubview:gameController.view];
    
    //make sure loading hud is on top
    if(loadingHUD)
        [self.view bringSubviewToFront:loadingHUD];
}

-(void)displayLoadingView
{
    /**loading hud**/
    
    NSString *animFilePath = [[NSBundle mainBundle] pathForResource:@"LoadingAnim" ofType:@"plist"];
    NSArray *animImageNames = [NSArray arrayWithContentsOfFile:animFilePath];
    NSMutableArray *animImages = [[NSMutableArray alloc] init];
    
    for(NSString *imageName in animImageNames)
    {
        FileFinder *fileFinder = [FileFinder fileFinder];
        UIImage *image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
        [animImages addObject:image];
    }
    
    loadingHUD = [[LoadingHUD alloc] initWithFrame:self.view.bounds loadingAnimImages:animImages];
    
    [self.view addSubview:loadingHUD];
    
    /**loading hud**/
}

-(void)dismissLoadingView
{
    if(loadingHUD)
    {
        [loadingHUD removeFromSuperview];
        loadingHUD = nil;
    }
}

#pragma mark - Item drop down
-(void)createDropdownitemWithItem:(ItemViewController *)item
{
    //make sure current number of ItemDropdownViewController are not exceed max number
    if([self.childViewControllers count]>=kMaxDropdownItems)
    {
        NSLog(@"ItemDropdown is full");
        return;
    }
    
    /**
     create new ItemDropDownController base on specific item
     **/
    
    //ItemViewController *item = [itemsData objectAtIndex:itemIndex];
    //get back normal image test
    UIImage *imageNormal = item.imageForNormal;

    ItemDropdownViewController *newItemDropdownController = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemDropdownViewController"];
    newItemDropdownController.theDelegate = self;
    newItemDropdownController.imageForMain = imageNormal;
    newItemDropdownController.index = item.index;
    
    //add controller to this controller's view container as child controller
    [self addChildViewController:newItemDropdownController];
    [self.view addSubview:newItemDropdownController.view];
    
    /**remove item data**/
    //remember index that will be removed
    NSNumber *index = [NSNumber numberWithUnsignedInt:item.index];
    [removedItemDataIndex addObject:index];
    //remove item data
    [itemsData removeObject:item];
    
    //display ItemDropdownView
    [self displayDropdownItemWithItem];
    
    [_scrollView reloadData];
}

-(void)displayDropdownItemWithItem
{
    //find out index of item dropdown controlelr
    //int index = [self.childViewControllers indexOfObject:dropdownController];
    
    CGFloat itemDropdownViewWidth;
    CGFloat itemDropdownViewHeight;
    
    //a model view controller, use it for default properties on visual
    ItemDropdownViewController *modelController =[self.storyboard instantiateViewControllerWithIdentifier:@"ItemDropdownViewController"];
    
    for(int i=0; i<[self.childViewControllers count]; i++)
    {
        ItemDropdownViewController *dropdownController = [self.childViewControllers objectAtIndex:i];
        
        itemDropdownViewWidth = modelController.view.frame.size.width;
        itemDropdownViewHeight = modelController.view.frame.size.height;
        CGRect newItemDropdownRect = CGRectZero;
        CGFloat xPos = 0;
        CGFloat yPos = 0;
        
        //calculate x position
        xPos = (i*itemDropdownViewWidth) + ((i+1)*kSpaceWidth);
        //make y position as same as ListScrollView's y position
        yPos = rectForListScrollView.origin.y;
        
        newItemDropdownRect = CGRectMake(xPos, yPos+kOffsetForItemDropdown, itemDropdownViewWidth, itemDropdownViewHeight-kOffsetForItemDropdown);
        dropdownController.view.frame = newItemDropdownRect;
        
    }

    

    
    //[self.view addSubview:dropdownController.view];
    
    /**resize ListScrollView**/
    int numberOfItemDropdown = [self.childViewControllers count];
    CGFloat totalWidth = (numberOfItemDropdown*itemDropdownViewWidth) + ((numberOfItemDropdown+1)*kSpaceWidth);
    CGFloat listScrollViewWidth = rectForListScrollView.size.width - totalWidth -1;
    
    CGRect newRectForListScrollView = CGRectMake(totalWidth, rectForListScrollView.origin.y, listScrollViewWidth, rectForListScrollView.size.height);
    _scrollView.frame = newRectForListScrollView;
    
}

#pragma mark - ListScrollView delegate
-(NSUInteger)ListScrollViewNumberOfItem:(ListScrollView *)scrollView
{
    return [itemsData count];
}

-(ItemViewController *)ListScrollView:(ListScrollView *)scrollView itemForIndex:(NSUInteger)itemIndex
{
    return [itemsData objectAtIndex:itemIndex];
}

-(void)ListScrollView:(ListScrollView *)scrollView didSelectItemAtIndex:(NSUInteger)itemIndex
{
    
    /**
     change table
     **/
    NSLog(@"tap on item :%i", itemIndex);
    
    ItemViewController *item = [scrollView itemViewControllerByIndex:itemIndex];
    int tableNo = item.tableNumber;
    int gameTypeNo = item.gameType;
    NSString *controllerID = [NSString stringWithString:item.storyboardControllerID];
    
    //if table game is not availiable -1 as result 
    if(tableNo<0)
    {
        NSString *msg = NSLocalizedString(@"Working in progress", @"Working in progress");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"OK") otherButtonTitles: nil];
        
        [alertView show];
        return;
    }
    

    
    //ServerInterface *theInterface  = [ServerInterface serverInterface];
    
    //NSLog(@"gameType:%i", gameTypeNo);
    //NSLog(@"table:%i", tableNo);
    /*
    NSString *loginMsg = @"login\n";
    [theInterface sendDataToServerWithData:[loginMsg dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSString *gameTypeMsg = [NSString stringWithFormat:@"%i\n", gameTypeNo];
    [theInterface sendDataToServerWithData:[gameTypeMsg dataUsingEncoding:NSASCIIStringEncoding]];
    */
    
    /*
    NSString *msg = @"turn\n";
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    
    msg = [NSString stringWithFormat:@"%i\n", tableNo];
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    */
    
    /*
    msg = @"login\n";
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    */
    
    //mark it changing table
    //isChangingTable = YES;
    
    /**
     save game info and use it later when enter proper game
     **/
    tableNumberToChange = tableNo;
    gameTypeNumberToChange = gameTypeNo;
    storyboardControllerID = controllerID;
    
    [self enterGame];
    
    //loading view
    [self displayLoadingView];
}

-(void)ListScrollView:(ListScrollView *)scrollView didDropdownItemWithItem:(ItemViewController *)item
{
    [self createDropdownitemWithItem:item];
}

#pragma mark - ItemDropdownViewController delegate
-(void)ItemDropdownViewControllerDidDismiss:(ItemDropdownViewController *)item
{
    /**remove dropped one**/
    [item.view removeFromSuperview];
    [item willMoveToParentViewController:nil];
    [item removeFromParentViewController];
    
    /**recreate items by comparing dropdownview**/
    NSMutableArray *newItemsData = [NSMutableArray arrayWithArray:itemsDataOrigin];
    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];
    
    
    for(ItemDropdownViewController *item in self.childViewControllers)
    {
        [indexSet addIndex:item.index];
    }
    
    [newItemsData removeObjectsAtIndexes:indexSet];
    
    itemsData = newItemsData;
    
    //reload listScrollView data
    [_scrollView reloadData];
    
    //disply dropdown item
    [self displayDropdownItemWithItem];
}

#pragma mark - BaseGameViewController delegate
-(void)BaseGameViewControllerIsReady:(BaseGameViewController *)controller
{
    [self dismissLoadingView];
}

-(void)BaseGameViewControllerDidDismiss:(BaseGameViewController *)controller
{
    //NSLog(@"child count:%i", self.childViewControllers.count);
    ServerInterface *theInterface = [ServerInterface serverInterface];
    theInterface.theDelegate = self;
}

/*
#pragma mark ServerInterface delegate
-(void)ServerInterface:(ServerInterface *)interFace didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
 */
    /**weird logic**/
/*
    //if it is changing table
    if(isChangingTable)
    {
        //unlock view
        self.view.userInteractionEnabled = YES;
        
        [self enterGame];
        
        if(loadingHUD)
            [self.view bringSubviewToFront:loadingHUD];
        
        isChangingTable = NO;
    }
}
*/
@end
