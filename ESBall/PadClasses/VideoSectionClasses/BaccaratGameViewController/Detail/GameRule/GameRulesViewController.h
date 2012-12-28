//
//  GameRulesViewController.h
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "SubDetailViewController.h"

@class GameRulesViewController;

@protocol GameRulesViewControllerDelegate <NSObject>

-(NSURL *)GameRulesViewControllerRuleWebAddress:(GameRulesViewController *)controller;

@end

@interface GameRulesViewController : SubDetailViewController

@property (nonatomic, weak) id<GameRulesViewControllerDelegate> gameRuleDelegate;

@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end
