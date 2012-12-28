//
//  DTRoadmapView.m
//  ESBall
//
//  Created by Nelson on 12/21/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "DTRoadmapView.h"

#define kNumberOfConetntForRoadmap 5

@implementation DTRoadmapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
}

#pragma mark - override
-(IBAction)playerAsk:(id)sender
{
    //player = Dragon
    //banker = Tiger;
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    //banker 2
    NSLog(@"dragon ask");
    bankerAskEnabled = NO;
    [self.bankerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askT_btn_up.png"]] forState:UIControlStateNormal];
    
    if(currentMethod != 2 && playerAskEnabled == NO)
    {
        //enable
        //currentMethod = 2;
        methodForAsk = 2;
        [askTimer invalidate];
        askTimer = nil;
        askTimer = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(changeAsk:) userInfo:nil repeats:YES];
        
        [self.playerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askD_btn_down.png"]] forState:UIControlStateNormal];
        
        playerAskEnabled = YES;
    }
    else
    {
        //disable
        currentMethod = 0;
        methodForAsk = currentMethod;
        [askTimer invalidate];
        askTimer = nil;
        [self.playerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askD_btn_up.png"]] forState:UIControlStateNormal];
        
        playerAskEnabled = NO;
    }
}

-(IBAction)bankerAsk:(id)sender
{
    
    //player = Dragon
    //banker = Tiger;
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    //banker 1
    NSLog(@"tiger ask");
    playerAskEnabled = NO;
    [self.playerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askD_btn_up.png"]] forState:UIControlStateNormal];
    
    if(currentMethod != 1 && bankerAskEnabled == NO)
    {
        //enable
        //currentMethod = 1;
        methodForAsk = 1;
        
        [askTimer invalidate];
        askTimer = nil;
        askTimer = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(changeAsk:) userInfo:nil repeats:YES];
        
        [self.bankerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askT_btn_down.png"]] forState:UIControlStateNormal];
        
        bankerAskEnabled = YES;
        
    }
    else
    {
        //disable
        currentMethod = 0;
        methodForAsk = currentMethod;
        [askTimer invalidate];
        askTimer = nil;
        
        [self.bankerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askT_btn_up.png"]] forState:UIControlStateNormal];
        
        bankerAskEnabled = NO;
    }
}

#pragma mark - RoadmapChart delegate
-(NSUInteger)RoadmapChartNumberOfContent:(RoadmapChart *)roadmap
{
    //override super one since we only have 4 content
    return kNumberOfConetntForRoadmap;
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
