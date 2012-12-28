//
//  GameDetailViewController.h
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameDetailViewController;

@protocol GameDetailViewControllerDelegate <NSObject>

@optional

-(void)GameDetailViewControllerDidAddToParentController:(GameDetailViewController *)controller;
-(void)GameDetailViewControllerDidRemoveFromParentController:(GameDetailViewController *)controller;

-(NSString *)GameDetailViewControllerNameForDealer:(GameDetailViewController *)controller;
-(NSString *)GameDetailViewControllerNameForTable:(GameDetailViewController *)controller;
-(NSString *)GameDetailViewControllerNameForCurrency:(GameDetailViewController *)controller;

//for GameBetLimit sub detail
-(double)GameDetailViewControllerSmallBetLimit:(GameDetailViewController *)controller;
-(double)GameDetailViewControllerSingleBetLimit:(GameDetailViewController *)controller;
-(double)GameDetailViewControllerOUBetLimit:(GameDetailViewController *)controller;
-(double)GameDetailViewControllerPairBetLimit:(GameDetailViewController *)controller;
-(double)GameDetailViewControllerTieBetLimit:(GameDetailViewController *)controller;


//for GameRules sub detail
-(NSString *)GameDetailViewControllerGameRuleWebAddress:(GameDetailViewController *)controller;

//for History sub detail
-(NSString *)GameDetailViewControllerHistoryMessage:(GameDetailViewController *)controller;

@end

@interface GameDetailViewController : UIViewController

@property (nonatomic, weak) id<GameDetailViewControllerDelegate> theDelegate;
@property (nonatomic, weak) IBOutlet UILabel *bankerNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *tableNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *currencyLabel;

-(void)addToConrtoller:(UIViewController *)parentController inPosition:(CGPoint)pos;

@end
