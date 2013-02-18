//
//  DragonTigerBetRecordDetailViewController.h
//  ESBall
//
//  Created by Nelson on 1/10/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

//subclass of BetRecordDetailViewController

#import "BetRecordDetailViewController.h"
#import "FileFinder.h"

@interface CommonDragonTigerBetRecordDetailViewController : BetRecordDetailViewController

@property (nonatomic, weak) IBOutlet UILabel *bankerPointLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerPointLabel;
@property (nonatomic, weak) IBOutlet UIImageView *bankerCard;
@property (nonatomic, weak) IBOutlet UIImageView *playerCard;

//subclass have to implement their own if needed
-(void)showBankerPlayerPoints;
-(void)showCards;

@end
