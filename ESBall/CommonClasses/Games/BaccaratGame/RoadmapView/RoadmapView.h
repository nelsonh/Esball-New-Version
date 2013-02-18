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

/*
 * A player ask button which is connected in Interface Builder
 * Trigger asking roadmap event
 */
-(IBAction)playerAsk:(id)sender;

/*
 * A bank ask button which is connected in Interface Builder
 * Trigger asking roadmap event
 */
-(IBAction)bankerAsk:(id)sender;

/*
 * A method to update view
 */
-(void)updateView;

/*
 * A method to stop update
 * must call to stop update and timer
 */
-(void)stopUpdate;

/*
 * A method to reset UpdateCount
 * call each time after updateView(prevent draw too many time)
 */
-(void)resetUpdateCount;

/*
 * A method to stop asking roadmap
 */
-(void)stopAsking;

@end
