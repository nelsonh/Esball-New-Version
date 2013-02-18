//
//  DTBetView.m
//  ESBall
//
//  Created by Nelson on 12/18/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "DTBetView.h"
#import "FileFinder.h"

@interface DTBetView ()


@end

@implementation DTBetView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - override methods
-(NSUInteger)numberOfRoundToDisableBetSquare
{
    //50 round to disable bet square
    return 50;
}

-(void)updateView
{
    [super updateView];
}

-(void)showResult
{
    /**show result**/
    /**override use our own logic**/

    [self showResultWithResultCode:self.updateInfo.result];

}

-(void)showResultWithResultCode:(NSUInteger)result
{
    int indexResult = result;
    
    if (indexResult>0)
    {
        
        
        FileFinder *fileFinder = [FileFinder fileFinder];
        
        switch (indexResult & 7)
        {
            case 1://虎
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_T01s.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B01@2x.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                
                self.square11Result.hidden=NO;
                self.square11Result.animationImages = anims;
                self.square11Result.animationDuration=1.0f;
                self.square11Result.animationRepeatCount=1;
                [self.square11Result startAnimating];
                
                break;
            }
            case 2://龍
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_D01s.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P01@2x.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                self.square8Result.hidden=NO;
                self.square8Result.animationImages = anims;
                self.square8Result.animationDuration=1.0f;
                self.square8Result.animationRepeatCount=1;
                [self.square8Result startAnimating];
                
                break;
            }
            case 4://和
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_Ties.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T01@2x.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                self.square4Result.hidden=NO;
                self.square4Result.animationImages = anims;
                self.square4Result.animationDuration=1.0f;
                self.square4Result.animationRepeatCount=1;
                [self.square4Result startAnimating];
                
                break;
            }
            default:
                break;
        }
        
        if((indexResult & 24) == 8)//虎單
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_T05s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B02@2x.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            self.square7Result.hidden=NO;
            self.square7Result.animationImages = anims;
            self.square7Result.animationDuration=1.0f;
            self.square7Result.animationRepeatCount=1;
            [self.square7Result startAnimating];
        }
        
        if((indexResult & 24) == 16)//虎雙
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_T04s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T03@2x.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            self.square10Result.hidden=NO;
            self.square10Result.animationImages = anims;
            self.square10Result.animationDuration=1.0f;
            self.square10Result.animationRepeatCount=1;
            [self.square10Result startAnimating];
        }
        
        if((indexResult & 96) == 32)//龍單
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_D02s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P02@2x.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            self.square1Result.hidden=NO;
            self.square1Result.animationImages = anims;
            self.square1Result.animationDuration=1.0f;
            self.square1Result.animationRepeatCount=1;
            [self.square1Result startAnimating];
        }
        
        if ((indexResult & 96) == 64)//龍雙
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_D03s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T02@2x.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            self.square9Result.hidden=NO;
            self.square9Result.animationImages = anims;
            self.square9Result.animationDuration=1.0f;
            self.square9Result.animationRepeatCount=1;
            [self.square9Result startAnimating];
        }
        
        if((indexResult & 384) == 128)//虎黑
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_T02s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B04@2x.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            self.square5Result.hidden=NO;
            self.square5Result.animationImages = anims;
            self.square5Result.animationDuration=1.0f;
            self.square5Result.animationRepeatCount=1;
            [self.square5Result startAnimating];
        }
        
        if((indexResult & 384) == 256)//虎紅
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_T03s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B03@2x.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            self.square6Result.hidden=NO;
            self.square6Result.animationImages = anims;
            self.square6Result.animationDuration=1.0f;
            self.square6Result.animationRepeatCount=1;
            [self.square6Result startAnimating];
        }
        
        if((indexResult & 1536) == 512)//龍黑
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_D05s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P04@2x.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            self.square3Result.hidden=NO;
            self.square3Result.animationImages = anims;
            self.square3Result.animationDuration=1.0f;
            self.square3Result.animationRepeatCount=1;
            [self.square3Result startAnimating];
        }
        
        if((indexResult & 1536) == 1024)//龍紅
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTarea_D04s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P03@2x.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            self.square2Result.hidden=NO;
            self.square2Result.animationImages = anims;
            self.square2Result.animationDuration=1.0f;
            self.square2Result.animationRepeatCount=1;
            [self.square2Result startAnimating];
        }
    }
}



-(void)disableBetSquareByRound:(NSUInteger)round currentRound:(NSUInteger)curRound
{
    if(curRound > round)
    {
        self.betSquare1.enabled = NO;
        self.betSquare2.enabled = NO;
        self.betSquare3.enabled = NO;
        self.betSquare4.enabled = NO;
        self.betSquare8.enabled = NO;
        self.betSquare9.enabled = NO;
        self.betSquare10.enabled = NO;
        self.betSquare11.enabled = NO;
        
        if([self.theBetViewDelegate respondsToSelector:@selector(BetViewGreaterThanCertainRound:round:)])
        {
            [self.theBetViewDelegate BetViewGreaterThanCertainRound:self round:round];
        }
        
    }
    else
    {
        self.betSquare1.enabled = YES;
        self.betSquare2.enabled = YES;
        self.betSquare3.enabled = YES;
        self.betSquare4.enabled = YES;
        self.betSquare8.enabled = YES;
        self.betSquare9.enabled = YES;
        self.betSquare10.enabled = YES;
        self.betSquare11.enabled = YES;
        
        if([self.theBetViewDelegate respondsToSelector:@selector(BetViewLessThanCertainRound:round:)])
        {
            [self.theBetViewDelegate BetViewLessThanCertainRound:self round:round];
        }
    }
}

-(void)setupBetSquare
{
    /**assing value to BetSquare**/
    double maxBet = self.userInfo.max;
    double tie = self.userInfo.tie;
    
    
    //assign bet information
    self.betSquare1.maxBet = maxBet;
    self.betSquare2.maxBet = maxBet;
    self.betSquare3.maxBet = maxBet;
    self.betSquare4.maxBet = maxBet;
    self.betSquare5.maxBet = maxBet;
    self.betSquare6.maxBet = tie;
    self.betSquare7.maxBet = maxBet;
    self.betSquare8.maxBet = maxBet;
    self.betSquare9.maxBet = maxBet;
    self.betSquare10.maxBet = maxBet;
    self.betSquare11.maxBet = maxBet;
    
    //make sure they do not appear
    self.square1Result.hidden = YES;
    self.square2Result.hidden = YES;
    self.square3Result.hidden = YES;
    self.square4Result.hidden = YES;
    self.square5Result.hidden = YES;
    self.square6Result.hidden = YES;
    self.square7Result.hidden = YES;
    self.square8Result.hidden = YES;
    self.square9Result.hidden = YES;
    self.square10Result.hidden = YES;
    self.square11Result.hidden = YES;
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
