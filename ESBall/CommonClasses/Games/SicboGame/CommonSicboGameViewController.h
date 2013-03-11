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

@interface CommonSicboGameViewController : CommonBaccaratGameViewController

@property (nonatomic, weak) IBOutlet SBBetView *sbBetView;
@property (nonatomic, weak) IBOutlet SBRoadmapView *sbRoadmap;
@property (nonatomic, weak) IBOutlet SBPokerView *sbPokerView;

@end
