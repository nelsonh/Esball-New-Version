//
//  RouteView.m
//  ESBall
//
//  Created by Nelson on 12/5/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "RoadmapView.h"


//781, 230 was defined for ipad
//#define kRoadmapWidth 781
//#define kRoadmapHeight 130
#define kNumberOfConetntForRoadmap 6

@interface RoadmapView ()



-(void)changeAsk:(NSTimer *)askTimer;

@end

@implementation RoadmapView

@synthesize bankerScoreLabel = _bankerScoreLabel;
@synthesize playerScoreLabel = _playerScoreLabel;
@synthesize tieScoreLabel = _tieScoreLabel;
@synthesize gameCodeName = _gameCodeName;
@synthesize gameType = _gameType;
@synthesize pageControl = _pageControl;
@synthesize roadmapChart = _roadmapChart;
@synthesize bankerAskButton = _bankerAskButton;
@synthesize playerAskButton = _playerAskButton;
@synthesize backgroundImageView = _backgroundImageView;

@synthesize playerFirstAskingImage = _playerFirstAskingImage;
@synthesize playerSecondAskingImage = _playerSecondAskingImage;
@synthesize playerThirdAskingImage = _playerThirdAskingImage;
@synthesize bankerFirstAskingImage = _bankerFirstAskingImage;
@synthesize bankerSecondAskingImage = _bankerSecondAskingImage;
@synthesize bankerThirdAskingImage = _bankerThirdAskingImage;



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

-(void)dealloc
{
    NSLog(@"roadmap dealloc");
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    //isRouteSetup = NO;
    bankerAskEnabled = NO;
    playerAskEnabled = NO;
    currentMethod = 0;
    methodForAsk = currentMethod;
    return [super initWithCoder:aDecoder];
    
}

#pragma mark - public interface
-(NSString *)playerFirstAskingImageName
{
    return @"";
}

-(NSString *)playerSecondAskingImageName
{
    return @"";
}

-(NSString *)playerThirdAskingImageName
{
    return @"";
}

-(NSString *)bankerFirstAskingImageName
{
    return @"";
}

-(NSString *)bankerSecondAskingImageName
{
    return @"";
}

-(NSString *)bankerThirdAskingImageName
{
    return @"";
}

-(void)updateView
{
    [self updateScore];
    
    //update predicate roadmap
    [self updatePredicateRoadmap];
    
    //if ask enabled let ask to update view
    if(playerAskEnabled || bankerAskEnabled)
        return;
    
    //make it update once
    if(updateCount == 0)
    {
        [_roadmapChart initilizeWithDelegate:self];
        _roadmapChart.table = _gameCodeName;
        _roadmapChart.method = [NSString stringWithFormat:@"%i", currentMethod];
        _roadmapChart.redrawRoadmap = NO;
        [_roadmapChart updateView];
        
        //update page control
        _pageControl.numberOfPages = _roadmapChart.sections;
        
        updateCount++;
    }
    
}

-(void)stopUpdate
{
    if(askTimer)
    {
        [askTimer invalidate];
        askTimer = nil;
    }
}

-(void)resetUpdateCount
{
    updateCount = 0;
}

-(void)updateScore
{
    NSError *error;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://183.182.66.167/%i/%@/7/0.htm", _gameType, _gameCodeName]];
    NSString *resultStr = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
    
    if(error)
    {
        NSLog(@"unable to update score in roadmap");
        return;
    }
    
    NSArray *scores = [resultStr componentsSeparatedByString:@";"];
    
    if([scores count] != 3)
    {
        NSLog(@"result not match while updaing score in roadmap");
        return;
    }
    
    _bankerScoreLabel.text = [NSString stringWithFormat:@"%i", [[scores objectAtIndex:0] intValue]];
    _playerScoreLabel.text = [NSString stringWithFormat:@"%i", [[scores objectAtIndex:1] intValue]];
    _tieScoreLabel.text = [NSString stringWithFormat:@"%i", [[scores objectAtIndex:2] intValue]];

    //NSLog(@"update score");
}

