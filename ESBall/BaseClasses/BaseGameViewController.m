//
//  BaseGameViewController.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BaseGameViewController.h"
#import "FileFinder.h"

@interface BaseGameViewController ()

@end



@implementation BaseGameViewController

@synthesize theDelegate = _theDelegate;
@synthesize tableNumber = _tableNumber;
@synthesize gameType = _gameType;
@synthesize autoPauseGameWhenDisappear = _autoPauseGameWhenDisappear;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(_autoPauseGameWhenDisappear)
        [self resume];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if(_autoPauseGameWhenDisappear)
        [self pause];
}

-(void)dealloc
{
    NSLog(@"game dealloc");
   //remove notification
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UserInfoReadyNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UpdateInfoReayNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MarqueeInfoReadyNotification object:nil];
    
}

-(void)loadView
{
    [super loadView];
    
    ServerInterface *theInterface = [ServerInterface serverInterface];
    theInterface.theDelegate = self;
    
    isFirstTime = YES;
    
    loginGameTypeCommandSent = NO;

}

-(void)viewDidUnload
{
    NSLog(@"view did unload");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
#ifdef DEBUG
    if(!(isTableNumberSet&&isGameTypeSet))
    {
        InternalErrorAlert(self ,@"Internal error", @"Table number or Game type was not given");
    }
#endif
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleUserInfo:) name:UserInfoReadyNotification object:nil];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(handleUpdateInfo:) name:UpdateInfoReayNotification object:nil];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(handleMarqueeInfo:) name:MarqueeInfoReadyNotification object:nil];
    
    
    ServerInterface *theInterface = [ServerInterface serverInterface];
    
    NSLog(@"gameType:%i", _gameType);
    NSLog(@"table:%i", _tableNumber);
    
    /*
    NSString *msg = @"turn\n";
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    
    msg = [NSString stringWithFormat:@"%i\n", _tableNumber];
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    */
    
    /*
    NSString *loginMsg = @"login\n";
    [theInterface sendDataToServerWithData:[loginMsg dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSString *gameTypeMsg = [NSString stringWithFormat:@"%i\n", _gameType];
    [theInterface sendDataToServerWithData:[gameTypeMsg dataUsingEncoding:NSASCIIStringEncoding]];
     */
    
    
    NSString *msg = @"turn\n";
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    
    msg = [NSString stringWithFormat:@"%i\n", _tableNumber];
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    
    
    
    /*
    //inform server we need user information
    NSString *getUserInfoMsg = @"userInfo\n";
    [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"did request UserInfo");
    */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public interface
-(IBAction)back:(id)sender
{
    [self.view removeFromSuperview];
    [self willMoveToParentViewController:nil];
    [self removeFromParentViewController];
    
    if([self.theDelegate respondsToSelector:@selector(BaseGameViewControllerDidDismiss:)])
    {
        [self.theDelegate BaseGameViewControllerDidDismiss:self];
    }
}

-(IBAction)roadmap:(id)sender
{
    
}

-(IBAction)clearBet:(id)sender
{
    
}

-(IBAction)betConfirm:(id)sender
{
    
}

-(IBAction)detail:(id)sender
{
    
}

-(IBAction)record:(id)sender
{
    
}

-(void)pause
{
    //stop taking info from server interface
    ServerInterface *theInterface = [ServerInterface serverInterface];
    theInterface.theDelegate = nil;
}

-(void)resume
{
    //take info from server interface
    ServerInterface *theInterface = [ServerInterface serverInterface];
    theInterface.theDelegate = self;
}

#pragma mark - Internal
-(void)sendMessageToServerWithMessage:(NSString *)msg
{
    NSData *msgData = [msg dataUsingEncoding:NSASCIIStringEncoding];
    ServerInterface *theInterface = [ServerInterface serverInterface];
    [theInterface sendDataToServerWithData:msgData];
}

