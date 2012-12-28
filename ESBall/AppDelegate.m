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

#pragma mark - AsyncSocket delegate
-(void)AsyncSocket:(AsyncSocket *)socket didConnectToHost:(NSString *)hostname onPort:(uint16_t)port
{
    NSLog(@"host connected");
}


@end