-(void)stopAsking
{
    if(bankerAskEnabled)
        [self bankerAsk:nil];
    if(playerAskEnabled)
        [self playerAsk:nil];
}

-(IBAction)playerAsk:(id)sender
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    //banker 2
    NSLog(@"player ask");
    bankerAskEnabled = NO;
    [_bankerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askB_btn_up.png"]] forState:UIControlStateNormal];
    
    if(currentMethod != 2 && playerAskEnabled == NO)
    {
        //enable
        //currentMethod = 2;
        methodForAsk = 2;
        [askTimer invalidate];
        askTimer = nil;
        askTimer = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(changeAsk:) userInfo:nil repeats:YES];
        
        [_playerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askP_btn_down.png"]] forState:UIControlStateNormal];
        
        playerAskEnabled = YES;
    }
    else
    {
        //disable
        currentMethod = 0;
        methodForAsk = currentMethod;
        [askTimer invalidate];
        askTimer = nil;
        [_playerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askP_btn_up.png"]] forState:UIControlStateNormal];
        
        playerAskEnabled = NO;
    }
    
    /*
    _roadmapChart.method = [NSString stringWithFormat:@"%i", currentMethod];
    [self updateView];
     */
}

-(IBAction)bankerAsk:(id)sender
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    //banker 1
    NSLog(@"banker ask");
    playerAskEnabled = NO;
    [_playerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askP_btn_up.png"]] forState:UIControlStateNormal];
    
    if(currentMethod != 1 && bankerAskEnabled == NO)
    {
        //enable
        //currentMethod = 1;
        methodForAsk = 1;
        
        [askTimer invalidate];
        askTimer = nil;
        askTimer = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(changeAsk:) userInfo:nil repeats:YES];
        
        [_bankerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askB_btn_down.png"]] forState:UIControlStateNormal];
        
        bankerAskEnabled = YES;
         
    }
    else
    {
        //disable
        currentMethod = 0;
        methodForAsk = currentMethod;
        [askTimer invalidate];
        askTimer = nil;
        
        [_bankerAskButton setImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"askB_btn_up.png"]] forState:UIControlStateNormal];
        
        bankerAskEnabled = NO;
    }
    /*
    _roadmapChart.method = [NSString stringWithFormat:@"%i", currentMethod];
    [self updateView];
     */
}

-(void)changeAsk:(NSTimer *)askTimer
{
    if(self.hidden)
        return;
    
    if(currentMethod!=methodForAsk)
        currentMethod = methodForAsk;//draw asking one
    else
        currentMethod = 0;//draw normal one
    
    //_roadmapChart.method = [NSString stringWithFormat:@"%i", methodForAsk];
    //[self updateView];
    //[self updateScore];
    
    [_roadmapChart initilizeWithDelegate:self];
    _roadmapChart.table = _gameCodeName;
    _roadmapChart.method = [NSString stringWithFormat:@"%i", currentMethod];
    _roadmapChart.redrawRoadmap = YES;
    [_roadmapChart updateView];
    
}

-(void)updatePredicateRoadmap
{
    [self updatePredicateBankerRoadmap];
    [self updatePredicatePlayerRoadmap];
}

