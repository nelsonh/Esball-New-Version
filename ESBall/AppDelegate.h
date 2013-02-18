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

__unused static NSString *LastUserLoginAccount = @"UserAccount";

@interface AppDelegate : UIResponder <UIApplicationDelegate, AsyncSocketDelegate>{
    
    //used to store bet history that player has done for each game
    /*******************
     first layer in dictionary contain GameType as string for key e.g 3001
     each GameType key point to a dictionary as second layer.
     
     second layer is a dictionary contain both strings for key "Info" and "Serial" respectively
     "Info" key point to a dictionary as third layer and is a actual data.
     "Serial" key point to a string that is game round+serail number e.g 1-20 1234356
     
     third layer is a dictionary contain UIButton's tag which been turnning into string for key
     each tag point to bet history as NSNumber object which is a double value
     UIButton's tag must pre-define in Interface Builder otherwise this won't work
     
     #first layer
     GameType->NSMutableDictionary
     
     #seciond layer
     "Info"->NSMutableDictionary
     "Serial"->"1-20 1234356"
     
     #third layer
     tag->NSNumber
     *******************/
    NSMutableDictionary *gameRestoreBetInfos;
    
}

@property (strong, nonatomic) UIWindow *window;

-(NSDictionary *)restoreBetInfoWithGameType:(NSUInteger)gameType WithSerialNumber:(NSString *)serialNumber;
-(BOOL)setRestoreBetInfo:(NSDictionary *)info WithGameType:(NSUInteger)gameType WithSerialNumber:(NSString *)serialNumber;

@end
