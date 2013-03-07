//
//  CommonBaccaratBetRecordDetailViewController.h
//  ESBall
//
//  Created by Nelson on 1/10/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

//need to subclass
//subclass of BetRecordDetailViewController

#import "BetRecordDetailViewController.h"
#import "FileFinder.h"

/**
 * CommonBaccaratBetRecordDetailViewController subclass of BetRecordDetailViewController.
 * This class implement the display of cards and total point for player and banker.
 * This class define new UIs.
 * This class also override some method from parent.
 */
@interface CommonBaccaratBetRecordDetailViewController : BetRecordDetailViewController

@property (nonatomic, weak) IBOutlet UILabel *bankerPointLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerPointLabel;
@property (nonatomic, weak) IBOutlet UIImageView *bankerLeftCard;
@property (nonatomic, weak) IBOutlet UIImageView *bankerMiddleCard;
@property (nonatomic, weak) IBOutlet UIImageView *bankerRightCard;
@property (nonatomic, weak) IBOutlet UIImageView *playerLeftCard;
@property (nonatomic, weak) IBOutlet UIImageView *playerMiddleCard;
@property (nonatomic, weak) IBOutlet UIImageView *playerRightCard;

//subclass have to implement their own if needed
-(void)showBankerPlayerPoints;
-(void)showCards;

@end
