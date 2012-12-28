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
    
    SelectedMethods selectedMethod;
    __weak UIButton *selectedBtn;
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
-(void)createVideoSetting;
-(void)createGameBetLimit;
-(void)createGameRules;
-(void)createHistory;

@end
