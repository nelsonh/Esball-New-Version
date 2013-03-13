//
//  CommonSicboGameViewController.h
//  ESBall
//
//  Created by Nelson on 1/2/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "CommonBaccaratGameViewController.h"
#import "SBBetView.h"
#import "SBRoadmapView.h"
#import "SBPokerView.h"
#import "SBBetRecordView.h"

@interface CommonSicboGameViewController : CommonBaccaratGameViewController

@property (nonatomic, weak) IBOutlet SBBetView *sbBetView;
@property (nonatomic, weak) IBOutlet SBRoadmapView *sbRoadmap;
@property (nonatomic, weak) IBOutlet SBPokerView *sbPokerView;
@property (nonatomic, weak) IBOutlet SBBetRecordView *sbBetRecordView;

/**
 * A method to reload and update SBBetRecordView
 */
-(void)reloadBetRecordView;

/**
 * A method to clear bet record data and display
 */
-(void)clearBetRecordViewWithDisplay:(BOOL)yesOrNo;

@end
