//
//  RoadmapChart.m
//  ESBall
//
//  Created by Nelson on 12/6/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "RoadmapChart.h"
#import <QuartzCore/QuartzCore.h>



@interface RoadmapChart ()

//-(BOOL)shouldDrawRoadmapData;
//- (void)layoutScrollImagesWithSections:(NSArray *)sections andSectionDatas:(NSArray *)sectionDatas;

@end

@implementation RoadmapChart

//@synthesize roadmapChartDelegate = _roadmapChartDelegate;
@synthesize redrawRoadmap = _redrawRoadmap;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"roadmap chart dealloc");
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    _redrawRoadmap = NO;
}

#pragma mark - public interface
-(CGFloat)roadmapChartWidth
{
    return 0.0f;
}

-(CGFloat)roadmapChartHeight
{
    return 0.0f;
}

-(NSString *)roadmapBaseImageName
{
    return @"";
}

-(NSString *)playerImageName
{
    return @"";
}

-(NSString *)bankerImageName
{
    return @"";
}

-(NSString *)tie1ImageName
{
    return @"";
}

-(NSString *)tie2ImageName
{
    return @"";
}

-(NSString *)tie3ImageName
{
    return @"";
}

-(NSString *)smallPlayerImageName
{
    return @"";
}

-(NSString *)smallBankerImageName
{
    return @"";
}

-(NSString *)zingPlayerImageName
{
    return @"";
}

-(NSString *)zingBankerImageName
{
    return @"";
}

#pragma mark - internal
/*
-(BOOL)shouldDrawRoadmapData
{
    
    if([_roadmapChartDelegate respondsToSelector:@selector(RoadmapChartShouldDrawRoadmap:withTable:)])
    {
        return [_roadmapChartDelegate RoadmapChartShouldDrawRoadmap:self withTable:self.table];
    }
    else
    {
        //default return no
        return NO;
    }
     
     
}
 */

-(void)updateRoadmapData
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
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/%i/0.htm" ,self.table,i-1] ;
            else
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/%i/%i.htm" ,self.table,i-1,j] ;
            
            //  NSLog(strUrl);
            NSURL *url = [NSURL URLWithString:strUrl];
            allRoadmapData[i+j*6]= [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
            
            
        }
    }
    
    strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/7/0.htm" ,self.table] ;
    NSURL *url = [NSURL URLWithString:strUrl];
    strUrl=  [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
    //datatemp=[strUrl componentsSeparatedByString: @";"];
    //NSLog(strUrl);
    //countBanker.text =[datatemp objectAtIndex:1];
    //countPlayer.text =[datatemp objectAtIndex:0];
    //countTie.text =   [datatemp objectAtIndex:2];
    //datatemp=datatemp;
}