-(void)updatePredicateBankerRoadmap
{
    FileFinder *filefinder = [FileFinder fileFinder];
    
    NSError *error;
    NSString *strUrl;
    NSString *roadmapData[7];
    
    //clear old image
    _bankerFirstAskingImage.image = nil;
    _bankerSecondAskingImage.image = nil;
    _bankerThirdAskingImage.image = nil;
    
    //get roadmap data
    for(int j=0;j<3;j++)
    {
        for (int i = 1; i <= 6; i++)
        {
            
            if (i==5||i==6)
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/%i/%@/%i/0.htm" , _gameType, _gameCodeName, i-1];
            else
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/%i/%@/%i/%i.htm" , _gameType, _gameCodeName, i-1, j];
            
            //  NSLog(strUrl);
            NSURL *url = [NSURL URLWithString:strUrl];
            allRoadmapData[i+j*6]= [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
        }
    }
    
    //extract predicate roadmap
    for (int i = 1; i <= 6; i++)
	{
        if (i==5||i==6)
            roadmapData[i] = allRoadmapData[i+1*6];//1 method for banker
        else
            roadmapData[i] = allRoadmapData[i+1*6];//1 method for banker
    }
    
    //first predication
    int mark = 0;
    //the data we inerested is at index 2
    NSArray *splited = [roadmapData[2] componentsSeparatedByString:@"\n"];
    mark = [self numberForPredicateRoadmapWithDataArray:splited];
    
    switch (mark)
    {
        case 0:
            
            _bankerFirstAskingImage.image = nil;
            
            break;
            
        case 1:
            
            _bankerFirstAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self bankerFirstAskingImageName]]];
            
            break;
            
        case 2:
            
            _bankerFirstAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self playerFirstAskingImageName]]];
            
            break;
            
        default:
            break;
    }
    
    
    
    
    //second predication
    mark = 0;
    //the data we inerested is at index 3
    splited = [roadmapData[3] componentsSeparatedByString:@"\n"];
    mark = [self numberForPredicateRoadmapWithDataArray:splited];
    
    switch (mark)
    {
        case 0:
            
            _bankerSecondAskingImage.image = nil;
            
            break;
            
        case 1:
            
            _bankerSecondAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self bankerSecondAskingImageName]]];
            
            break;
            
        case 2:
            
            _bankerSecondAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self playerSecondAskingImageName]]];
            
            break;
            
        default:
            break;
    }
    
    //third predication
    mark = 0;
    //the data we inerested is at index 4
    splited = [roadmapData[4] componentsSeparatedByString:@"\n"];
    mark = [self numberForPredicateRoadmapWithDataArray:splited];
    
    switch (mark)
    {
        case 0:
            
            _bankerThirdAskingImage.image = nil;
            
            break;
            
        case 1:
            
            _bankerThirdAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self bankerThirdAskingImageName]]];
            
            break;
            
        case 2:
            
            _bankerThirdAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self playerThirdAskingImageName]]];
            
            break;
            
        default:
            break;
    }
}

-(void)updatePredicatePlayerRoadmap
{
    FileFinder *filefinder = [FileFinder fileFinder];
    
    NSError *error;
    NSString *strUrl;
    NSString *roadmapData[7];
    
    _playerFirstAskingImage.image = nil;
    _playerSecondAskingImage.image = nil;
    _playerThirdAskingImage.image = nil;
    
    for(int j=0;j<3;j++)
    {
        for (int i = 1; i <= 6; i++)
        {
            
            if (i==5||i==6)
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/%i/%@/%i/0.htm" , _gameType, _gameCodeName, i-1];
            else
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/%i/%@/%i/%i.htm" , _gameType, _gameCodeName, i-1, j];
            
            //  NSLog(strUrl);
            NSURL *url = [NSURL URLWithString:strUrl];
            allRoadmapData[i+j*6]= [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
        }
    }
    
    for (int i = 1; i <= 6; i++)
	{
        if (i==5||i==6)
            roadmapData[i] = allRoadmapData[i+2*6];//2 method for player
        else
            roadmapData[i] = allRoadmapData[i+2*6];//2 method for player
    }
    
    //first
    int mark = 0;
    NSArray *splited = [roadmapData[2] componentsSeparatedByString:@"\n"];
    mark = [self numberForPredicateRoadmapWithDataArray:splited];
    
    switch (mark)
    {
        case 0:
            
            _playerFirstAskingImage.image = nil;
            
            break;
            
        case 1:
            
            _playerFirstAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self bankerFirstAskingImageName]]];
            
            break;
            
        case 2:
            
            _playerFirstAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self playerFirstAskingImageName]]];
            
            break;
            
        default:
            break;
    }
    
    
    
    
    //second
    mark = 0;
    splited = [roadmapData[3] componentsSeparatedByString:@"\n"];
    mark = [self numberForPredicateRoadmapWithDataArray:splited];
    
    switch (mark)
    {
        case 0:
            
            _playerSecondAskingImage.image = nil;
            
            break;
            
        case 1:
            
            _playerSecondAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self bankerSecondAskingImageName]]];
            
            break;
            
        case 2:
            
            _playerSecondAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self playerSecondAskingImageName]]];
            
            break;
            
        default:
            break;
    }
    
    //third
    mark = 0;
    splited = [roadmapData[4] componentsSeparatedByString:@"\n"];
    mark = [self numberForPredicateRoadmapWithDataArray:splited];
    
    switch (mark)
    {
        case 0:
            
            _playerThirdAskingImage.image = nil;
            
            break;
            
        case 1:
            
            _playerThirdAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self bankerThirdAskingImageName]]];
            
            break;
            
        case 2:
            
            _playerThirdAskingImage.image = [UIImage imageWithContentsOfFile:[filefinder findPathForFileWithFileName:[self playerThirdAskingImageName]]];
            
            break;
            
        default:
            break;
    }
}

