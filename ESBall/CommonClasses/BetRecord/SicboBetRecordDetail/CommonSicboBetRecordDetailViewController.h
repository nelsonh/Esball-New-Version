//
//  CommonSicboBetRecordDetailViewController.h
//  ESBall
//
//  Created by Nelson on 3/6/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordDetailViewController.h"

@interface CommonSicboBetRecordDetailViewController : BetRecordDetailViewController

@property (nonatomic, weak) IBOutlet UILabel *dicePoint;
@property (nonatomic, weak) IBOutlet UIImageView *diceLeft;
@property (nonatomic, weak) IBOutlet UIImageView *diceMiddle;
@property (nonatomic, weak) IBOutlet UIImageView *diceRight;

-(void)showDices;

@end
