//
//  HistoryViewController.h
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "SubDetailViewController.h"

@class HistoryViewController;

@protocol HistoryViewControllerDelegate <NSObject>

-(NSString *)HistoryViewControllerHistoryMessage:(HistoryViewController *)controller;

@end

@interface HistoryViewController : SubDetailViewController

@property (nonatomic, weak) id<HistoryViewControllerDelegate> historyDelegate;

@end
