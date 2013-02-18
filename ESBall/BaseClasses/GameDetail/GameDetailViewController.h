//
//  GameDetailViewController.h
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameDetailViewController;

/*
 * A protocol of GameDetailViewController
 */
@protocol GameDetailViewControllerDelegate <NSObject>

@optional

/*
 * Fire when GameDetailViewController add to parent controller
 */
-(void)GameDetailViewControllerDidAddToParentController:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController remove from parent controller
 */
-(void)GameDetailViewControllerDidRemoveFromParentController:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController asking for dealer name
 */
-(NSString *)GameDetailViewControllerNameForDealer:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController asking for table
 */
-(NSString *)GameDetailViewControllerNameForTable:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController asking for currency
 */
-(NSString *)GameDetailViewControllerNameForCurrency:(GameDetailViewController *)controller;

/*
 * for GameBetLimit sub detail
 */

/*
 * Fire when GameDetailViewController asking for small bet limit
 */
-(double)GameDetailViewControllerSmallBetLimit:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController asking for single bet limit
 */
-(double)GameDetailViewControllerSingleBetLimit:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController asking for ou bet limit
 */
-(double)GameDetailViewControllerOUBetLimit:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController asking for pair bet limit
 */
-(double)GameDetailViewControllerPairBetLimit:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController asking for tie bet limit
 */
-(double)GameDetailViewControllerTieBetLimit:(GameDetailViewController *)controller;

/*
 * Fire when GameDetailViewController asking for big small bet limit
 */
-(double)GameDetailViewControllerTheBigSmallBetLimit:(GameDetailViewController *)controller;


/*
 * for GameRules sub detail
 * Fire when GameDetailViewController asking game rule web address
 */
-(NSString *)GameDetailViewControllerGameRuleWebAddress:(GameDetailViewController *)controller;

/*
 * for History sub detail
 * Fire when GameDetailViewController asking history message(marquee)
 */
-(NSString *)GameDetailViewControllerHistoryMessage:(GameDetailViewController *)controller;

@end

@interface GameDetailViewController : UIViewController

@property (nonatomic, weak) id<GameDetailViewControllerDelegate> theDelegate;//delegate
@property (nonatomic, weak) IBOutlet UILabel *bankerNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *tableNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *currencyLabel;

/*
 * A method to add this controller to another controller
 *
 * @param parentController this controller will added to
 * @param pos the position in parent controller's view
 */
-(void)addToConrtoller:(UIViewController *)parentController inPosition:(CGPoint)pos;

@end
