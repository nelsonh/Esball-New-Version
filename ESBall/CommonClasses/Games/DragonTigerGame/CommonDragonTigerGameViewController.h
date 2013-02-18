//
//  CommonDragonTigerGameViewController.h
//  ESBall
//
//  Created by Nelson on 12/27/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//
/*
 * extend from CommonBaccaratGameViewController
 * Dragon tiger game skeleton
 * game logic same as Baccarat
 */

#import "CommonBaccaratGameViewController.h"
#import "ImagePull.h"
#import "GameDetailViewController.h"
#import "DTBetView.h"
#import "DTPokerView.h"
#import "RoadmapView.h"

@interface CommonDragonTigerGameViewController : CommonBaccaratGameViewController{
    
    //hold dragon point
    NSUInteger dragonTempPoint;
    
    //hold tiger point
    NSUInteger tigerTempPoint;
}

/**
 look out search for dt keyword when you connect UI in IB
 **/
@property (nonatomic, weak) IBOutlet DTBetView *dtBetView;
@property (nonatomic, weak) IBOutlet DTPokerView *dtPokerView;
@property (nonatomic, weak) IBOutlet RoadmapView *dtRoadmap;

/*
 * A method to calculate card point for dragon
 *
 * @param cards dragon's cards
 * @return point for dragon
 */
-(NSUInteger)calculateCardPointForDragon:(NSArray *)cards;

/*
 * A method to calculate card point for tiger
 *
 * @param cards tiger's cards
 * @return point for tiger
 */
-(NSUInteger)calculateCardPointForTiger:(NSArray *)cards;

/*
 * A method to play sound for dragon point
 */
-(void)playSoundOfFinalPointForDragon;

/*
 * A method to play sound for tiger point
 */
-(void)playSoundOfFinalPointForTiger;


@end
