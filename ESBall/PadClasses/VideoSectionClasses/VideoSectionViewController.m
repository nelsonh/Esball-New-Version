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
    [self stopAnyUpdate];
    
    NSLog(@"video section dealloc");
}

-(void)loadView
{
    [super loadView];
    
    ServerInterface *theInterface = [ServerInterface serverInterface];
    theInterface.theDelegate = self;
    
    //isChangingTable = NO;
    tableNumberToChange = -1;
    
    roadmapUpdateInterval = 0.1;
    
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

    /*
    //test purpose
    tableNumberToChange = 0;
    gameTypeNumberToChange = 3001;
    storyboardControllerID = @"PadBaccaratGameViewController";
    [self enterGame];
     */
    
    [self startUpdate];
    
    roadmapUpdateInterval = 3;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - stop update
-(void)stopAnyUpdate
{
    //stop count down update
    [self stopPullDataForCounDown];
    
    
    for(int i = 0; i < _scrollView.itemCount; i++)
    {
        ItemViewController *item = [_scrollView itemViewControllerByIndex:i];
        
        [item stopRoadmapUpdate];
    }
}

-(void)startUpdate
{
    //start count down update
    [self startPullDataForCountDown];
    
    for(int i = 0; i < _scrollView.itemCount; i++)
    {
        ItemViewController *item = [_scrollView itemViewControllerByIndex:i];
        
        [item startRoadmapUpdate];
    }
}

#pragma mark - count down time
-(void)startPullDataForCountDown
{
    [self stopPullDataForCounDown];
    
    pullCountDownDataTimer = [NSTimer scheduledTimerWithTimeInterval:roadmapUpdateInterval target:self selector:@selector(doPullDataForCountDown) userInfo:nil repeats:YES];
    
}

-(void)stopPullDataForCounDown
{
    //stop timer
    if(pullCountDownDataTimer)
    {
        [pullCountDownDataTimer invalidate];
        pullCountDownDataTimer = nil;
    }
    
    //stop connection
    if(countDownDataConnection)
    {
        [countDownDataConnection cancel];
        countDownDataConnection = nil;
    }
    
    //clear data
    countDownData = nil;
}

-(void)doPullDataForCountDown
{
    if(countDownData == nil)
    {
        NSURL *url = [NSURL URLWithString:@"http://183.182.66.167/8eea62084ca7e541d918e823422bd82e.htm"];
        NSMutableURLRequest *countDownDataRequest = [NSMutableURLRequest requestWithURL:url];
        [countDownDataRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        countDownDataConnection = [NSURLConnection connectionWithRequest:countDownDataRequest delegate:self];
    }
}

-(NSArray *)parseCountDownTimeDataWithData:(NSData *)data
{
    /** example
     3001;1;A;23-0;29272267;MICHELLE;waiting;0;,,,,,;25;
     3001;2;B;22-0;29272257;JONA;waiting;0;,,,,,;5;
     3001;3;C;22-61;29272321;MARIEL;waiting;0;H.1,D.11,S.11,H.2,H.9,C.9;25;
     3001;6;D;22-4;29272332;TONI;betting;9;,,,,,;0;
     3001;7;E;22-57;29272322;MICHELLE P.;waiting;0;H.3,D.13,C.3,C.11,,C.6;83;
     3002;1;A;151-2;29272336;MARIZ Q.;betting;19;,,,,,,,;0;;
     3003;1;A;15-66;29272325;PREE;waiting;0;S.7,S.10;689;
     3006;1;A;366-2;29272318;MARIZ;dealing;0;D.6,D.4,H.10,S.3,S.4,,D.8,H.12;0;1,3;
     3007;1;A;1-3030;29272326;YHAN;betting;17;;0;
     3008;1;A;1-1623;29272333;ZELLE;betting;8;;0;
     HTTP/1.1 END,
     
     **/
    
    
    if(!itemsData)
        return nil;
    
    
    NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSArray *splited = [dataStr componentsSeparatedByString:@"\n"];
    
    NSMutableArray *returnData = [[NSMutableArray alloc] init];
    
    for(NSString *rowStr in splited)
    {
        if([rowStr hasPrefix:@"HTTP"] || [rowStr isEqualToString:@""])
            continue;
        
        NSArray *subSplited = [rowStr componentsSeparatedByString:@";"];
        
        int gameType = [[subSplited objectAtIndex:0] intValue];
        int infoTableNumber = [[subSplited objectAtIndex:1] intValue];

        
        for(ItemViewController *item in itemsData)
        {
            if(gameType == item.gameType && infoTableNumber == item.infoTableNumber)
            {
                [returnData addObject:[subSplited objectAtIndex:7]];
                
                break;
            }
        }
        
        /*
        switch (gameType) {
            case 3001:
            {
                [returnData addObject:[subSplited objectAtIndex:7]];
                break;
            }
            case 3003:
            {
                [returnData addObject:[subSplited objectAtIndex:7]];
                break;
            }
            default:
                break;
        }
         */
    }
    
    return returnData;
}

-(void)updateCountDownTime
{
    if(countDownData == nil)
        return;
    
    NSArray *parsedData = [self parseCountDownTimeDataWithData:countDownData];
    
    if(!parsedData || parsedData.count == 0)
        return;
    
    for(int i = 0; i < _scrollView.itemCount; i++)
    {
        ItemViewController *item = [_scrollView itemViewControllerByIndex:i];
        NSUInteger time = [[parsedData objectAtIndex:i] intValue];
        
        [item updateTimeWithTime:time];
    }
}

/*
#pragma mark - public interface
-(IBAction)enterGameBtnTapped:(id)sender
{
    if(selectedItem)
    {
        //enter game
        [self enterGame];
        
        //loading view
        [self displayLoadingView];
        
        //stop any update
        [self stopAnyUpdate];
    }
    else
    {
        NSString *msg = NSLocalizedString(@"请选择想要进入的游戏", @"请选择想要进入的游戏");
        
        UIAlertView *noneSelectAlert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        
        [noneSelectAlert show];
    }
}

-(IBAction)logout:(id)sender
{
    ServerInterface *theInterface = [ServerInterface serverInterface];
    
    [theInterface logout];
}
 */

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
        NSNumber *infoTableNumber = [content objectForKey:@"InfoTableNumber"];
        NSNumber *gameTypeNumber = [content objectForKey:@"GameType"];
        int tableNo = [tableNumber intValue];
        int infoTableNo = [infoTableNumber intValue];
        int gameType = [gameTypeNumber intValue];
        NSString *tableName = [content objectForKey:@"TableName"];
        NSString *controllerIdentifier = [content objectForKey:@"StoryboardControllerID"];
        
        NSString *itemControllerIdentifier = [content objectForKey:@"ItemControllerID"];
        if([itemControllerIdentifier isEqualToString:@""])
            continue;
        
        
        ItemViewController *item = [self.storyboard instantiateViewControllerWithIdentifier:itemControllerIdentifier];
        
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
        item.infoTableNumber = infoTableNo;
        item.gameType = gameType;
        item.tableName = tableName;
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
    
    //extract info
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
    

    /**current not use**/
    
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
    
    /*
    //disconnect previous one 
    ServerInterface *theInterface = [ServerInterface serverInterface];
    
    NSString *msg = @"turn\n";
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    
    msg = [NSString stringWithFormat:@"%i\n", 0];
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
     */
    
    /**current not use**/
    
    /**
     save game info and use it later when enter proper game
     **/
    tableNumberToChange = tableNo;
    gameTypeNumberToChange = gameTypeNo;
    storyboardControllerID = controllerID;
    
    
    [self enterGame];
    
    //loading view
    [self displayLoadingView];
     
    
    /*
    if(item == selectedItem)
        return;

    //deselect current selected item if needed
    if(selectedItem)
    {
        [selectedItem deselectItem];
    }
    selectedItem = item;//track item
     */
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
    
    //start update that was suspended
    [self startUpdate];
}

#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    /**
     a new connection to count down data has established
     **/
    countDownData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //append data
    [countDownData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [connection cancel];
    
    //update count down time
    [self updateCountDownTime];
    
    //clear data
    countDownData = nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [connection cancel];
    
    //clear data
    countDownData = nil;
    
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
