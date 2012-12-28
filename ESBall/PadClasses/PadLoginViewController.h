//
//  PadLoginViewController.h
//  ESBall
//
//  Created by nelson on 12/11/15.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "BaseLoginViewController.h"
#import "ServerInterface.h"

@class PadLoginViewController;

@protocol PadLoginViewControllerDelegate <NSObject>

@optional
-(void)PadLoginViewControllerDidLogin:(PadLoginViewController *)controller;

@end

@interface PadLoginViewController : BaseLoginViewController<ServerInterfaceDelegate>


@property (nonatomic, weak) id<PadLoginViewControllerDelegate> theDelegate;

@end