-(int)numberForPredicateRoadmapWithDataArray:(NSArray *)splited
{
    int mark = 0;
    
    //if there is no data
    if(splited.count != 3)
    {
        //get last one data index there are 3 extra info we don't need
        int dataIndex = splited.count-3;
        
        //get last roadmap data and split it into array
        NSArray *splitedRowData = [[splited objectAtIndex:dataIndex] componentsSeparatedByString:@":"];
        splitedRowData = [[splitedRowData objectAtIndex:1] componentsSeparatedByString:@";"];
        
        //go through array to find out predicate one
        //-1 there is one info at end and we don't need
        for(int i = splitedRowData.count-1; i >= 0; i--)
        {
            NSString *data = [splitedRowData objectAtIndex:i];
            
            NSArray *splited = [data componentsSeparatedByString:@","];
            
            //we only interested in first element
            int intMark = [[splited objectAtIndex:0] intValue];
            
            //if it is not 0 then we found
            if(intMark != 0)
            {
                mark = intMark;
                
                return mark;
            }
        }
    }
    
    return mark;

}

#pragma mark - RoadmapDataView delegate
-(void)RoadmapDataViewDidScroll:(RoadmapDataView *)roadmapView
{
    
    //update page control
    _pageControl.numberOfPages = roadmapView.sections;
    
    int page = roadmapView.bounds.origin.x/roadmapView.bounds.size.width;
    _pageControl.currentPage = page;

}


