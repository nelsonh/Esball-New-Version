//
//  AppDelegate.h
//  ESBall
//
//  Created by nelson on 12/11/14.
//  Copyright (c) 2012年 nelson. All rights reserved.
//
//12/12/20

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"

static NSString *LastUserLoginAccount = @"UserAccount";

@interface AppDelegate : UIResponder <UIApplicationDelegate, AsyncSocketDelegate>{
    
}

@property (strong, nonatomic) UIWindow *window;

@end
