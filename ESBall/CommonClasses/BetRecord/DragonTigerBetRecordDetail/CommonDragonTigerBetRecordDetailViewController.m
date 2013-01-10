//
//  DragonTigerBetRecordDetailViewController.m
//  ESBall
//
//  Created by Nelson on 1/10/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "CommonDragonTigerBetRecordDetailViewController.h"

@interface CommonDragonTigerBetRecordDetailViewController ()

@end

@implementation CommonDragonTigerBetRecordDetailViewController

@synthesize bankerPointLabel = _bankerPointLabel;
@synthesize playerPointLabel = _playerPointLabel;
@synthesize bankerCard = _bankerCard;
@synthesize playerCard = _playerCard;

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

#pragma mark -public interface
-(void)showCards
{
    //format example Cards = "C.7,D.8,CID,C.1,C.9,D.12";
    if([detailRecord objectForKey:@"Cards"] == nil)
        return;
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    NSArray *splited = [[detailRecord objectForKey:@"Cards"] componentsSeparatedByString:@"CID"];
    NSMutableArray *bankerSplited = (NSMutableArray *)[[splited objectAtIndex:0] componentsSeparatedByString:@","];
    NSMutableArray *playerSplited = (NSMutableArray *)[[splited objectAtIndex:1] componentsSeparatedByString:@","];
    
    //we don't need last element from banker its empty
    [bankerSplited removeLastObject];
    //we don't need first element from player its empty
    [playerSplited removeObjectAtIndex:0];
    
    //banker card
    if((0+1) <= bankerSplited.count)
    {
        if([bankerSplited objectAtIndex:0] != nil)
        {
            NSString *cardName = [NSString stringWithFormat:@"%@.png", [bankerSplited objectAtIndex:0]];
            UIImage *cardImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:cardName]];
            
            _bankerCard.image = cardImage;
        }
    }
    

    
    // player card
    if((0+1) <= playerSplited.count)
    {
        if([playerSplited objectAtIndex:0] != nil)
        {
            NSString *cardName = [NSString stringWithFormat:@"%@.png", [playerSplited objectAtIndex:0]];
            UIImage *cardImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:cardName]];
            
            _playerCard.image = cardImage;
        }
    }
}

-(void)showBankerPlayerPoints
{
    
    //example Point = "5,CID,0";
    
    if([detailRecord objectForKey:@"Point"] == nil)
        return;
    
    NSArray *splited = [[detailRecord objectForKey:@"Point"] componentsSeparatedByString:@"CID"];
    
    NSMutableArray *bankerSplited = (NSMutableArray *)[[splited objectAtIndex:0] componentsSeparatedByString:@","];
    NSMutableArray *playerSplited = (NSMutableArray *)[[splited objectAtIndex:1] componentsSeparatedByString:@","];
    
    //we don't need last element from banker its empty
    //after that there is only one object
    [bankerSplited removeLastObject];
    //we don't need first element from player its empty
    //after that there is only one object
    [playerSplited removeObjectAtIndex:0];
    
    NSString *bankerPointStr = [bankerSplited objectAtIndex:0];
    NSString *playerPointStr = [playerSplited objectAtIndex:0];
    
    if(bankerPointStr || playerPointStr)
    {
        _bankerPointLabel.text = [NSString stringWithFormat:@"(%@)", bankerPointStr];
        _playerPointLabel.text = [NSString stringWithFormat:@"(%@)", playerPointStr];
    }
    
}


#pragma mark - override
-(void)showPokerRecord
{
    
    //where you are going to present poker history record
    if(detailRecord)
    {
        [self showBankerPlayerPoints];
        [self showCards];
    }
    
}

@end
