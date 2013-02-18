//
//  DTItemViewController.m
//  ESBall
//
//  Created by Nelson on 1/28/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "DTItemViewController.h"

@interface DTItemViewController ()

@end

@implementation DTItemViewController

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
-(NSUInteger)page
{
    return 4;
}

-(void)displayRoadmap
{
    UIImage *player;
    UIImage *banker;
    UIImage *tie;

    
    player = [UIImage imageNamed:@"DTrou_Y_Tiger.png"];
    banker = [UIImage imageNamed:@"DTrou_R_Dragon.png"];
    tie = [UIImage imageNamed:@"DTrou_G_Tie.png"];

    
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
    int lines= [allLines count]-3;
    
    if(lines <= 0)
    {
        image=UIGraphicsGetImageFromCurrentImageContext();
        
        UIImageView *imageView  = [[UIImageView alloc] initWithFrame:_roadmapRefView.frame];
        imageView.image = [UIImage imageWithCGImage:image.CGImage];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        
        UIGraphicsEndImageContext();
        
        [self.view addSubview:imageView];
        roadmapImageView = imageView;
        
        roadmapData = nil;
        
        
        return;
    }
    
    
    
    if (lines>0)
    {
        col=0,row=0;
        //w=20.2,h=19;
        //   int count_bank_temp=0,count_play_temp=0,count_tie_temp=0;
        
        NSArray *splited = [[allLines objectAtIndex:1] componentsSeparatedByString:@":"];
        
        if(splited.count<2)
        {
            image=UIGraphicsGetImageFromCurrentImageContext();
            
            UIImageView *imageView  = [[UIImageView alloc] initWithFrame:_roadmapRefView.frame];
            imageView.image = [UIImage imageWithCGImage:image.CGImage];
            imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
            
            UIGraphicsEndImageContext();
            
            [self.view addSubview:imageView];
            roadmapImageView = imageView;
            
            roadmapData = nil;
            
            
            return;
        }
        
        NSArray *numOfData = [[splited objectAtIndex:1] componentsSeparatedByString:@";"];
        
        if((numOfData.count-1)<(13*6))
        {
            start = 0;
        }
        else
        {
            start = (numOfData.count-1)-((13*6)+1);
        }
        
        for(int i = start; i < (numOfData.count-1); i++)
        {
            
            NSString *data = [numOfData objectAtIndex:i];
            NSArray *marks = [data componentsSeparatedByString:@","];
            int relMark = [[marks objectAtIndex:0] intValue];
            
            if (relMark==1)
            {  [player drawInRect: CGRectMake(col*(w+inset)+inset, row*(h+inset)+inset, w, h) blendMode:kCGBlendModeNormal alpha:1.0f];
                // count_play_temp+=1;
            }
            if (relMark==2)
            {    [banker drawInRect: CGRectMake(col*(w+inset)+inset, row*(h+inset)+inset, w, h) blendMode:kCGBlendModeNormal alpha:1.0f];
                //   count_bank_temp+=1;
            }
            if(relMark==0)
            {    [tie drawInRect: CGRectMake(col*(w+inset)+inset, row*(h+inset)+inset, w, h) blendMode:kCGBlendModeNormal alpha:1.0f];
                //   count_bank_temp+=1;
            }
                
            if(row==5)
            {
               row = 0;
                col++;
            }
            else
            {
                row++;
            }
            
            if(col>13)
                break;
                
        }
        
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
