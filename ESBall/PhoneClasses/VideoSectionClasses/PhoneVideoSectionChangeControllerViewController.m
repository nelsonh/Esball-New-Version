//
//  PhoneVideoSectionChangeControllerViewController.m
//  ESBall
//
//  Created by mobile on 13/1/3.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import "PhoneVideoSectionChangeControllerViewController.h"
#import "ServerInterface.h"

@interface PhoneVideoSectionChangeControllerViewController ()

@end

@implementation PhoneVideoSectionChangeControllerViewController

@synthesize changeBG,changeFront,changeTitle,changeTop,changeUnder;
@synthesize labchang1,labchang2,labchang3,labchang4,labchang5,labchang6,labchang7,labchang8,labchang9,labchang10;
@synthesize btnchang1,btnchang2,btnchang3,btnchang4,btnchang5,btnchang6,btnchang7,btnchang8,btnchang9,btnchang10,btnPrevious;

@synthesize loadingHUD;


int tableIndex;
NSTimer *allCountTimer;   //選桌倒數使用

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self changeEachTable:0] ;
     allCountTimer  =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getCountData:) userInfo:nil repeats:YES]  ;
    btnPrevious.enabled=NO;
    
   /* NSString *animFilePath = [[NSBundle mainBundle] pathForResource:@"LoadingAnim" ofType:@"plist"];
    NSArray *animImageNames = [NSArray arrayWithContentsOfFile:animFilePath];
    NSMutableArray *animImages = [[NSMutableArray alloc] init];
    
    for(NSString *imageName in animImageNames)
    {
        FileFinder *fileFinder = [FileFinder fileFinder];
        UIImage *image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
        [animImages addObject:image];
    }
    loadingHUD = [[LoadingHUD alloc] initWithFrame:self.view.bounds loadingAnimImages:animImages];
    */
    //make sure loading hud is on top
  //  [self.view addSubview:loadingHUD];
   //
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) changeEachTable:(int)index
{
    tableIndex=index;
    CGRect temp ;
    NSString *strUrl ;
    int adjustHight=50;
 //   myUserInfo.changeindex=index;
    
    
    while ([changeFront.subviews count] > 0) {
        [[[changeFront subviews] objectAtIndex:0] removeFromSuperview];
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        /**放開按鈕設定基本底圖**/
        [btnchang1 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        [btnchang2 setImage:[UIImage imageNamed: @"bacB_btn_up.png"] forState:UIControlStateNormal];
        [btnchang3 setImage:[UIImage imageNamed: @"bacC_btn_up.png"] forState:UIControlStateNormal];
        [btnchang4 setImage:[UIImage imageNamed: @"bacD_btn_up.png"] forState:UIControlStateNormal];
        [btnchang5 setImage:[UIImage imageNamed: @"bacE_btn_up.png"] forState:UIControlStateNormal];
         [btnchang6 setImage:[UIImage imageNamed: @"DT_btn_up.png"] forState:UIControlStateNormal];
        // [btnchang7 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        // [btnchang8 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        // [btnchang9 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        // [btnchang10 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        
        if (index<9 && index>0)
        {
            /**牌路箭頭設定**/
            [changeTop setCenter:CGPointMake(160,95)] ;
            [changeBG setCenter:CGPointMake(160,103)] ;
            [changeTitle setCenter:CGPointMake(160,105)] ;
            [changeFront setCenter:CGPointMake(160,127)] ;
            [changeUnder setCenter:CGPointMake(160,246)] ;
            temp= changeTop.frame;
            [changeTop setFrame:CGRectMake(temp.origin.x ,95.0+adjustHight, temp.size.width , temp.size.height)];
            temp= changeBG.frame;
            [changeBG setFrame:CGRectMake(temp.origin.x ,103.0+adjustHight, temp.size.width , temp.size.height)];
            temp= changeTitle.frame;
            [changeTitle setFrame:CGRectMake(temp.origin.x ,105.0+adjustHight, temp.size.width , temp.size.height)];
            temp= changeFront.frame;
            [changeFront setFrame:CGRectMake(temp.origin.x ,127.0+adjustHight, temp.size.width , temp.size.height)];
            temp= changeUnder.frame;
            [changeUnder setFrame:CGRectMake(temp.origin.x ,246.0+adjustHight, temp.size.width , temp.size.height)];
            
            /**換button位置**/
            temp=btnchang5.frame;
            [btnchang5 setFrame:CGRectMake(temp.origin.x ,260.0+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang6.frame;
            [btnchang6 setFrame:CGRectMake(temp.origin.x ,260.0+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang7.frame;
            [btnchang7 setFrame:CGRectMake(temp.origin.x ,260.0+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang8.frame;
            [btnchang8 setFrame:CGRectMake(temp.origin.x ,260.0+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang9.frame;
            [btnchang9 setFrame:CGRectMake(temp.origin.x ,355.0+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang10.frame;
            [btnchang10 setFrame:CGRectMake(temp.origin.x ,355.0+adjustHight, temp.size.width , temp.size.height)];
        }
        if (index<=0)
        {
            /**牌路箭頭設定**/
            [changeTop setCenter:CGPointMake(-160,95)] ;
            [changeBG setCenter:CGPointMake(-160,103)] ;
            [changeTitle setCenter:CGPointMake(-160,105)] ;
            [changeFront setCenter:CGPointMake(-160,127)] ;
            [changeUnder setCenter:CGPointMake(-160,246)] ;
            
            /**換button位置**/
            temp=btnchang1.frame;
            [btnchang1 setFrame:CGRectMake(temp.origin.x ,14+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang2.frame;
            [btnchang2 setFrame:CGRectMake(temp.origin.x ,14+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang3.frame;
            [btnchang3 setFrame:CGRectMake(temp.origin.x ,14+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang4.frame;
            [btnchang4 setFrame:CGRectMake(temp.origin.x ,14+adjustHight, temp.size.width , temp.size.height)];
            
            temp=btnchang5.frame;
            [btnchang5 setFrame:CGRectMake(temp.origin.x ,107+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang6.frame;
            [btnchang6 setFrame:CGRectMake(temp.origin.x ,107+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang7.frame;
            [btnchang7 setFrame:CGRectMake(temp.origin.x ,107+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang8.frame;
            [btnchang8 setFrame:CGRectMake(temp.origin.x ,107+adjustHight, temp.size.width , temp.size.height)];
            
            temp=btnchang9.frame;
            [btnchang9 setFrame:CGRectMake(temp.origin.x ,200+adjustHight, temp.size.width , temp.size.height)];
            temp=btnchang10.frame;
            [btnchang10 setFrame:CGRectMake(temp.origin.x ,200+adjustHight, temp.size.width , temp.size.height)];
        }
        [labchang1 setFrame:CGRectMake(labchang1.frame.origin.x ,btnchang1.frame.origin.y-1, 27 , 21)];
        [labchang2 setFrame:CGRectMake(labchang2.frame.origin.x ,btnchang2.frame.origin.y-1, 27 , 21)];
        [labchang3 setFrame:CGRectMake(labchang3.frame.origin.x ,btnchang3.frame.origin.y-1, 27 , 21)];
        [labchang4 setFrame:CGRectMake(labchang4.frame.origin.x ,btnchang4.frame.origin.y-1, 27 , 21)];
        [labchang5 setFrame:CGRectMake(labchang5.frame.origin.x ,btnchang5.frame.origin.y-1, 27 , 21)];
        [labchang6 setFrame:CGRectMake(labchang6.frame.origin.x ,btnchang6.frame.origin.y-1, 27 , 21)];
        [labchang7 setFrame:CGRectMake(labchang7.frame.origin.x ,btnchang7.frame.origin.y-1, 27 , 21)];
        [labchang8 setFrame:CGRectMake(labchang8.frame.origin.x ,btnchang8.frame.origin.y-1, 27 , 21)];
        [labchang9 setFrame:CGRectMake(labchang9.frame.origin.x ,btnchang9.frame.origin.y-1, 27 , 21)];
        [labchang10 setFrame:CGRectMake(labchang10.frame.origin.x ,btnchang10.frame.origin.y-1, 27 , 21)];
        
        switch (index) {
            case 1:
                [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_top_bgs.png", index]]];
                [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_down_bgs.png"]]];
                changeTitle.text=@"百家乐 A";
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"a"] ;
                [btnchang1 setImage:[UIImage imageNamed: @"bacA_btn_down.png"] forState:UIControlStateNormal];
                break;
            case 2:
                [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_top_bgs.png", index]]];
                [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_down_bgs.png"]]];
                changeTitle.text=@"百家乐 B";
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"b"] ;
                [btnchang2 setImage:[UIImage imageNamed: @"bacB_btn_down.png"] forState:UIControlStateNormal];
                break;
            case 3:
                [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_top_bgs.png", index]]];
                [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_down_bgs.png"]]];
                changeTitle.text=@"百家乐 C";
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"c"] ;
                [btnchang3 setImage:[UIImage imageNamed: @"bacC_btn_down.png"] forState:UIControlStateNormal];
                break;
            case 4:
                [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_top_bgs.png", index]]];
                [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_down_bgs.png"]]];
                changeTitle.text=@"百家乐 D";
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"d"] ;
                [btnchang4 setImage:[UIImage imageNamed: @"bacD_btn_down.png"] forState:UIControlStateNormal];
                break;
                
            case 5:
                [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_top_bgs.png"]]];
                [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_down_bgs.png", index%4]]];
                [self.view bringSubviewToFront:changeUnder];
                changeTitle.text=@"百家乐 E";
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"e"] ;
                [btnchang5 setImage:[UIImage imageNamed: @"bacE_btn_down.png"] forState:UIControlStateNormal];
                break;
                
            case 6:
                [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_top_bgs.png"]]];
                [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_down_bgs.png", index%4]]];
                changeTitle.text=@"龙虎斗 A";
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3003/%@/4/0.htm" ,@"a"] ;
                [btnchang6 setImage:[UIImage imageNamed: @"DT_btn_down.png"] forState:UIControlStateNormal];
                break;
                
            default:
                break;
                
                
                
                
        }
        //http://183.182.66.167/3001/c/0/0.htm;
        //桌号 路子种类 问路。
             
        NSString *roadmapData;
        NSUInteger i;
        
        if (index<=5)
        {
        UIImage *player = [UIImage imageNamed:@"rou_R_big.png"];
        UIImage *banker = [UIImage imageNamed:@"rou_B_big.png"];
        UIImage *tie1 = [UIImage imageNamed:@"rou_Tie_01.png"];
        UIImage *tie2 = [UIImage imageNamed:@"rou_Tie_02.png"];
        UIImage *tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];      
        
    
            
        
        UIGraphicsBeginImageContext(CGSizeMake(298,112));
        CGContextRef context= UIGraphicsGetCurrentContext();
        NSString *imageName = [NSString stringWithFormat:@"route_bg_bacs.png"];
        UIImage *image = [UIImage imageNamed:imageName];
        [image drawInRect:CGRectMake(0, 0,298, 112)];
        CGContextSaveGState(context);
        CGContextRestoreGState(context);
        
        NSURL *url = [NSURL URLWithString:strUrl];
        roadmapData= [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"jamestest4%@",roadmapData);
        
        int col=0,row=0;
        double w=20,h=21;
        int start;
        NSArray *allLines =[roadmapData componentsSeparatedByString: @"\n"];
        int lines= [ allLines count]-2;
        
        if (lines>0)
        {
            col=0,row=0;
            //w=18.6,h=17.8;
            w=18.6,h=18.5;
            //   int count_bank_temp=0,count_play_temp=0,count_tie_temp=0;
            
            if (lines<=16)
                start=0;
            else
            {   start=lines-17;
                lines=17;
            }
            
            for(col=0;col<lines-1;col++)
            {
                NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                NSLog([allrows objectAtIndex:1],nil);
                allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                
                for(row=0;row<6;row++)
                {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                    
                    
                    if ([[data objectAtIndex:0] intValue]==1)
                    {  [player drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        // count_play_temp+=1;
                    }
                    else if ([[data objectAtIndex:0] intValue]==2)
                    {    [banker drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        //   count_bank_temp+=1;
                    }
                    if ([[data objectAtIndex:1] intValue]>=1)
                    {[tie1 drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                    }
                    if ([[data objectAtIndex:1] intValue]>=2)
                        [tie2 drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                    
                    if ([[data objectAtIndex:1] intValue]>=3)
                        [tie3 drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                }
            }
            // countBanker.text =[NSString stringWithFormat:@"%d", count_bank_temp];
            //  countPlayer.text =[NSString stringWithFormat:@"%d", count_play_temp];;
            //  countTie.text =   [NSString stringWithFormat:@"%d", count_tie_temp];;
            
        }
        image=UIGraphicsGetImageFromCurrentImageContext()   ;
        
        
        UIImageView *imageView  = [[UIImageView alloc] initWithImage:image];
        
        CGRect rect = imageView.frame;
        rect.size.height = 118;
        rect.size.width = 298;
        imageView.frame = rect;
        imageView.tag = i;	// tag our images for later use when we place them in serial fashion
        [changeFront addSubview:imageView];
        }
        
        if (index==6)
        {
            UIImage *player = [UIImage imageNamed:@"DTrou_R_Dragon.png"];
            UIImage *banker = [UIImage imageNamed:@"DTrou_Y_Tiger.png"];
            UIImage *tie = [UIImage imageNamed:@"DTrou_G_Tie.png"];           
            
            
            UIGraphicsBeginImageContext(CGSizeMake(298,112));
            CGContextRef context= UIGraphicsGetCurrentContext();
            NSString *imageName = [NSString stringWithFormat:@"route_bg_bacs.png"];
            UIImage *image = [UIImage imageNamed:imageName];
            [image drawInRect:CGRectMake(0, 0,298, 112)];
            CGContextSaveGState(context);
            CGContextRestoreGState(context);
            
            NSURL *url = [NSURL URLWithString:strUrl];
            roadmapData= [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
            NSLog(@"jamestest4%@",roadmapData);
            
            int col=0,row=0;
            double w=20,h=21;
            int start;
            NSArray *allLines =[roadmapData componentsSeparatedByString: @"\n"];
            int lines= [ allLines count]-2;
            
            if (lines>0)
            {
                col=0,row=0;
                w=18.6,h=18.4;
                //   int count_bank_temp=0,count_play_temp=0,count_tie_temp=0;
                
                if (lines<=16)
                    start=0;
                else
                {   start=lines-17;
                    lines=17;
                }
                
                for(col=0;col<lines-1;col++)
                {
                    NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                    NSLog(@"james");
                    NSLog([allrows objectAtIndex:1],nil);
                    NSLog(@"james");                   
                    int count= ([[allrows objectAtIndex:1] length]-5)/4;
                     allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                    for(row=0;row<count;row++)                        
                    {
                        NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                        
                        
                        if ([[data objectAtIndex:0] intValue]==2)
                        {  [player drawInRect: CGRectMake(1+col*w+(row/6)*w, 0+(row%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            // count_play_temp+=1;
                        }
                        else if ([[data objectAtIndex:0] intValue]==1)
                        {    [banker drawInRect: CGRectMake(1+col*w+(row/6)*w, 0+(row%6)*h,18, 18)  blendMode:kCGBlendModeNormal alpha:1.0f];
                            //   count_bank_temp+=1;
                        }
                        else if ([[data objectAtIndex:0] intValue]==0)
                        {    [tie drawInRect:  CGRectMake(1+col*w+(row/6)*w, 0+(row%6)*h,18, 18)  blendMode:kCGBlendModeNormal alpha:1.0f];
                            //   count_bank_temp+=1;
                        }
                       
                    }
                }
                              
            }
            image=UIGraphicsGetImageFromCurrentImageContext()   ;
            
            
            UIImageView *imageView  = [[UIImageView alloc] initWithImage:image];
            
            CGRect rect = imageView.frame;
            rect.size.height = 118;
            rect.size.width = 298;
            imageView.frame = rect;
            imageView.tag = i;	// tag our images for later use when we place them in serial fashion
            [changeFront addSubview:imageView];
        }

        
    }
    else
    {
        /**圖片設製**/
        [btnchang1 setImage:[UIImage imageNamed: @"BaccaratA@2x.png"] forState:UIControlStateNormal];
        [btnchang2 setImage:[UIImage imageNamed: @"BaccaratB@2x.png"] forState:UIControlStateNormal];
        [btnchang3 setImage:[UIImage imageNamed: @"BaccaratC@2x.png"] forState:UIControlStateNormal];
        [btnchang4 setImage:[UIImage imageNamed: @"BaccaratD@2x.png"] forState:UIControlStateNormal];
        [btnchang5 setImage:[UIImage imageNamed: @"BaccaratE@2x.png"] forState:UIControlStateNormal];
         [btnchang6 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        // [btnchang7 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        // [btnchang8 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        // [btnchang9 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        // [btnchang10 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
        
        
        /**牌路底圖設定**/
        switch (index) {
            case 1:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"a"] ;
                [btnchang1 setImage:[UIImage imageNamed: @"BaccaratA_down@2x.png"] forState:UIControlStateNormal];
                break;
            case 2:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"b"] ;
                [btnchang2 setImage:[UIImage imageNamed: @"BaccaratB_down@2x.png"] forState:UIControlStateNormal];
                break;
            case 3:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"c"] ;
                [btnchang3 setImage:[UIImage imageNamed: @"BaccaratC_down@2x.png"] forState:UIControlStateNormal];
                break;
            case 4:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"d"] ;
                [btnchang4 setImage:[UIImage imageNamed: @"BaccaratD_down@2x.png"] forState:UIControlStateNormal];
                break;
                
            case 5:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"e"] ;
                [btnchang5 setImage:[UIImage imageNamed: @"BaccaratE_down@2x.png"] forState:UIControlStateNormal]; 
                break;
                
                
                
            default:
                break;
        }
        
        
        
    }
    
    
    
}

-(void) getCountData:(NSTimer *)allCountTimer
{
    NSString *tempAnalyze;
    NSArray *currentTimes;
    NSURL *url = [NSURL URLWithString:@"http://183.182.66.167/8eea62084ca7e541d918e823422bd82e.htm"];
    tempAnalyze= [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    currentTimes=   [ tempAnalyze componentsSeparatedByString:@";"];
    if (currentTimes.count>100)
    {
        labchang1.text=[currentTimes objectAtIndex:7];
        labchang2.text=[currentTimes objectAtIndex:17];
        labchang3.text=[currentTimes objectAtIndex:27];
        labchang4.text=[currentTimes objectAtIndex:37];
        labchang5.text=[currentTimes objectAtIndex:47];
        labchang8.text=[currentTimes objectAtIndex:57];
        labchang7.text=[currentTimes objectAtIndex:68];
        labchang6.text=[currentTimes objectAtIndex:78];
        // labchang9.text=[currentTimes objectAtIndex:89];
        
        int tempint=[[currentTimes objectAtIndex:89] intValue];
        if (tempint>0)
            labchang9.text=   [currentTimes objectAtIndex:89];
        else
            labchang9.text=   @"0";
        
        tempint=[[currentTimes objectAtIndex:99] intValue];
        if (tempint>0)
            labchang10.text=   [currentTimes objectAtIndex:99];
        else
            labchang10.text=   @"0";   
    }
}


-(IBAction)down_changeICO1
{
    [self changeEachTable:1] ;    
}
-(IBAction)down_changeICO2
{
    [self changeEachTable:2] ;
}
-(IBAction)down_changeICO3
{
    [self changeEachTable:3] ;
}
-(IBAction)down_changeICO4
{
    [self changeEachTable:4] ;
}
-(IBAction)down_changeICO5
{
    [self changeEachTable:5] ;
}
-(IBAction)down_changeICO6
{
     [self changeEachTable:6] ;
}
-(IBAction)down_changeICO7
{
    
}
-(IBAction)down_changeICO8
{
    
}
-(IBAction)down_changeICO9
{
    
}
-(IBAction)down_changeIC10
{
    
}

-(IBAction)down_changetable
{
    
    if(tableIndex <= 0)
    {
        NSString *msg = NSLocalizedString(@"请选择想要进入的游戏", @"请选择想要进入的游戏");
        
        UIAlertView *noneSelectAlert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        
        [noneSelectAlert show];
        
        return;
    }
    
    if (tableIndex<=5)
    {
        BaseGameViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"BaccaratGameViewController"];
    
        controller.tableNumber = tableIndex-1;
        controller.gameType = 3001;
        [self presentViewController:controller animated:YES completion:nil];

        
    }else if(tableIndex==6)
    {
        BaseGameViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DragonTigerGameViewController"];
        
        controller.tableNumber = tableIndex-1;
        controller.gameType = 3003;
        [self presentViewController:controller animated:YES completion:nil];

    }
 
}

-(void)dismiss
{
    [self.presentedViewController dismissModalViewControllerAnimated:NO];
}

-(IBAction)logout:(id)sender
{
    ServerInterface *theInterface = [ServerInterface serverInterface];
    [theInterface logout];
}

@end