#pragma mark - RoadmapChart delegate
-(NSUInteger)RoadmapChartNumberOfContent:(RoadmapChart *)roadmap
{
    return kNumberOfConetntForRoadmap;
}
/*
-(BOOL)RoadmapChartShouldDrawRoadmap:(RoadmapChart *)roadmap withTable:(NSString *)table
{
    NSError *error;
    int i=0 ,j=0;
    NSString *strUrl ;
    //  NSLog(table);
    //NSArray *datatemp;
    for(j=0;j<3;j++)
    {
        for (i = 1; i <= 6; i++)
        {
            
            if (i==5||i==6)
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/%i/0.htm" ,table,i-1] ;
            else
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/%i/%i.htm" ,table,i-1,j] ;
            
            //  NSLog(strUrl);
            NSURL *url = [NSURL URLWithString:strUrl];
            allRoadmapData[i+j*6]= [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
            
            
        }
    }
    
    strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/7/0.htm" ,table] ;
    NSURL *url = [NSURL URLWithString:strUrl];
    strUrl=  [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
    //datatemp=[strUrl componentsSeparatedByString: @";"];
    //NSLog(strUrl);
    //countBanker.text =[datatemp objectAtIndex:1];
    //countPlayer.text =[datatemp objectAtIndex:0];
    //countTie.text =   [datatemp objectAtIndex:2];
    //datatemp=datatemp;
    
    return YES;
}

-(UIImageView *)RoadmapChart:(RoadmapChart *)roadmapChart dataWithSection:(NSUInteger)section withTable:(NSString *)table withMethod:(NSString *)method
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    NSString *roadmapData[7];
    
    //http://183.182.66.167/3001/c/0/0.htm;
    //桌号 路子种类 问路。
    NSString *gamename;
    gamename =  table;
    
    NSUInteger i;
    
    //UIImage *player = [UIImage imageNamed:@"rou_R_big.png"];
    //UIImage *banker = [UIImage imageNamed:@"rou_B_big.png"];
    //UIImage *tie1 = [UIImage imageNamed:@"rou_Tie_01.png"];
    //UIImage *tie2 = [UIImage imageNamed:@"rou_Tie_02.png"];
    //UIImage *tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];
    //UIImage *smallPlayer = [UIImage imageNamed:@"rou_R_small2.png"];
    //UIImage *smallBanker = [UIImage imageNamed:@"rou_B_small2.png"];
    //UIImage *zingPlayer = [UIImage imageNamed:@"rou_R_ob.png"];
    //UIImage *zingBanker = [UIImage imageNamed:@"rou_B_ob.png"];
    
    
    UIImage *player = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_R_big.png"]];
    UIImage *banker = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_B_big.png"]];
    UIImage *tie1 = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_Tie_01.png"]];
    UIImage *tie2 = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_Tie_02.png"]];
    UIImage *tie3 = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_Tie_03.png"]];
    UIImage *smallPlayer = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_R_small2.png"]];
    UIImage *smallBanker = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_B_small2.png"]];
    UIImage *zingPlayer = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_R_ob.png"]];
    UIImage *zingBanker = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_B_ob.png"]];
     
    

    
    for (i = 1; i <= 6; i++)
	{
        if (i==5||i==6)
            roadmapData[i] = allRoadmapData[i+[method intValue] *6] ;
        else
            roadmapData[i] = allRoadmapData[i+[method intValue] *6] ;
    }
    
    
    UIGraphicsBeginImageContext(CGSizeMake(kRoadmapWidth,kRoadmapHeight));
    CGContextRef context= UIGraphicsGetCurrentContext();
    NSString *imageName;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        imageName = @"Route_bg2s.png";
    else
        imageName = @"Route_bg2@2x.png";
    
    UIImage *image = [UIImage imageNamed:imageName];
    //UIImage *image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
    [image drawInRect:CGRectMake(0, 0,kRoadmapWidth, kRoadmapHeight)];
    CGContextSaveGState(context);
    CGContextRestoreGState(context);
    
    
    float col=0,row=0;
    float w=20,h=21;
    int start;
    //NSArray *allLines =[roadmapData[i] componentsSeparatedByString: @"\n"];
    NSArray *allLines =[roadmapData[section+1] componentsSeparatedByString: @"\n"];
    int lines= [ allLines count]-2;
    i = section+1;
    
    if (lines>0){
        switch (i) {
                
            case 1:
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<=13)
                        start=0;
                    else
                    {   start=lines-14;
                        lines=14;
                    }
                    
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            
                            
                            if ([[data objectAtIndex:0] intValue]==1)
                            {  [player drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                // count_play_temp+=1;
                            }
                            else if ([[data objectAtIndex:0] intValue]==2)
                            {    [banker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                //  count_bank_temp+=1;
                            }
                            if ([[data objectAtIndex:1] intValue]>=1)
                            {[tie1 drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                            }
                            if ([[data objectAtIndex:1] intValue]>=2)
                                [tie2 drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                            if ([[data objectAtIndex:1] intValue]>=3)
                                [tie3 drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                    }
                }
                else
                {   //NSLog(@"ipad");
                    col=0,row=0;
                    w=23.8,h=21.2;

                    if (lines<=15)
                        start=0;
                    else
                    {   start=lines-16;
                        lines=16;
                    }
                    
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            
                            
                            if ([[data objectAtIndex:0] intValue]==1)
                            {  [player drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                // count_play_temp+=1;
                            }
                            else if ([[data objectAtIndex:0] intValue]==2)
                            {    [banker drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                //  count_bank_temp+=1;
                            }
                            if ([[data objectAtIndex:1] intValue]>=1)
                            {[tie1 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                            }
                            if ([[data objectAtIndex:1] intValue]>=2){
                                [tie2 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            
                            if ([[data objectAtIndex:1] intValue]>=3){
                                [tie3 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                        }
                    }
                    
                    //NSArray *allLines =[roadmapData[i+1] componentsSeparatedByString: @"\n"];
                    NSArray *allLines =[roadmapData[(section+1)+1] componentsSeparatedByString: @"\n"];
                    int lines= [ allLines count]-2;
                    col=0,row=0;
                    w=11.9,h=10.6;
                    
                    if (lines<=18)
                        start=0;
                    else
                    {   start=lines-19;
                        lines=19;
                    }
                    
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            
                            
                            if ([[data objectAtIndex:0] intValue]==1)
                            {  [player drawInRect: CGRectMake(357+col*w, 1+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                                // count_play_temp+=1;
                            }
                            else if ([[data objectAtIndex:0] intValue]==2)
                            {    [banker drawInRect: CGRectMake(357+col*w, 1+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                                //  count_bank_temp+=1;
                            }
                            
                        }
                    }
                    
                    //allLines =[roadmapData[i+2] componentsSeparatedByString: @"\n"];
                    allLines =[roadmapData[(section+1)+2] componentsSeparatedByString: @"\n"];
                    lines= [ allLines count]-2;
                    col=0,row=0;
                    w=11.9,h=10.6;
                    
                    if (lines<=18)
                        start=0;
                    else
                    {   start=lines-19;
                        lines=19;
                    }
                    
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1){
                                [smallPlayer drawInRect: CGRectMake(357+col*w, 66+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            else if ([[data objectAtIndex:0] intValue]==2){
                                [smallBanker drawInRect: CGRectMake(357+col*w, 66+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            
                        }
                    }
                    //allLines =[roadmapData[i+3] componentsSeparatedByString: @"\n"];
                    allLines =[roadmapData[(section+1)+3] componentsSeparatedByString: @"\n"];
                    lines= [ allLines count]-2;
                    col=0,row=0;
                    w=11.9,h=10.6;
                    
                    if (lines<=18)
                        start=0;
                    else
                    {   start=lines-19;
                        lines=19;
                    }
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1){
                                [zingPlayer drawInRect: CGRectMake(571+col*w, 66+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            else if ([[data objectAtIndex:0] intValue]==2){
                                [zingBanker drawInRect: CGRectMake(571+col*w, 66+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            
                        }
                    }
                    
                }
                break;
                
            case 2:
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<=33)
                        start=0;
                    else
                    {    start=lines-34;
                        lines=34;
                    }
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1)
                                [player drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            else if ([[data objectAtIndex:0] intValue]==2)
                                [banker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                    }
                }
                else
                {
                    //allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                    allLines =[roadmapData[(section+1)-1] componentsSeparatedByString: @"\n"];
                    int lines= [ allLines count]-2;
                    //NSLog(@"ipad");
                    col=0,row=0;
                    w=23.8,h=21.2;
                    
                    if (lines<=33)
                        start=0;
                    else
                    {   start=lines-34;
                        lines=34;
                    }
                    
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            
                            
                            if ([[data objectAtIndex:0] intValue]==1)
                            {  [player drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                // count_play_temp+=1;
                            }
                            else if ([[data objectAtIndex:0] intValue]==2)
                            {    [banker drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                //  count_bank_temp+=1;
                            }
                            if ([[data objectAtIndex:1] intValue]>=1)
                            {[tie1 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                            }
                            if ([[data objectAtIndex:1] intValue]>=2)
                                [tie2 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                            if ([[data objectAtIndex:1] intValue]>=3)
                                [tie3 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                    }
                }
                break;
            case 3:
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<=13)
                        start=0;
                    else
                    {    start=lines-14;
                        lines=14;
                    }
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1)
                                [smallPlayer drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            else if ([[data objectAtIndex:0] intValue]==2)
                                [smallBanker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                        }
                    }}
                else {
                    //NSArray *allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                    NSArray *allLines =[roadmapData[(section+1)-1] componentsSeparatedByString: @"\n"];
                    int lines= [ allLines count]-2;
                    col=0,row=0;
                    w=23.8,h=21.2;
                    
                    if (lines<=18)
                        start=0;
                    else
                    {   start=lines-19;
                        lines=19;
                    }
                    
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            
                            
                            if ([[data objectAtIndex:0] intValue]==1)
                            {  [player drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                // count_play_temp+=1;
                            }
                            else if ([[data objectAtIndex:0] intValue]==2)
                            {    [banker drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                //  count_bank_temp+=1;
                            }
                            
                        }
                    }
                }
                break;
            case 4:
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<=13)
                        start=0;
                    else
                    {    start=lines-14;
                        lines=14;
                    }
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1)
                                [zingPlayer drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            else if ([[data objectAtIndex:0] intValue]==2)
                                [zingBanker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                        }
                    }}
                else {
                    //NSArray *allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                    NSArray *allLines =[roadmapData[(section+1)-1] componentsSeparatedByString: @"\n"];
                    int lines= [ allLines count]-2;
                    col=0,row=0;
                    w=23.8,h=21.2;
                    
                    if (lines<=33)
                        start=0;
                    else
                    {    start=lines-34;
                        lines=34;
                    }
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1)
                                [smallPlayer drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            else if ([[data objectAtIndex:0] intValue]==2)
                                [smallBanker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                        }
                    }
                    
                }
                break;
            case 5:
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<0)
                    {
                        //NSLog(@"lies==0");
                        break;
                    }
                    
                    allLines =[[allLines objectAtIndex:1] componentsSeparatedByString: @":"];
                    if (allLines.count<2)
                    {
                        //NSLog(@"lies<1");
                        break;
                    }
                    allLines=[[allLines objectAtIndex:1] componentsSeparatedByString: @";"];
                    
                    for(col=0;col<[allLines count]-1;col++)
                    {   NSArray *data =[[allLines objectAtIndex:col] componentsSeparatedByString: @","];
                        UIImage *tmpimg ;
                        if (([[data objectAtIndex:0] intValue]%3)==1)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_0%@.png",[data objectAtIndex:1]] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"rou_R_0%@.png",[data objectAtIndex:1]]] ];
                        if (([[data objectAtIndex:0] intValue]%3)==2)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_B_0%@.png",[data objectAtIndex:1]] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"rou_B_0%@.png",[data objectAtIndex:1]]] ];
                        if (([[data objectAtIndex:0] intValue]%3)==0)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_0%@.png",[data objectAtIndex:1]] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"rou_G_0%@.png",[data objectAtIndex:1]] ];
                        [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col %6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        
                        if (([[data objectAtIndex:0] intValue]/3)==1)
                        {
                            //tmpimg= [UIImage imageNamed:@"rou_R_small3.png" ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_R_small3.png" ]];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                        if (([[data objectAtIndex:0] intValue]/3)==2)
                        {
                            //tmpimg= [UIImage imageNamed:@"rou_G_small3.png" ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_G_small3.png"] ];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                        if (([[data objectAtIndex:0] intValue]/3)==3)
                        {
                            //tmpimg= [UIImage imageNamed:@"rou_G_small3.png" ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_G_small3.png"] ];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            //tmpimg= [UIImage imageNamed:@"rou_R_small3.png" ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_R_small3.png"] ];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                    }
                    //NSLog(@"james5");
                }
                else
                {
                    //allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                    allLines =[roadmapData[(section+1)-1] componentsSeparatedByString: @"\n"];
                    int lines= [ allLines count]-2;
                    
                    col=0,row=0;
                    w=23.8,h=21.2;
                    
                    if (lines<=13)
                        start=0;
                    else
                    {    start=lines-14;
                        lines=14;
                    }
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        //NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1)
                                [zingPlayer drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            else if ([[data objectAtIndex:0] intValue]==2)
                                [zingBanker drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                        }
                    }
                }
                break;
                
            case 6:
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    col=0,row=0;
                    w=20,h=21;
                    if (lines<0)
                    { break;}
                    allLines =[[allLines objectAtIndex:1] componentsSeparatedByString: @":"];
                    if (allLines.count<2)
                        break;
                    
                    allLines=[[allLines objectAtIndex:1] componentsSeparatedByString: @";"];
                    
                    for(col=0;col<[allLines count]-1;col++)
                    {   NSArray *data =[[allLines objectAtIndex:col] componentsSeparatedByString: @","];
                        UIImage *tmpimg ;
                        if ([[data objectAtIndex:0] intValue]==1)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_big.png"] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"rou_big.png"]] ];
                        if ([[data objectAtIndex:0] intValue]==2)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_small.png"] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"rou_small.png"]] ];
                        
                        [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        
                    }}
                else {
                    
                    //allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                    allLines =[roadmapData[(section+1)-1] componentsSeparatedByString: @"\n"];
                    col=0,row=0;
                    w=23.8,h=21.2;
                    
                    if (lines<0)
                    {
                        //NSLog(@"lies==0");
                        break;
                    }
                    
                    allLines =[[allLines objectAtIndex:1] componentsSeparatedByString: @":"];
                    if (allLines.count<2)
                    {
                        //NSLog(@"lies<1");
                        break;
                    }
                    allLines=[[allLines objectAtIndex:1] componentsSeparatedByString: @";"];
                    
                    for(col=0;col<[allLines count]-1;col++)
                    {   NSArray *data =[[allLines objectAtIndex:col] componentsSeparatedByString: @","];
                        UIImage *tmpimg ;
                        if (([[data objectAtIndex:0] intValue]%3)==1)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_0%@.png",[data objectAtIndex:1]] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"rou_R_0%@.png",[data objectAtIndex:1]]] ];
                        if (([[data objectAtIndex:0] intValue]%3)==2)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_B_0%@.png",[data objectAtIndex:1]] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"rou_B_0%@.png",[data objectAtIndex:1]] ];
                        if (([[data objectAtIndex:0] intValue]%3)==0)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_0%@.png",[data objectAtIndex:1]] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"rou_G_0%@.png",[data objectAtIndex:1]]] ];
                        [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col %6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        
                        if (([[data objectAtIndex:0] intValue]/3)==1)
                        {
                            //tmpimg= [UIImage imageNamed:@"rou_R_small3.png" ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_R_small3.png"] ];
                            [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                        if (([[data objectAtIndex:0] intValue]/3)==2)
                        {
                            //tmpimg= [UIImage imageNamed:@"rou_G_small3.png" ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_G_small3.png"] ];
                            [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                        if (([[data objectAtIndex:0] intValue]/3)==3)
                        {
                            //tmpimg= [UIImage imageNamed:@"rou_G_small3.png" ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_G_small3.png" ]];
                            [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            //tmpimg= [UIImage imageNamed:@"rou_R_small3.png" ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"rou_R_small3.png"] ];
                            [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                    }
                    //allLines =[roadmapData[i] componentsSeparatedByString: @"\n"];
                    allLines =[roadmapData[section+1] componentsSeparatedByString: @"\n"];
                    col=0,row=0;
                    w=23.8,h=21.2;
                    if (lines<0)
                    { break;}
                    allLines =[[allLines objectAtIndex:1] componentsSeparatedByString: @":"];
                    if (allLines.count<2)
                        break;
                    
                    allLines=[[allLines objectAtIndex:1] componentsSeparatedByString: @";"];
                    
                    for(col=0;col<[allLines count]-1;col++)
                    {   NSArray *data =[[allLines objectAtIndex:col] componentsSeparatedByString: @","];
                        UIImage *tmpimg ;
                        if ([[data objectAtIndex:0] intValue]==1)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_big.png"] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"rou_big.png"] ]];
                        if ([[data objectAtIndex:0] intValue]==2)
                            //tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_small.png"] ];
                            tmpimg= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"rou_small.png"] ]];
                        
                        [tmpimg drawInRect: CGRectMake(405+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        
                    }
                }
                
                break;
                
            default:
                break;
        }
    } 
    
    
    image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView  = [[UIImageView alloc] initWithImage:image];
    
    //CGRect rect = imageView.frame;
    //rect.size.height = self.frame.size.height;
    //rect.size.width = self.frame.size.width;
    //imageView.frame = rect;
    imageView.tag = i;	// tag our images for later use when we place them in serial fashion
    //[self addSubview:imageView];
    
    return imageView;
}
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