-(void)playGame
{

    
    //tell server to send update information back
    ServerInterface *theInterface = [ServerInterface serverInterface];
    
    NSString *getUpdateMsg = @"videoLink\n";
    [theInterface sendDataToServerWithData:[getUpdateMsg dataUsingEncoding:NSASCIIStringEncoding]];
    
    getUpdateMsg = [NSString stringWithFormat:@"%i\n", _gameType];
    [theInterface sendDataToServerWithData:[getUpdateMsg dataUsingEncoding:NSASCIIStringEncoding]];
    
    getUpdateMsg = [NSString stringWithFormat:@"%i\n", userInfo.gameCode];
    [theInterface sendDataToServerWithData:[getUpdateMsg dataUsingEncoding:NSASCIIStringEncoding]];
    
}

-(void)handleUserInfo:(NSNotification*)notificationb
{
    ServerInterface *theInterface = [ServerInterface serverInterface];
    NSString *tablelistMsg = @"tableList\n";
    [theInterface sendDataToServerWithData:[tablelistMsg dataUsingEncoding:NSASCIIStringEncoding]];
    
    tablelistMsg = [NSString stringWithFormat:@"%i\n", _gameType];
    [theInterface sendDataToServerWithData:[tablelistMsg dataUsingEncoding:NSASCIIStringEncoding]];
}

-(void)handleUpdateInfo:(NSNotification*)notification
{
    
    if(isFirstTime)
    {
        if([_theDelegate respondsToSelector:@selector(BaseGameViewControllerIsReady:)])
        {
            [_theDelegate BaseGameViewControllerIsReady:self];
        }
        
        isFirstTime = NO;
    }
}

-(void)handleMarqueeInfo:(NSNotification*)notification
{

}

#pragma mark - getter setter
-(void)setTableNumber:(NSUInteger)tableNumber
{
    
    _tableNumber = tableNumber;
    isTableNumberSet = YES;
}

-(void)setGameType:(NSUInteger)gameType
{
    _gameType = gameType;
    isGameTypeSet = YES;
}



#pragma mark - ServiceInterface delegate
-(void)ServerInterface:(ServerInterface *)interface didReceivedRespond:(NSString *)respondStr
{
    if([respondStr rangeOfString:@"onLogin"].length > 0 && loginGameTypeCommandSent)
    {
        ServerInterface *theInterface = [ServerInterface serverInterface];
        //inform server we need user information
        NSString *getUserInfoMsg = @"userInfo\n";
        [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
        
        getUserInfoMsg = [NSString stringWithFormat:@"%i\n", _gameType];
        [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
        
        NSLog(@"did request UserInfo");
    }
    else if([respondStr rangeOfString:@"onUserInfo"].length>0)
    {
        
        //init user info and parser xml, assign UserInfo as well
        userInfo = [[UserInfo alloc] init];
        [userInfo convertToDataFromXMLString:respondStr];
        NSLog(@"did get UserInfo");
        
    }
    else if([respondStr rangeOfString:@"onTableList"].length>0)
    {
        [self playGame];
    }
    else if([respondStr rangeOfString:@"onUpdateMarquee"].length>0)
    {
        //init marquee info and parser xml, assign UpdateInfo as well
        marqueeInfo = [[MarqueeInfo alloc] init];
        [marqueeInfo convertToDataFromXMLString:respondStr];
        
        //NSLog(@"did get marquee");
    }
    else if([respondStr rangeOfString:@"onUpdate"].length>0 && loginGameTypeCommandSent)
    {
        //init update info and parser xml, assign UpdateInfo as well
        updateInfo = [[UpdateInfo alloc] init];
        [updateInfo convertToDataFromXMLString:respondStr];
    }

     
}


-(void)ServerInterface:(ServerInterface *)interface didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    
    ServerInterface *theInterface = [ServerInterface serverInterface];
    //inform server we need user information
    NSString *getUserInfoMsg = @"login\n";
    [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
    
    
    getUserInfoMsg = [NSString stringWithFormat:@"%i\n", _gameType];
    [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
    
    loginGameTypeCommandSent = YES;
    
    
    NSLog(@"request login with gameType:%i", _gameType);
     
}



@end
