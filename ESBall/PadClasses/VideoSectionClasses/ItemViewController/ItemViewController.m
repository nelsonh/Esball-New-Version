//
//  ItemViewController.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/23.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *gameImageView;
//@property (nonatomic, weak) IBOutlet UIButton *button;
-(IBAction)dropdownItem:(id)sender;

-(void)didTap;

@end

@implementation ItemViewController

@synthesize theDelegate = _theDelegate;
@synthesize gameImageView = _gameImageView;
//@synthesize button = _button;
@synthesize scrollView = _scrollView;
@synthesize imageForDown = _imageForDown;
@synthesize imageForNormal = _imageForNormal;
@synthesize index = _index;
@synthesize tableNumber = _tableNumber;
@synthesize infoTableNumber = _infoTableNumber;
@synthesize gameType = _gameType;
@synthesize tableName = _tableName;
@synthesize storyboardControllerID = _storyboardControllerID;

@synthesize timeLabel = _timeLabel;
//@synthesize roadmapRefView = _roadmapRefView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    isSelected = NO;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _gameImageView.image = imageNormal;
    //[_button setImage:imageNormal forState:UIControlStateNormal];
    //[_button setImage:imageDown forState:UIControlStateHighlighted];
    //[_button setImage:imageDown forState:UIControlStateSelected];
    //[_button addTarget:self action:@selector(didTap) forControlEvents:UIControlEventTouchUpInside];
    
    [self startRoadmapUpdate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - roadmap update
-(void)startRoadmapUpdate
{
    [self stopRoadmapUpdate];
    
    roadmapDataTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(doPullRoadmapData) userInfo:nil repeats:YES];
}

-(void)stopRoadmapUpdate
{
    if(roadmapDataTimer)
    {
        [roadmapDataTimer invalidate];
        roadmapDataTimer = nil;
    }
    
    if(roadmapDataConnection)
    {
        [roadmapDataConnection cancel];
        roadmapDataConnection = nil;
    }
    
    roadmapData = nil;
}

-(void)doPullRoadmapData
{
    if(roadmapData == nil)
    {
        NSString *urlStr = [NSString stringWithFormat:@"http://183.182.66.167/%i/%@/0/0.htm", _gameType, _tableName];
        NSURL *url = [NSURL URLWithString:urlStr];
        
        NSMutableURLRequest *roadmapDataRequest = [NSMutableURLRequest requestWithURL:url];
        [roadmapDataRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        roadmapDataConnection = [NSURLConnection connectionWithRequest:roadmapDataRequest delegate:self];
    }
}

-(void)displayRoadmap
{

    
}


#pragma mark - internal
-(void)didTap
{
    isSelected = YES;
    
    //change image
    _gameImageView.image = imageDown;
    
    //inform delegate this item selected
    if([_theDelegate respondsToSelector:@selector(ItemViewControllerDidSelected:)])
    {
        [_theDelegate ItemViewControllerDidSelected:self];
    }
    
}

#pragma mark - public interface
-(IBAction)dropdownItem:(id)sender
{
    //inform delegate this item dropdown
    if([_theDelegate respondsToSelector:@selector(ItemViewControllerDidDropdown:)])
    {
        [_theDelegate ItemViewControllerDidDropdown:self];
    }
}

-(void)deselectItem
{
    isSelected = NO;
    
    //change image
    _gameImageView.image = imageNormal;
}

-(void)updateTimeWithTime:(NSUInteger)time
{
    _timeLabel.text = [NSString stringWithFormat:@"%i", time];
}

#pragma mark - touch event
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self didTap];
}

#pragma mark - read write images
-(void)setImageForNormal:(UIImage *)imageForNormal
{
    imageNormal = imageForNormal;
    
}

-(void)setImageForDown:(UIImage *)imageForDown
{
    imageDown = imageForDown;
}

-(UIImage *)imageForNormal
{
    return imageNormal;
}

-(UIImage *)imageForDown
{
    return imageDown;
}

#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    /**
     a new connection to roadmap data has established
     **/
    roadmapData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //append data
    [roadmapData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [connection cancel];
    
    [self displayRoadmap];
    
    //clear data
    roadmapData = nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [connection cancel];
    
    //clear data
    roadmapData = nil;
    
}


@end
