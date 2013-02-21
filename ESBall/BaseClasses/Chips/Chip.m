//
//  Chips.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "Chip.h"
#import "FileFinder.h"
#import "SoundManager.h"

@interface Chip ()

-(void)chipTapped;

@end

@implementation Chip

@synthesize theDelegate = _theDelegate;
@synthesize chipValue = _chipValue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(id)buttonWithType:(UIButtonType)buttonType andChipImageName:(NSString *)chipName;
{
    id button = [super buttonWithType:buttonType];
    [button addTarget:button action:@selector(chipTapped) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:button action:@selector(chipTapped) forControlEvents:UIControlEventTouchUpOutside];

    
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    NSString *chipDownImageName = [NSString stringWithFormat:@"chip_%@_down.png", chipName];
    NSString *chipNoImageName = [NSString stringWithFormat:@"chip_%@_no.png", chipName];
    NSString *chipNormalImageName = [NSString stringWithFormat:@"chip_%@.png", chipName];

    UIImage *imageForDown = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:chipDownImageName]];
    UIImage *imageForNo = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:chipNoImageName]];
    UIImage *imageForNormal = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:chipNormalImageName]];
    
    [button setImage:imageForDown forState:UIControlStateHighlighted];
    [button setImage:imageForNo forState:UIControlStateDisabled];
    [button setImage:imageForNormal forState:UIControlStateNormal];
    
    return button;
}

-(void)chipTapped
{
    if([_theDelegate respondsToSelector:@selector(ChipDidTapped:)])
    {
        //prevent touch up indside 
        [self performSelector:@selector(doHighlight) withObject:nil afterDelay:0.0];
        [_theDelegate ChipDidTapped:self];
        
        //sound effect
        SoundManager *soundManager = [SoundManager soundManager];
        [soundManager playSoundEffectWithKey:@"SE_ChipTap"];
    }
}

-(void)select
{
    [self performSelector:@selector(doHighlight) withObject:nil afterDelay:0.0];
}

-(void)deselect
{
    [self performSelector:@selector(doDeselect) withObject:nil afterDelay:0.0];

}

-(void)disable
{
    [self performSelector:@selector(doDisable) withObject:nil afterDelay:0.0];

}

-(void)enable
{
     [self performSelector:@selector(doEnable) withObject:nil afterDelay:0.0];

}

-(void)doHighlight
{
    self.highlighted = YES;

}

-(void)doDeselect
{
    self.highlighted = NO;

}

-(void)doDisable
{
    
    if(self.highlighted)
        self.highlighted = NO;
    
    self.enabled = NO;

}

-(void)doEnable
{
    self.enabled = YES;

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
