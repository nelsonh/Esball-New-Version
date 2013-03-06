//
//  CommonSicboBetRecordDetailViewController.m
//  ESBall
//
//  Created by Nelson on 3/6/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "CommonSicboBetRecordDetailViewController.h"
#import "FileFinder.h"

@interface CommonSicboBetRecordDetailViewController ()

@end

@implementation CommonSicboBetRecordDetailViewController

@synthesize dicePoint = _dicePoint;
@synthesize diceLeft = _diceLeft;
@synthesize diceMiddle = _diceMiddle;
@synthesize diceRight = _diceRight;

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
-(void)showDices
{
    NSLog(@"%@", [detailRecord objectForKey:@"Point"]);
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    if([[detailRecord objectForKey:@"Point"] isEqualToString:@""])
        return;
    
    NSArray *dicePoints = [[detailRecord objectForKey:@"Point"] componentsSeparatedByString:@","];
    
    UIImage *leftDiceImage = nil;
    UIImage *middleDiceImage = nil;
    UIImage *rightDiceImage = nil;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        leftDiceImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_0%i.png", [[dicePoints objectAtIndex:0] intValue]]]];
        
        middleDiceImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_0%i.png", [[dicePoints objectAtIndex:1] intValue]]]];
        
        rightDiceImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_0%i.png", [[dicePoints objectAtIndex:2] intValue]]]];
    }
    else
    {
        leftDiceImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_s_0%i.png", [[dicePoints objectAtIndex:0] intValue]]]];
        
        middleDiceImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_s_0%i.png", [[dicePoints objectAtIndex:1] intValue]]]];
        
        rightDiceImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[NSString stringWithFormat:@"dice_s_0%i.png", [[dicePoints objectAtIndex:2] intValue]]]];
    }
    
    _diceLeft.image = leftDiceImage;
    _diceMiddle.image = middleDiceImage;
    _diceRight.image = rightDiceImage;

    int dicePoint1 = [[dicePoints objectAtIndex:0] intValue];
    int dicePoint2 = [[dicePoints objectAtIndex:1] intValue];
    int dicePoint3 = [[dicePoints objectAtIndex:2] intValue];
    int totalDicePoint = dicePoint1+dicePoint2+dicePoint3;

    _dicePoint.text = [NSString stringWithFormat:@"%i", totalDicePoint];
}

#pragma mark - override
-(void)showPokerRecord
{
    
    //where you are going to present poker history record
    if(detailRecord)
    {
        [self showDices];
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
            return NSLocalizedString(@"小", @"小");
            break;
            
        case 2:
            return NSLocalizedString(@"大", @"大");
            break;
            
        case 4:
            return NSLocalizedString(@"点数4", @"点数4");
            break;
            
        case 5:
            return NSLocalizedString(@"点数5", @"点数45");
            break;
            
        case 6:
            return NSLocalizedString(@"点数6", @"点数6");
            break;
            
        case 7:
            return NSLocalizedString(@"点数7", @"点数7");
            break;
            
        case 8:
            return NSLocalizedString(@"点数8", @"点数8");
            break;
            
        case 9:
            return NSLocalizedString(@"点数9", @"点数9");
            break;
            
        case 10:
            return NSLocalizedString(@"点数10", @"点数10");
            break;
            
        case 11:
            return NSLocalizedString(@"点数11", @"点数11");
            break;
            
        case 12:
            return NSLocalizedString(@"点数12", @"点数12");
            break;
            
        case 13:
            return NSLocalizedString(@"点数13", @"点数13");
            break;
            
        case 14:
            return NSLocalizedString(@"点数14", @"点数14");
            break;
            
        case 15:
            return NSLocalizedString(@"点数15", @"点数15");
            break;
            
        case 16:
            return NSLocalizedString(@"点数16", @"点数16");
            break;
            
        case 17:
            return NSLocalizedString(@"点数17", @"点数17");
            break;
            
        case 18:
            return NSLocalizedString(@"骰子1,2", @"骰子1,2");
            break;
            
        case 19:
            return NSLocalizedString(@"骰子1,3", @"骰子1,3");
            break;
            
        case 20:
            return NSLocalizedString(@"骰子1,4", @"骰子1,4");
            break;
            
        case 21:
            return NSLocalizedString(@"骰子1,5", @"骰子1,5");
            break;
            
        case 22:
            return NSLocalizedString(@"骰子1,6", @"骰子1,6");
            break;
            
        case 23:
            return NSLocalizedString(@"骰子2,3", @"骰子2,3");
            break;
            
        case 24:
            return NSLocalizedString(@"骰子2,4", @"骰子2,4");
            break;
            
        case 25:
            return NSLocalizedString(@"骰子2,5", @"骰子2,5");
            break;
            
        case 26:
            return NSLocalizedString(@"骰子2,6", @"骰子2,6");
            break;
            
        case 27:
            return NSLocalizedString(@"骰子3,4", @"骰子3,4");
            break;
            
        case 28:
            return NSLocalizedString(@"骰子3,5", @"骰子3,5");
            break;
            
        case 29:
            return NSLocalizedString(@"骰子3,6", @"骰子3,6");
            break;
            
        case 30:
            return NSLocalizedString(@"骰子4,5", @"骰子4,5");
            break;
            
        case 31:
            return NSLocalizedString(@"骰子4,6", @"骰子4,6");
            break;
            
        case 32:
            return NSLocalizedString(@"骰子5,6", @"骰子5,6");
            break;
            
        case 33:
            return NSLocalizedString(@"骰子1,1", @"骰子1,1");
            break;
            
        case 34:
            return NSLocalizedString(@"骰子2,2", @"骰子2,2");
            break;
            
        case 35:
            return NSLocalizedString(@"骰子3,3", @"骰子3,3");
            break;
            
        case 36:
            return NSLocalizedString(@"骰子4,4", @"骰子4,4");
            break;
            
        case 37:
            return NSLocalizedString(@"骰子5,5", @"骰子5,5");
            break;
            
        case 38:
            return NSLocalizedString(@"骰子6,6", @"骰子6,6");
            break;
            
        case 39:
            return NSLocalizedString(@"骰子1,1,1", @"骰子1,1,1");
            break;
            
        case 40:
            return NSLocalizedString(@"骰子2,2,2", @"骰子2,2,2");
            break;
            
        case 41:
            return NSLocalizedString(@"骰子3,3,3", @"骰子3,3,3");
            break;
            
        case 42:
            return NSLocalizedString(@"骰子4,4,4", @"骰子4,4,4");
            break;
            
        case 43:
            return NSLocalizedString(@"骰子5,5,5", @"骰子5,5,5");
            break;
            
        case 44:
            return NSLocalizedString(@"骰子6,6,6", @"骰子6,6,6");
            break;
            
        case 45:
            return NSLocalizedString(@"豹子", @"豹子");
            break;
            
        case 46:
            return NSLocalizedString(@"骰子1", @"骰子1");
            break;
            
        case 47:
            return NSLocalizedString(@"骰子2", @"骰子2");
            break;
            
        case 48:
            return NSLocalizedString(@"骰子3", @"骰子3");
            break;
            
        case 49:
            return NSLocalizedString(@"骰子4", @"骰子4");
            break;
            
        case 50:
            return NSLocalizedString(@"骰子5", @"骰子5");
            break;
            
        case 51:
            return NSLocalizedString(@"骰子6", @"骰子6");
            break;
            
        case 52:
            return NSLocalizedString(@"单", @"单");
            break;
            
        case 53:
            return NSLocalizedString(@"双", @"双");
            break;
            
        default:
            return @"";
            break;
    }
    
    return @"";
}

@end
