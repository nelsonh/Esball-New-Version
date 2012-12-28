//
//  DetailViewController.m
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "DetailViewController.h"
#import "FileFinder.h"

@interface DetailViewController ()



-(IBAction)videoSetting:(id)sender;
-(IBAction)gameBetLimit:(id)sender;
-(IBAction)gameRule:(id)sender;
-(IBAction)history:(id)sender;
-(void)doSelectVideoSetting;
-(void)doSelectGameBetLimit;
-(void)doSelectGameRule;
-(void)doSelectHistory;
-(void)removePreviousSubDetailViewController;


@end

@implementation DetailViewController

@synthesize videoSettingBtn = _videoSettingBtn;
@synthesize gameBetLimitBtn = _gameBetLimitBtn;
@synthesize gameRuleBtn = _gameRuleBtn;
@synthesize historyBtn = _historyBtn;
@synthesize referenceView = _referenceView;
@synthesize backgroundImageView = _backgroundImageView;
@synthesize videoSettingControllerID = _videoSettingControllerID;
@synthesize gameBetLimitControllerID = _gameBetLimitControllerID;
@synthesize gameRuleControllerID = _gameRuleControllerID;
@synthesize historyControllerID = _historyControllerID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
}

-(void)dealloc
{
    NSLog(@"detail view dealloc");
}

-(void)loadView
{
    [super loadView];
    
    selectedMethod = VideoSetting;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    _backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"data_bg.png"]];
    
    if(selectedBtn)
        selectedBtn = nil;
    
    [self removePreviousSubDetailViewController];
    
    switch (selectedMethod)
    {
        case VideoSetting:
        {
            selectedBtn = _videoSettingBtn;
            _videoSettingBtn.highlighted = YES;
            [self createVideoSetting];
            break;
        }
        case GameBetLimit:
        {
            selectedBtn = _gameBetLimitBtn;
            _gameBetLimitBtn.highlighted = YES;
            [self createGameBetLimit];
            break;
        }
        case GameRule:
        {
            selectedBtn = _gameRuleBtn;
            _gameRuleBtn.highlighted = YES;
            [self createGameRules];
            break;
        }
        case History:
        {
            selectedBtn = _historyBtn;
            _historyBtn.highlighted = YES;
            [self createHistory];
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - internal
-(IBAction)videoSetting:(id)sender
{
    [self removePreviousSubDetailViewController];
    selectedMethod = VideoSetting;
    [self createVideoSetting];
    [self performSelector:@selector(doSelectVideoSetting) withObject:nil afterDelay:0.0];
}

-(IBAction)gameBetLimit:(id)sender
{
    [self removePreviousSubDetailViewController];
    selectedMethod = GameBetLimit;
    [self createGameBetLimit];
    [self performSelector:@selector(doSelectGameBetLimit) withObject:nil afterDelay:0.0];
}

-(IBAction)gameRule:(id)sender
{
    [self removePreviousSubDetailViewController];
    selectedMethod = GameRule;
    [self createGameRules];
    [self performSelector:@selector(doSelectGameRule) withObject:nil afterDelay:0.0];
}

-(IBAction)history:(id)sender
{
    [self removePreviousSubDetailViewController];
    selectedMethod = History;
    [self createHistory];
    [self performSelector:@selector(doSelectHistory) withObject:nil afterDelay:0.0];
}

-(void)doSelectVideoSetting
{
    selectedBtn.highlighted = NO;
    _videoSettingBtn.highlighted = YES;
    selectedBtn = _videoSettingBtn;
}

-(void)doSelectGameBetLimit
{
    selectedBtn.highlighted = NO;
    _gameBetLimitBtn.highlighted = YES;
    selectedBtn = _gameBetLimitBtn;
}

-(void)doSelectGameRule
{
    selectedBtn.highlighted = NO;
    _gameRuleBtn.highlighted = YES;
    selectedBtn = _gameRuleBtn;
}

-(void)doSelectHistory
{
    selectedBtn.highlighted = NO;
    _historyBtn.highlighted = YES;
    selectedBtn = _historyBtn;
}

-(void)createVideoSetting
{
    if(_videoSettingControllerID == nil)
        return;
    
    VideoSettingViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:_videoSettingControllerID];
    controller.theDelegate = self;
    [controller addToController:self inRect:_referenceView.frame];
}

-(void)createGameBetLimit
{
    if(_gameBetLimitControllerID == nil)
        return;
    
    GameBetLimitViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:_gameBetLimitControllerID];
    controller.theDelegate = self;
    controller.gameBetDelegate = self;
    [controller addToController:self inRect:_referenceView.frame];
}

