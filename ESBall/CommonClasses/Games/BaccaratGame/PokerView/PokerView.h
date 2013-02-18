//
//  PokerView.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiniInfoView.h"
#import "FileFinder.h"

@interface PokerView : MiniInfoView

@property (nonatomic, weak) IBOutlet UIImageView *topLeftCard;
@property (nonatomic, weak) IBOutlet UIImageView *topMiddleCard;
@property (nonatomic, weak) IBOutlet UIImageView *topRightCard;
@property (nonatomic, weak) IBOutlet UIImageView *buttomLeftCard;
@property (nonatomic, weak) IBOutlet UIImageView *buttomMiddleCard;
@property (nonatomic, weak) IBOutlet UIImageView *buttomRightCard;
@property (nonatomic, weak) IBOutlet UILabel *bankerPointLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerPointLabel;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

@property (nonatomic, copy) NSArray *cardImages;//card image name string
@property (nonatomic, assign) NSUInteger bankerPoint;
@property (nonatomic, assign) NSUInteger playerPoint;

@end
