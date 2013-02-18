//
//  BaccaratItemViewController.m
//  ESBall
//
//  Created by Nelson on 1/28/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BaccaratItemViewController.h"

@interface BaccaratItemViewController ()

@end

@implementation BaccaratItemViewController

@synthesize roadmapRefView = _roadmapRefView;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - override
-(void)displayRoadmap
{
    UIImage *player;
    UIImage *banker;
    UIImage *tie1;
    UIImage *tie2;
    UIImage *tie3;
    
    player = [UIImage imageNamed:@"rou_R_big.png"];
    banker = [UIImage imageNamed:@"rou_B_big.png"];
    tie1 = [UIImage imageNamed:@"rou_Tie_02.png"];
    tie2 = [UIImage imageNamed:@"rou_Tie_01.png"];
    tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];
    
    /*
    if(self.gameType == 3001)
    {
        player = [UIImage imageNamed:@"rou_R_big.png"];
        banker = [UIImage imageNamed:@"rou_B_big.png"];
        tie1 = [UIImage imageNamed:@"rou_Tie_01.png"];
        tie2 = [UIImage imageNamed:@"rou_Tie_02.png"];
        tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];
    }
    else if(_gameType == 3003)
    {
        player = [UIImage imageNamed:@"DTrou_Y_big.png"];
        banker = [UIImage imageNamed:@"DTrou_R_big.png"];
        tie1 = [UIImage imageNamed:@"rou_Tie_01.png"];
        tie2 = [UIImage imageNamed:@"rou_Tie_02.png"];
        tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];
    }
     */
    
    
    if(roadmapImageView)
    {
        [roadmapImageView removeFromSuperview];
        roadmapImageView = nil;
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(_roadmapRefView.frame.size.width, _roadmapRefView.frame.size.height));
    //NSString *imageName = @"route_bg_bac.png";
    //UIImage *image = [UIImage imageNamed:imageName];
    //[image drawInRect:CGRectMake(0, 0,298, 112)];
    //CGContextSaveGState(context);
    //CGContextRestoreGState(context);
    
    //stroke line width
    CGFloat lineWidth = 1.0f;
    //inset
    CGFloat inset = lineWidth/2.0f;
    
    //get context
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //set color
    CGContextSetStrokeColorWithColor(currentContext, [UIColor blackColor].CGColor);
    //set stroke line width
    CGContextSetLineWidth(currentContext, lineWidth);
    //a square width
    CGFloat squareWidth = _roadmapRefView.frame.size.width/13 + 0.1;
    //a square height
    CGFloat squareHeight = _roadmapRefView.frame.size.height/6 + 0.1;
    
    //unhide ref view
    _roadmapRefView.hidden = NO;
    
    //draw square
    for(int i = 0; i < 13; i++)
    {
        for(int j =0; j < 6; j++)
        {
            CGContextMoveToPoint(currentContext, i*squareWidth+squareWidth, j*squareHeight);
            CGContextAddLineToPoint(currentContext, i*squareWidth+squareWidth, j*squareHeight+squareHeight);
            CGContextStrokePath(currentContext);
            
            CGContextMoveToPoint(currentContext, i*squareWidth, j*squareHeight+squareHeight);
            CGContextAddLineToPoint(currentContext, i*squareWidth+squareWidth, j*squareHeight+squareHeight);
            CGContextStrokePath(currentContext);
        }
    }
    
    
    UIImage *image;
    
    NSString *roadmapDataStr= [[NSString alloc] initWithData:roadmapData encoding:NSUTF8StringEncoding];
    
    int col=0,row=0;
    //double w=20,h=21;
    CGFloat w=squareWidth-inset, h=squareHeight-inset;
    int start;
    NSArray *allLines =[roadmapDataStr componentsSeparatedByString: @"\n"];
    int lines= [ allLines count]-2;
    
    if (lines>0)
    {
        col=0,row=0;
        //w=20.2,h=19;
        //   int count_bank_temp=0,count_play_temp=0,count_tie_temp=0;
        /*
        if (lines<=16)
            start=0;
        else
        {   start=lines-17;
            lines=17;
        }
         */
        
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
                {  [player drawInRect: CGRectMake(col*(w+inset)+inset, row*(h+inset)+inset, w, h) blendMode:kCGBlendModeNormal alpha:1.0f];
                    // count_play_temp+=1;
                }
                else if ([[data objectAtIndex:0] intValue]==2)
                {    [banker drawInRect: CGRectMake(col*(w+inset)+inset, row*(h+inset)+inset, w, h) blendMode:kCGBlendModeNormal alpha:1.0f];
                    //   count_bank_temp+=1;
                }
                if ([[data objectAtIndex:1] intValue]>=1)
                {[tie1 drawInRect: CGRectMake(col*(w+inset)+inset, row*(h+inset)+inset, w, h) blendMode:kCGBlendModeNormal alpha:1.0f];
                    //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                }
                if ([[data objectAtIndex:1] intValue]>=2)
                    [tie2 drawInRect: CGRectMake(col*(w+inset)+inset, row*(h+inset)+inset, w, h) blendMode:kCGBlendModeNormal alpha:1.0f];
                
                if ([[data objectAtIndex:1] intValue]>=3)
                    [tie3 drawInRect: CGRectMake(col*(w+inset)+inset, row*(h+inset)+inset, w, h) blendMode:kCGBlendModeNormal alpha:1.0f];
            }
        }
        // countBanker.text =[NSString stringWithFormat:@"%d", count_bank_temp];
        //  countPlayer.text =[NSString stringWithFormat:@"%d", count_play_temp];;
        //  countTie.text =   [NSString stringWithFormat:@"%d", count_tie_temp];;
        
    }
    
    image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIImageView *imageView  = [[UIImageView alloc] initWithFrame:_roadmapRefView.frame];
    imageView.image = [UIImage imageWithCGImage:image.CGImage];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    UIGraphicsEndImageContext();
    
    [self.view addSubview:imageView];
    roadmapImageView = imageView;
    
    roadmapData = nil;
    
}


@end