-(void)createGameRules
{
    if(_gameRuleControllerID == nil)
        return;
    
    GameRulesViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:_gameRuleControllerID];
    controller.theDelegate = self;
    controller.gameRuleDelegate = self;
    [controller addToController:self inRect:_referenceView.frame];
}

-(void)createHistory
{
    if(_historyControllerID == nil)
        return;
    
    HistoryViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:_historyControllerID];
    controller.theDelegate = self;
    controller.historyDelegate = self;
    [controller addToController:self inRect:_referenceView.frame];
}

-(void)removePreviousSubDetailViewController
{
    SubDetailViewController *subController;
    
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[SubDetailViewController class]])
        {
            subController = controller;
            [subController removeFromParentViewController];
            break;
        }
    }
}

#pragma mark - override
-(void)addToConrtoller:(UIViewController *)parentController inPosition:(CGPoint)pos
{
    CGRect newRect = CGRectMake(pos.x, pos.y, parentController.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = newRect;
    
    [super addToConrtoller:parentController inPosition:pos];
}

#pragma mark - HistoryViewController delegate
-(NSString *)HistoryViewControllerHistoryMessage:(HistoryViewController *)controller
{
    if([self.theDelegate respondsToSelector:@selector(GameDetailViewControllerHistoryMessage:)])
    {
        return [self.theDelegate GameDetailViewControllerHistoryMessage:self];
    }
    
    return nil;
}

#pragma mark - GameRuleViewController delegate
-(NSURL *)GameRulesViewControllerRuleWebAddress:(GameRulesViewController *)controller
{
    if([self.theDelegate respondsToSelector:@selector(GameDetailViewControllerGameRuleWebAddress:)])
    {
        return [NSURL URLWithString:[self.theDelegate GameDetailViewControllerGameRuleWebAddress:self]];
    }
    
    return nil;
}

#pragma mark - GameBetLimitViewController delegate
-(double)GameBetLimitViewControllerLimitForSmallBet:(GameBetLimitViewController *)controller
{
    if([self.theDelegate respondsToSelector:@selector(GameDetailViewControllerSmallBetLimit:)])
    {
        return [self.theDelegate GameDetailViewControllerSmallBetLimit:self];
    }
    
    return 0.0;
}

-(double)GameBetLimitViewControllerLimitForSingleBet:(GameBetLimitViewController *)controller
{
    if([self.theDelegate respondsToSelector:@selector(GameDetailViewControllerSingleBetLimit:)])
    {
        return [self.theDelegate GameDetailViewControllerSingleBetLimit:self];
    }
    
    return 0.0;
}

-(double)GameBetLimitViewControllerLimitForOUBet:(GameBetLimitViewController *)controller
{
    if([self.theDelegate respondsToSelector:@selector(GameDetailViewControllerOUBetLimit:)])
    {
        return [self.theDelegate GameDetailViewControllerOUBetLimit:self];
    }
    
    return 0.0;
}

-(double)GameBetLimitViewControllerLimitForPairBet:(GameBetLimitViewController *)controller
{
    if([self.theDelegate respondsToSelector:@selector(GameDetailViewControllerPairBetLimit:)])
    {
        return [self.theDelegate GameDetailViewControllerPairBetLimit:self];
    }
    
    return 0.0;
}

-(double)GameBetLimitViewControllerLimitForTieBet:(GameBetLimitViewController *)controller
{
    if([self.theDelegate respondsToSelector:@selector(GameDetailViewControllerTieBetLimit:)])
    {
        return [self.theDelegate GameDetailViewControllerTieBetLimit:self];
    }
    
    return 0.0;
}

@end
