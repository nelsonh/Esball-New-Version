//
//  AppDelegate.m
//  ESBall
//
//  Created by nelson on 12/11/14.
//  Copyright (c) 2012年 nelson. All rights reserved.
//
//12/12/20

#import "AppDelegate.h"

@interface AppDelegate ()

-(void)registerUserDefault;

@end


@implementation AppDelegate

void uncaughtExceptionHandler(NSException *exception) {
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // Internal error reporting
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

{
    gameRestoreBetInfos = [[NSMutableDictionary alloc] init];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {    // The iOS device = iPhone or iPod Touch
        
        
        CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
        
        if (iOSDeviceScreenSize.height == 480)
        {   // iPhone 3GS, 4, and 4S and iPod Touch 3rd and 4th generation: 3.5 inch screen (diagonally measured)
            
            // Instantiate a new storyboard object using the storyboard file named Storyboard_iPhone35
            UIStoryboard *iPhone35Storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone35" bundle:nil];
            
            // Instantiate the initial view controller object from the storyboard
            UIViewController *initialViewController = [iPhone35Storyboard instantiateInitialViewController];
            
            // Instantiate a UIWindow object and initialize it with the screen size of the iOS device
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            
            // Set the initial view controller to be the root view controller of the window object
            self.window.rootViewController  = initialViewController;
            
            // Set the window object to be the key window and show it
            [self.window makeKeyAndVisible];
        }
        
        if (iOSDeviceScreenSize.height == 568)
        {   // iPhone 5 and iPod Touch 5th generation: 4 inch screen (diagonally measured)
            
            // Instantiate a new storyboard object using the storyboard file named Storyboard_iPhone4
            UIStoryboard *iPhone4Storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone40" bundle:nil];
            
            // Instantiate the initial view controller object from the storyboard
            UIViewController *initialViewController = [iPhone4Storyboard instantiateInitialViewController];
            
            // Instantiate a UIWindow object and initialize it with the screen size of the iOS device
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            
            // Set the initial view controller to be the root view controller of the window object
            self.window.rootViewController  = initialViewController;
            
            // Set the window object to be the key window and show it
            [self.window makeKeyAndVisible];
        }
        
    }/* else if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
        
    {   // The iOS device = iPad
        
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
        
    }*/

    // Override point for customization after application launch.
    /*
    NSError *error;
    GCDAsyncSocket *theSocket = [AsyncSocket asyncSocket];
    theSocket.delegate = self;
    theSocket.delegateQueue = dispatch_get_main_queue();
    [theSocket connectToHost:@"183.182.66.239" onPort:10243 error:&error];
    
    if(error)
    {
        NSLog(@"unable to connect to host. error:%@", error);
    }
    else
    {
        NSLog(@"host connected");
        [theSocket writeData:[[NSString stringWithFormat:@"%@,%@\n", @"james1", @"pweptd11"] dataUsingEncoding:NSASCIIStringEncoding] withTimeout:10 tag:0];
        [theSocket writeData:[[NSString stringWithFormat:@"%i\n", 1] dataUsingEncoding:NSASCIIStringEncoding] withTimeout:10 tag:0];
    }
     */

#ifdef ErrorStackTraceDebug
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
#endif
    
    [self registerUserDefault];
    
     /*
     //AsyncSocket
    AsyncSocket *theSocket = [AsyncSocket asyncSocket];
    theSocket.theDelegate = self;
    BOOL success = [theSocket connectToHost:@"183.182.66.239" withPort:10243];
    
    if(!success)
    {
        NSLog(@"connect to host fail");
        
    }
     */
    
    [UIApplication sharedApplication].statusBarHidden = YES;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"read data");
}



-(void)registerUserDefault
{
    NSDictionary *registerDic = [NSDictionary dictionaryWithObjectsAndKeys:@"",LastUserLoginAccount, nil];

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault registerDefaults:registerDic];
    [userDefault synchronize];
}

//JAMES 13/01/02
-(void)initializeStoryBoardBasedOnScreenSize {
    
   }

#pragma mark - Restore bet info
-(NSDictionary *)restoreBetInfoWithGameType:(NSUInteger)gameType WithSerialNumber:(NSString *)serialNumber
{
    if(serialNumber == nil || [serialNumber isEqualToString:@""])
        return nil;
    
    NSString *keyInfo = @"Info";
    NSString *keySerialNumber = @"SerialNumber";
    
    NSString *gameTypeStr = [NSString stringWithFormat:@"%i", gameType];
    
    //if there is a match gamecode
    if([gameRestoreBetInfos objectForKey:gameTypeStr])
    {
        NSMutableDictionary *mutableDic = [gameRestoreBetInfos objectForKey:gameTypeStr];
        
        NSString *serialNumberStr = [mutableDic objectForKey:keySerialNumber];
        
        //if not match serial number return nil
        if(![serialNumberStr isEqualToString:serialNumber])
            return nil;
        
        //retrive data
        NSDictionary *info = [mutableDic objectForKey:keyInfo];
        
        //return data
        return info;
    }
    else
    {
        return nil;
    }

    return nil;
}

-(BOOL)setRestoreBetInfo:(NSDictionary *)info WithGameType:(NSUInteger)gameType WithSerialNumber:(NSString *)serialNumber
{
    if(info == nil || serialNumber == nil || [serialNumber isEqualToString:@""])
        return NO;
    
    NSString *keyInfo = @"Info";
    NSString *keySerialNumber = @"SerialNumber";
    
    NSString *gameTypeStr = [NSString stringWithFormat:@"%i", gameType];
    
    //if there is a info for specific gamecode already
    if([gameRestoreBetInfos objectForKey:gameTypeStr])
    {
        //replace old data with new one
        
        NSMutableDictionary *mutableDic = [gameRestoreBetInfos objectForKey:gameTypeStr];
        
        [mutableDic setObject:serialNumber forKey:keySerialNumber];
        [mutableDic setObject:info forKey:keyInfo];
    }
    else
    {
        //create new data with given info
        
        NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
        
        [mutableDic setObject:serialNumber forKey:keySerialNumber];
        [mutableDic setObject:info forKey:keyInfo];
        
        [gameRestoreBetInfos setObject:mutableDic forKey:gameTypeStr];
    }
    
    return YES;
}


#pragma mark - AsyncSocket delegate
-(void)AsyncSocket:(AsyncSocket *)socket didConnectToHost:(NSString *)hostname onPort:(uint16_t)port
{
    NSLog(@"host connected");
}


@end
