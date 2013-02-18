//
//  DetailViewController.h
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

//reusable

#import "GameDetailViewController.h"
#import "VideoSettingViewController.h"
#import "GameBetLimitViewController.h"
#import "GameRulesViewController.h"
#import "HistoryViewController.h"

typedef enum {
    
    VideoSetting,
    GameBetLimit,
    GameRule,
    History
    
    }SelectedMethods;

@class DetailViewController;

@interface DetailViewController : GameDetailViewController<SubDetailViewControllerDelegate, GameBetLimitViewControllerDelegate, GameRulesViewControllerDelegate, HistoryViewControllerDelegate>{
    
    SelectedMethods selectedMethod;//current selected
    __weak UIButton *selectedBtn;//current selected button
}


@property (nonatomic, weak) IBOutlet UIView *referenceView;//used to get proper rect

/**specifi storyboard id to present correct controller**/
@property (nonatomic, copy) NSString *videoSettingControllerID;
@property (nonatomic, copy) NSString *gameBetLimitControllerID;
@property (nonatomic, copy) NSString *gameRuleControllerID;
@property (nonatomic, copy) NSString *historyControllerID;

@property (nonatomic, weak) IBOutlet UIButton *videoSettingBtn;
@property (nonatomic, weak) IBOutlet UIButton *gameBetLimitBtn;
@property (nonatomic, weak) IBOutlet UIButton *gameRuleBtn;
@property (nonatomic, weak) IBOutlet UIButton *historyBtn;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

//internal

/*
 * A method to create video setting controller
 * add to this controller
 */
-(void)createVideoSetting;

/*
 * A method to create game bet limit controller
 * add to this controller
 */
-(void)createGameBetLimit;

/*
 * A method to create game rule controller
 * add to this controller
 */
-(void)createGameRules;

/*
 * A method to create history message view controller
 * add to this controller
 */
-(void)createHistory;

@end
