//
//  CommonDragonTigerGameViewController.h
//  ESBall
//
//  Created by Nelson on 12/27/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

//extend from CommonBaccaratGameViewController
//Dragon tiger game skeleton

#import "CommonBaccaratGameViewController.h"
#import "ImagePull.h"
#import "GameDetailViewController.h"
#import "DTBetView.h"
#import "DTPokerView.h"
#import "RoadmapView.h"

@interface CommonDragonTigerGameViewController : CommonBaccaratGameViewController

/**
 look out search for dt keyword when you connect UI in IB
 **/
@property (nonatomic, weak) IBOutlet DTBetView *dtBetView;
@property (nonatomic, weak) IBOutlet DTPokerView *dtPokerView;
@property (nonatomic, weak) IBOutlet RoadmapView *dtRoadmap;

-(NSUInteger)calculateCardPointForDragon:(NSArray *)cards;
-(NSUInteger)calculateCardPointForTiger:(NSArray *)cards;

@end
