//
//  RouteView.h
//  ESBall
//
//  Created by Nelson on 12/5/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoadmapChart.h"
#import "FileFinder.h"

@interface RoadmapView : UIView<RoadmapDataViewDelegate>{
    
    //BOOL isRouteSetup;
    //indicate sepcific asking was enabled or not
    BOOL bankerAskEnabled;
    BOOL playerAskEnabled;
    //only used for normal without ask
    int currentMethod;
    //timer to perform asking in a period of time
    NSTimer *askTimer;
    //only used for ask but equal to currentMethod when not asking
    int methodForAsk;
    
    //roadmap data
    NSString *allRoadmapData[30];
    
    //update count to prevent continuous update
    int updateCount;
}

@property (nonatomic, copy) NSString *gameCodeName;
@property (nonatomic, assign) NSUInteger gameType;

//internal
@property (nonatomic, weak) IBOutlet UILabel *bankerScoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerScoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *tieScoreLabel;
@property (nonatomic, weak) IBOutlet RoadmapChart *roadmapChart;//roadmap chart
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, weak) IBOutlet UIButton *bankerAskButton;
@property (nonatomic, weak) IBOutlet UIButton *playerAskButton;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

//on ipad it is top down as first, second, third
@property (nonatomic, weak) IBOutlet UIImageView *playerFirstAskingImage;
@property (nonatomic, weak) IBOutlet UIImageView *playerSecondAskingImage;
@property (nonatomic, weak) IBOutlet UIImageView *playerThirdAskingImage;
@property (nonatomic, weak) IBOutlet UIImageView *bankerFirstAskingImage;
@property (nonatomic, weak) IBOutlet UIImageView *bankerSecondAskingImage;
@property (nonatomic, weak) IBOutlet UIImageView *bankerThirdAskingImage;


/**
 * A player ask button which is connected in Interface Builder
 * Trigger asking roadmap event
 *
 * 詢問 Player roadmap
 */
-(IBAction)playerAsk:(id)sender;

/**
 * A bank ask button which is connected in Interface Builder
 * Trigger asking roadmap event
 *
 * 詢問 Banker roadmap
 */
-(IBAction)bankerAsk:(id)sender;

/**
 * A method to update view
 */
-(void)updateView;

/**
 * A method to stop update
 * must call to stop update and timer
 * 
 * 停止更新
 */
-(void)stopUpdate;

/**
 * A method to reset UpdateCount
 * call each time after updateView(prevent draw too many time)
 */
-(void)resetUpdateCount;

/**
 * A method to stop asking roadmap
 *
 * 停止詢問 roadmap
 */
-(void)stopAsking;

/**
 * A method to update asking roadmap
 */
-(void)changeAsk:(NSTimer *)askTimer;

/**
 * A method to update score
 *
 * 更新分數
 */
-(void)updateScore;

/**
 * A method to update banker predicate roadmap
 *
 * 更新預測Banker路紙
 */
-(void)updatePredicateBankerRoadmap;

/**
 * A method to update player predicate roadmap
 *
 * 更新預測Player路紙
 */
-(void)updatePredicatePlayerRoadmap;

/**
 * A method to update predicate roadmap
 *
 * 更新預測路紙
 */
-(void)updatePredicateRoadmap;

/**
 * A method to get the number for predicate roadmap
 *
 * @splited the roadmap that has been splited
 */
-(int)numberForPredicateRoadmapWithDataArray:(NSArray *)splited;

/**
 * A method return image name for image that is on the right side of roadmap
 * first one from top to bottom for player 
 *
 */
-(NSString *)playerFirstAskingImageName;

/**
 * A method return image name for image that is on the right side of roadmap
 * second one from top to bottom for player
 *
 */
-(NSString *)playerSecondAskingImageName;

/**
 * A method return image name for image that is on the right side of roadmap
 * third one from top to bottom for player
 *
 */
-(NSString *)playerThirdAskingImageName;

/**
 * A method return image name for image that is on the right side of roadmap
 * first one from top to bottom for banker
 *
 */
-(NSString *)bankerFirstAskingImageName;

/**
 * A method return image name for image that is on the right side of roadmap
 * second one from top to bottom for banker
 *
 */
-(NSString *)bankerSecondAskingImageName;

/**
 * A method return image name for image that is on the right side of roadmap
 * third one from top to bottom for banker
 *
 */
-(NSString *)bankerThirdAskingImageName;

@end
