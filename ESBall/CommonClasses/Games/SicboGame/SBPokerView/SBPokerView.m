//
//  SBPokerView.m
//  ESBall
//
//  Created by Nelson on 3/5/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBPokerView.h"
#import "FileFinder.h"

@implementation SBPokerView

@synthesize diceLeft = _diceLeft;
@synthesize diceMiddle = _diceMiddle;
@synthesize diceRight = _diceRight;
@synthesize backgroundView = _backgroundView;
@synthesize dicePoints = _dicePoints;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - override method
-(void)updateView
{
    if(!_dicePoints)
        return;
    
    if(_dicePoints.count != 3)
        return;
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    int diceLeftInt = [[_dicePoints objectAtIndex:0] intValue];
    int diceMiddleInt = [[_dicePoints objectAtIndex:1] intValue];
    int diceRightInt = [[_dicePoints objectAtIndex:2] intValue];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        _diceLeft.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_0%i.png", diceLeftInt]]];
        _diceMiddle.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_0%i.png", diceMiddleInt]]];
        _diceRight.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_0%i.png", diceRightInt]]];
    }
    else
    {
        _diceLeft.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_s_0%i.png", diceLeftInt]]];
        _diceMiddle.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_s_0%i.png", diceMiddleInt]]];
        _diceRight.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_s_0%i.png", diceRightInt]]];
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
