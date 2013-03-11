//
//  SBPokerView.h
//  ESBall
//
//  Created by Nelson on 3/5/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "MiniInfoView.h"

@interface SBPokerView : MiniInfoView

@property (nonatomic, weak) IBOutlet UIImageView *diceLeft;
@property (nonatomic, weak) IBOutlet UIImageView *diceMiddle;
@property (nonatomic, weak) IBOutlet UIImageView *diceRight;
@property (nonatomic, weak) IBOutlet UILabel *diceTotalPoint;
@property (nonatomic, weak) IBOutlet UIImageView * backgroundView;

@property (nonatomic, copy) NSArray *dicePoints;

@end
