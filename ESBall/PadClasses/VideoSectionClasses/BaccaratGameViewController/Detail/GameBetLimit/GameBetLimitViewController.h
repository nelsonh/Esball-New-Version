//
//  GameBetLimitViewController.h
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "SubDetailViewController.h"

@class GameBetLimitViewController;

@protocol GameBetLimitViewControllerDelegate <NSObject>

-(double)GameBetLimitViewControllerLimitForSmallBet:(GameBetLimitViewController *)controller;
-(double)GameBetLimitViewControllerLimitForSingleBet:(GameBetLimitViewController *)controller;
-(double)GameBetLimitViewControllerLimitForOUBet:(GameBetLimitViewController *)controller;
-(double)GameBetLimitViewControllerLimitForPairBet:(GameBetLimitViewController *)controller;
-(double)GameBetLimitViewControllerLimitForTieBet:(GameBetLimitViewController *)controller;

@end

@interface GameBetLimitViewController : SubDetailViewController

@property (nonatomic, weak) id<GameBetLimitViewControllerDelegate> gameBetDelegate;

@property (nonatomic, weak) IBOutlet UILabel *smallBetLimitLabel;
@property (nonatomic, weak) IBOutlet UILabel *singleBetLimitLabel;
@property (nonatomic, weak) IBOutlet UILabel *ouBetLimitLabel;
@property (nonatomic, weak) IBOutlet UILabel *pairBetLimitLabel;


@end
