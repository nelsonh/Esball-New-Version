//
//  DTPokerView.h
//  ESBall
//
//  Created by Nelson on 12/21/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

//similar to PokerView 

#import "MiniInfoView.h"
#import "FileFinder.h"

@interface DTPokerView : MiniInfoView

@property (nonatomic, weak) IBOutlet UIImageView *dragonCard;
@property (nonatomic, weak) IBOutlet UIImageView *tigerCard;
@property (nonatomic, weak) IBOutlet UILabel *dragonPointLabel;
@property (nonatomic, weak) IBOutlet UILabel *tigerPointLabel;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

@property (nonatomic, copy) NSArray *cardImages;
@property (nonatomic, assign) NSUInteger dragonPoint;
@property (nonatomic, assign) NSUInteger tigerPoint;

@end
