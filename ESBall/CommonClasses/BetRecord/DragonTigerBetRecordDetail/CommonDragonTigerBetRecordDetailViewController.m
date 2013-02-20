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

-(NSString *)gameCodeNameWithGameCode:(NSUInteger)gameCode
{
    /**convert game code to table name**/
    NSString *tableName;
    
    switch (gameCode) {
        case 1:
            tableName = @"A";
            break;
        case 3:
            tableName = @"B";
            break;
        default:
            tableName = @"";
            break;
            
    }
    
    return tableName;
}

-(NSString *)betTypeWithTypeNumber:(NSUInteger)betType
{
    /*convert bet type to string*/
    switch (betType) {
        case 1:
            return NSLocalizedString(@"虎", @"虎");
            break;
            
        case 2:
            return NSLocalizedString(@"龙", @"龙");
            break;
            
        case 3:
            return NSLocalizedString(@"和", @"和");
            break;
            
        case 4:
            return NSLocalizedString(@"虎单", @"虎单");
            break;
            
        case 5:
            return NSLocalizedString(@"虎双", @"虎双");
            break;
            
        case 6:
            return NSLocalizedString(@"龙单", @"龙单");
            break;
            
        case 7:
            return NSLocalizedString(@"龙双", @"龙双");
            break;
            
        case 8:
            return NSLocalizedString(@"虎黑", @"虎黑");
            break;
            
        case 9:
            return NSLocalizedString(@"虎红", @"虎红");
            break;
            
        case 10:
            return NSLocalizedString(@"龙黑", @"龙黑");
            break;
            
        case 11:
            return NSLocalizedString(@"龙红", @"龙红");
            break;
            
        default:
            return @"";
            break;
    }
    
    return @"";
}

@end