-(void)DrawRoadmapChart
{
    /*
    NSMutableArray *sections = [[NSMutableArray alloc] init];
    NSMutableArray *sectionDatas = [[NSMutableArray alloc] init];
    int currentSectionNumber = self.bounds.origin.x / self.bounds.size.width;
    int leftSectionNumber = currentSectionNumber-1;
    int rightSectionNumber = currentSectionNumber+1;
    
    //NSLog(@"current section number:%i", currentSectionNumber);
    
    if(currentSectionNumber <= (numberOfSections-1) && currentSectionNumber >= 0)
    {
        if(leftSectionNumber >= 0 && rightSectionNumber <= (numberOfSections-1))
        {
            //3 sections from left to right
            [sections addObject:[NSNumber numberWithUnsignedInteger:leftSectionNumber]];
            [sections addObject:[NSNumber numberWithUnsignedInteger:currentSectionNumber]];
            [sections addObject:[NSNumber numberWithUnsignedInteger:rightSectionNumber]];
        }
        else if(leftSectionNumber < 0 && rightSectionNumber > (numberOfSections-1))
        {
            //1 section current one
            [sections addObject:[NSNumber numberWithUnsignedInteger:currentSectionNumber]];
        }
        else if(leftSectionNumber < 0)
        {
            // 2 sections to the right from current one
            [sections addObject:[NSNumber numberWithUnsignedInteger:currentSectionNumber]];
            [sections addObject:[NSNumber numberWithUnsignedInteger:rightSectionNumber]];
        }
        else if(rightSectionNumber > (numberOfSections-1))
        {
            //2 sections to the left from left one
            [sections addObject:[NSNumber numberWithUnsignedInteger:leftSectionNumber]];
            [sections addObject:[NSNumber numberWithUnsignedInteger:currentSectionNumber]];
        }
    }
    else
    {
        NSLog(@"fail to draw chart");
        //fail
        return;
    }
    
    if([_roadmapChartDelegate respondsToSelector:@selector(RoadmapChart:dataWithSection:withTable:withMethod:)])
    {
        for(NSNumber *section in sections)
        {
            NSUInteger sectionNumber = [section unsignedIntegerValue];
            UIImageView *sectionData = [_roadmapChartDelegate RoadmapChart:self dataWithSection:sectionNumber withTable:self.table withMethod:self.method];
            
            
            if(sectionData)
                [sectionDatas addObject:sectionData];
            else
                return;
        }
        
        //layout data view
        [self layoutScrollImagesWithSections:sections andSectionDatas:sectionDatas];
    }
     */
     
    
    /*
    [sections addObject:[NSNumber numberWithUnsignedInteger:first]];
    NSUInteger remain = (int)self.bounds.origin.x % (int)self.bounds.size.width;
    
    NSLog(@"originX:%f width:%f", self.bounds.origin.x, self.bounds.size.width);
    
    if(remain != 0)
    {
        NSUInteger second = first++;
        [sections addObject:[NSNumber numberWithUnsignedInteger:second]];
    }
    */
    

    


    //self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];

    NSString *roadmapData[7];
    
    //http://183.182.66.167/3001/c/0/0.htm;
    //桌号 路子种类 问路。
    NSString *gamename;
    gamename =  self.table ;
    
    NSUInteger i;
    
    /*
    UIImage *player = [UIImage imageNamed:@"rou_R_big.png"];
    UIImage *banker = [UIImage imageNamed:@"rou_B_big.png"];
    UIImage *tie1 = [UIImage imageNamed:@"rou_Tie_01.png"];
    UIImage *tie2 = [UIImage imageNamed:@"rou_Tie_02.png"];
    UIImage *tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];
    UIImage *smallPlayer = [UIImage imageNamed:@"rou_R_small2.png"];
    UIImage *smallBanker = [UIImage imageNamed:@"rou_B_small2.png"];
    UIImage *zingPlayer = [UIImage imageNamed:@"rou_R_ob.png"];
    UIImage *zingBanker = [UIImage imageNamed:@"rou_B_ob.png"];
     */
    UIImage *player = [UIImage imageNamed:[self playerImageName]];
    UIImage *banker = [UIImage imageNamed:[self bankerImageName]];
    UIImage *tie1 = [UIImage imageNamed:[self tie2ImageName]];
    UIImage *tie2 = [UIImage imageNamed:[self tie1ImageName]];
    UIImage *tie3 = [UIImage imageNamed:[self tie3ImageName]];
    UIImage *smallPlayer = [UIImage imageNamed:[self smallPlayerImageName]];
    UIImage *smallBanker = [UIImage imageNamed:[self smallBankerImageName]];
    UIImage *zingPlayer = [UIImage imageNamed:[self zingPlayerImageName]];
    UIImage *zingBanker = [UIImage imageNamed:[self zingBankerImageName]];
    
    /*
    while ([self.subviews count] > 0) {
        //NSLog(@"subviews Count=%d",[[myScrollView subviews]count]);
        [[[self subviews] objectAtIndex:0] removeFromSuperview];
    }
    */
    
    for (i = 1; i <= 6; i++)
	{
        if (i==5||i==6)
            roadmapData[i] = allRoadmapData[i+[self.method intValue] *6] ;
        else
            roadmapData[i] = allRoadmapData[i+[self.method intValue] *6] ;
    }
    
    
	for (i = 1; i <= numberOfSections; i++)
	{
        
        //UIGraphicsBeginImageContext(CGSizeMake(kRoadmapWidth,kRoadmapHeight));
        UIGraphicsBeginImageContext(CGSizeMake([self roadmapChartWidth],[self roadmapChartHeight]));
        CGContextRef context= UIGraphicsGetCurrentContext();
        NSString *imageName;
        
        /*
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            imageName = @"Route_bg2s.png";
        else
            imageName = @"Route_bg2@2x.png";
         */
        
        //draw background
        imageName = [self roadmapBaseImageName];
        
        UIImage *image = [UIImage imageNamed:imageName];
        //[image drawInRect:CGRectMake(0, 0,kRoadmapWidth, kRoadmapHeight)];
        [image drawInRect:CGRectMake(0, 0,[self roadmapChartWidth], [self roadmapChartHeight])];
        
        CGContextSaveGState(context);
        CGContextRestoreGState(context);
        
        
        float col=0,row=0;
        float w=20,h=21;
        int start;
        NSArray *allLines =[roadmapData[i] componentsSeparatedByString: @"\n"];
        int lines= [ allLines count]-2;
        
        if (lines>0)
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
                        
                        NSArray *allLines =[roadmapData[i+1] componentsSeparatedByString: @"\n"];
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
                        
                        allLines =[roadmapData[i+2] componentsSeparatedByString: @"\n"];
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
                        allLines =[roadmapData[i+3] componentsSeparatedByString: @"\n"];
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
                        allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
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
                        NSArray *allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
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
                        NSArray *allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
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
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_0%@.png",[data objectAtIndex:1]] ];
                            if (([[data objectAtIndex:0] intValue]%3)==2)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_B_0%@.png",[data objectAtIndex:1]] ];
                            if (([[data objectAtIndex:0] intValue]%3)==0)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_0%@.png",[data objectAtIndex:1]] ];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col %6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                            if (([[data objectAtIndex:0] intValue]/3)==1)
                            {
                                tmpimg= [UIImage imageNamed:@"rou_R_small3.png" ];
                                [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            if (([[data objectAtIndex:0] intValue]/3)==2)
                            {
                                tmpimg= [UIImage imageNamed:@"rou_G_small3.png" ];
                                [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            if (([[data objectAtIndex:0] intValue]/3)==3)
                            {
                                tmpimg= [UIImage imageNamed:@"rou_G_small3.png" ];
                                [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                tmpimg= [UIImage imageNamed:@"rou_R_small3.png" ];
                                [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                        }
                        //NSLog(@"james5");
                    }
                    else
                    {
                        allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
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
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_big.png"] ];
                            if ([[data objectAtIndex:0] intValue]==2)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_small.png"] ];
                            
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                        }}
                    else {
                        
                        allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
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
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_0%@.png",[data objectAtIndex:1]] ];
                            if (([[data objectAtIndex:0] intValue]%3)==2)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_B_0%@.png",[data objectAtIndex:1]] ];
                            if (([[data objectAtIndex:0] intValue]%3)==0)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_0%@.png",[data objectAtIndex:1]] ];
                            [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col %6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                            if (([[data objectAtIndex:0] intValue]/3)==1)
                            {
                                tmpimg= [UIImage imageNamed:@"rou_R_small3.png" ];
                                [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            if (([[data objectAtIndex:0] intValue]/3)==2)
                            {
                                tmpimg= [UIImage imageNamed:@"rou_G_small3.png" ];
                                [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            if (([[data objectAtIndex:0] intValue]/3)==3)
                            {
                                tmpimg= [UIImage imageNamed:@"rou_G_small3.png" ];
                                [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                tmpimg= [UIImage imageNamed:@"rou_R_small3.png" ];
                                [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                        }
                        allLines =[roadmapData[i] componentsSeparatedByString: @"\n"];
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
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_big.png"] ];
                            if ([[data objectAtIndex:0] intValue]==2)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_small.png"] ];
                            
                            [tmpimg drawInRect: CGRectMake(405+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                        }
                    }
                    
                    break;
                    
                default:
                    break;
            }
        
        
        image=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
		
		UIImageView *imageView  = [[UIImageView alloc] initWithImage:image];
		
        CGRect rect = imageView.frame;
		rect.size.height = self.frame.size.height;
		rect.size.width = self.frame.size.width;
		imageView.frame = rect;
		imageView.tag = i;	// tag our images for later use when we place them in serial fashion
		[self addSubview:imageView];
		
	}
    
	
    [self layoutScrollImages];
 

}

/*
- (void)layoutScrollImagesWithSections:(NSArray *)sections andSectionDatas:(NSArray *)sectionDatas
{

    //NSLog(@"sections:%i", sections.count);
    //NSLog(@"sectionData:%i", sectionDatas.count);
    
    for(int i = 0; i < [sections count]; i++)
    {
        NSNumber *sectionNumber = [sections objectAtIndex:i];
        NSUInteger section = [sectionNumber integerValue];
        UIImageView *sectionDataView = (UIImageView *)[sectionDatas objectAtIndex:i];
        
        if(sectionDataView == nil)
            NSLog(@"no image data view");
        
        //adjust frame
        //CGRect rect = sectionData.frame;
        //rect.size.height = self.frame.size.height;
        //rect.size.width = self.frame.size.width;
        //sectionData.frame = rect;
        
        CGRect newRect;
        CGFloat xPos = (section * self.frame.size.width);
        CGFloat yPos = 0;
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        newRect = CGRectMake(xPos, yPos, width, height);
        sectionDataView.frame = newRect;
        
        [self addSubview:sectionDataView];
    }
        
}
*/

- (void)layoutScrollImages
{
    UIImageView *view = nil;
	NSArray *subviews = [self subviews];
    //NSLog(@"james5 %i",[[self subviews] count] );
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                curXLoc += self.frame.size.width;
            else
                curXLoc += self.frame.size.width;
        }
	}
	
	// set the content size so it can be scrollable
	//[self setContentSize:CGSizeMake((6 * self.frame.size.width), self.frame.size.height-1)];	// now place the photos in serial layout
}
 

#pragma mark - ovrride method
-(void)initilizeWithDelegate:(id<RoadmapDataViewDelegate>)delegate
{
    [super initilizeWithDelegate:delegate];
    
    if([self.theDelegate respondsToSelector:@selector(RoadmapChartNumberOfContent:)])
    {
        NSUInteger numberOfContent = [self.theDelegate RoadmapChartNumberOfContent:self];
        numberOfSections = numberOfContent;
        
        //adjust content size
        [self setContentSize:CGSizeMake((numberOfContent * self.frame.size.width), self.frame.size.height-1)];
    }
}
-(void)prepareToDraw
{
    [super prepareToDraw];
    
    //clean all previous add data view before drawing
    for(UIView *dataView in self.subviews)
    {
        if([dataView isKindOfClass:[UIImageView class]])
        {
            [dataView removeFromSuperview];
        }
    }
    
	[self setBackgroundColor:[UIColor blackColor]];
	[self setCanCancelContentTouches:NO];
	self.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	self.clipsToBounds = YES;
	self.scrollEnabled = YES;
	self.pagingEnabled = YES;
}

-(void)updateView
{
    [super updateView];
    //[self shouldDrawRoadmapData];
    
    if(!_redrawRoadmap)
        [self updateRoadmapData];
    
    [self DrawRoadmapChart];
    
    /*
    //only draw chart when data is set
    if([self shouldDrawRoadmapData])
        [self DrawRoadmapChart];
     */
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
