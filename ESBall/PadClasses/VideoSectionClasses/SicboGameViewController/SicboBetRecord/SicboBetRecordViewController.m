//
//  SicboBetRecordViewController.m
//  ESBall
//
//  Created by Nelson on 1/24/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SicboBetRecordViewController.h"
#import "SicboBetRecordDetailViewController.h"
#import "FileFinder.h"
#import "SicboBetRecordCell.h"

@implementation SBRecordData

@synthesize totalDicePoint = _totalDicePoint;

@end

@interface SicboBetRecordViewController ()

@end

@implementation SicboBetRecordViewController

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
-(BOOL)presentEmptyModelAtBeginning
{
    return YES;
}

-(NSUInteger)numberOfDataToPull
{
    return 150;
}

-(NSUInteger)sectionToPull
{
    return 1;
}

-(NSString *)cellBackgroundImageName
{
    return @"L_row_bet.png";
}

-(NSString *)cellSelectedBackgroundImageName
{
    return @"L_row_bet2.png";
}

-(CGFloat)tableViewHeaderHeight
{
    return 22.0f;
}

-(NSString *)tableViewHeaderBackgroundImageName
{
    return @"L_row_date.png";
}

-(CGFloat)tableViewTitleXPosition
{
    return 14.0f;
}

-(UIColor *)tableViewTitleColor
{
    return [UIColor darkGrayColor];
}

-(NSString *)cellIdentifier
{
    //must match cell id in IB
    return @"BetRecordCell";
}

-(CGFloat)cellX
{
    return -8.0f;
}

-(CGFloat)cellWitdh
{
    return 300;
}

-(void)showDetailRecordWithCID:(NSString *)cid withGameType:(NSString *)gameType
{
    //this is default subclass need implement
    
    //if there is one remove it
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[SicboBetRecordDetailViewController class]])
        {
            SicboBetRecordDetailViewController *detailController = controller;
            
            [detailController removeFromParentViewController];
            
            break;
        }
    }
    
    //add new one
    SicboBetRecordDetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"SicboBetRecordDetailViewController"];
    
    controller.cid = cid;
    controller.gameType = gameType;
    
    [controller addToConrtoller:self inFrame:self.referenceView.frame];
    
}

-(NSMutableDictionary *)convertDataWithString:(NSString *)dataStr
{
    /*convert data we just downloaded into a data structure as a dictionary*/
    NSMutableArray *splitedComponents = (NSMutableArray *)[dataStr componentsSeparatedByString:@"CID"];
    
    //trim out first & last we don't needed
    [splitedComponents removeObjectAtIndex:0];
    [splitedComponents removeLastObject];
    
    NSLog(@"converted data:%@", splitedComponents);
    
    //init a dictionary
    NSMutableDictionary *dataCategoryDir = [[NSMutableDictionary alloc] init];
    
    for(NSString *row in splitedComponents)
    {
        NSArray *splitedSubComponents = [row componentsSeparatedByString:@","];
        
        //create new record data
        SBRecordData *newRecordData = [[SBRecordData alloc] init];
        
        /**extract data**/
        newRecordData.cid = [[splitedSubComponents objectAtIndex:0] copy];
        newRecordData.roundSerial = [[splitedSubComponents objectAtIndex:1] copy];
        
        NSString *dateTimeComponents = [splitedSubComponents objectAtIndex:2];
        NSString *dateComponent = [[dateTimeComponents componentsSeparatedByString:@" "] objectAtIndex:0];
        NSString *timeComponent = [[dateTimeComponents componentsSeparatedByString:@" "] objectAtIndex:1];
        newRecordData.date = [dateComponent copy];
        newRecordData.time = [timeComponent copy];
        
        int dicePoint1 = ([[splitedSubComponents objectAtIndex:3] isEqualToString:@"N"])? 0 :[[splitedSubComponents objectAtIndex:3] intValue];
        int dicePoint2 = ([[splitedSubComponents objectAtIndex:4] isEqualToString:@"N"])? 0 :[[splitedSubComponents objectAtIndex:4] intValue];
        int dicePoint3 = ([[splitedSubComponents objectAtIndex:5] isEqualToString:@"N"])? 0 : [[splitedSubComponents objectAtIndex:5] intValue];
        
        newRecordData.totalDicePoint = [NSString stringWithFormat:@"%i", (dicePoint1+dicePoint2+dicePoint3)];
        
        if(splitedComponents.count>6)
            newRecordData.totalBet = [[splitedSubComponents objectAtIndex:6] copy];
        else
            newRecordData.totalBet = @"";
        
        if(splitedSubComponents.count>7)
            newRecordData.totalPayoff = [[splitedSubComponents objectAtIndex:7] copy];
        else
            newRecordData.totalPayoff = @"";
        
        //use date as key to categorized new record data
        if([dataCategoryDir objectForKey:dateComponent])
        {
            //category exist
            NSMutableArray *category = [dataCategoryDir objectForKey:dateComponent];
            [category addObject:newRecordData];
        }
        else
        {
            //category not exist
            NSMutableArray *category = [[NSMutableArray alloc] init];
            [category addObject:newRecordData];
            
            [dataCategoryDir setObject:category forKey:dateComponent];
        }
    }
    
    return dataCategoryDir;
}

-(BetRecordCell *)configureCell:(BetRecordCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    //find data
    NSArray *allKeys = [recordDatas allKeys];
    //sort decending
    allKeys = [self sortArrayDecendingWithArray:allKeys];
    NSString *categoryKey = [allKeys objectAtIndex:indexPath.section];
    
    NSMutableArray *records = [recordDatas objectForKey:categoryKey];
    
    SBRecordData *data =[records objectAtIndex:indexPath.row];
    
    SicboBetRecordCell *theCell = (SicboBetRecordCell *)cell;
    
    /*
     //subtitle string at bottom of cell
     NSMutableString *subtitleStr = [[NSMutableString alloc] init];
     
     NSString *bankerStr = NSLocalizedString(@"庄:", @"庄:");
     NSString *playerStr = NSLocalizedString(@"闲:", @"闲:");
     if(_gameType == 3003)
     {
     bankerStr = NSLocalizedString(@"虎:", @"虎:");
     playerStr = NSLocalizedString(@"龙:", @"龙:");
     }
     NSString *totalBetStr = NSLocalizedString(@"总投注", @"总投注");
     NSString *totalPayoffStr = NSLocalizedString(@"总派彩", @"总派彩");
     
     //configure cell with data
     cell.roundSerialLabel.text = data.roundSerial;
     [cell.roundSerialLabel sizeToFit];
     
     [subtitleStr appendFormat:@"%@%@ ", bankerStr, data.banker];
     [subtitleStr appendFormat:@"%@%@ ", playerStr, data.player];
     [subtitleStr appendFormat:@"%@%@ ", totalBetStr, data.totalBet];
     [subtitleStr appendFormat:@"%@%@", totalPayoffStr, data.totalPayoff];
     */
    theCell.roundSerialLabel.text = data.roundSerial;
    //cell.bankerPointLabel.text = [NSString stringWithFormat:@"(%@)", data.banker];
    //cell.playerPointLabel.text = [NSString stringWithFormat:@"(%@)", data.player];
    theCell.dicePoint.text = [NSString stringWithFormat:@"%@", data.totalDicePoint];
    theCell.totalBetLabel.text = [NSString stringWithFormat:@"%@", data.totalBet];
    theCell.totalPayoffLabel.text = [NSString stringWithFormat:@"%@", data.totalPayoff];
    
    //color up
    theCell.totalBetLabel.textColor = [UIColor blueColor];
    double payoff = [data.totalPayoff doubleValue];
    if(payoff<0)
    {
        cell.totalPayoffLabel.textColor = [UIColor redColor];
    }
    else
    {
        cell.totalPayoffLabel.textColor = [UIColor blackColor];
    }
    
    //cell.subDetailLabel.text = subtitleStr;
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    //cell's background image
    UIImage *backgroundImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[self cellBackgroundImageName]]];
    
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    backgroundImageView.image = backgroundImage;
    
    theCell.backgroundView = backgroundImageView;
    
    theCell.defaultBackgroundImageName = [self cellBackgroundImageName];
    
    
    return theCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(!recordDatas)//if record data not ready only loading cell
    {
        UITableViewCell *loadingCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LoadingCell"];
        loadingCell.selectionStyle = UITableViewCellSelectionStyleNone;
        loadingCell.textLabel.text = NSLocalizedString(@"载入中...", @"载入中...");
        loadingCell.textLabel.textAlignment = UITextAlignmentCenter;
        
        return loadingCell;
    }
    else if(isPullingDataFail)// if data download fail only fail cell
    {
        UITableViewCell *dataFailCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DataFailCell"];
        dataFailCell.selectionStyle = UITableViewCellSelectionStyleNone;
        dataFailCell.textLabel.text = NSLocalizedString(@"载入失败", @"载入失败");
        dataFailCell.textLabel.textAlignment = UITextAlignmentCenter;
        
        return dataFailCell;
    }
    
    NSString *cellIdentifier = [self cellIdentifier];
    
    SicboBetRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell)
    {
        cell = [[SicboBetRecordCell alloc] initWithReuseIdentifier:cellIdentifier];
    }
    
    //configure cell and return
    cell = (SicboBetRecordCell *)[self configureCell:cell withIndexPath:indexPath];
    
    //if new cell index is equal to last selected index
    if(lastSelectedIndex && lastSelectedIndex.section == indexPath.section && lastSelectedIndex.row == indexPath.row)
    {
        FileFinder *fileFinder = [FileFinder fileFinder];
        
        UIImage *selectedBackgroundImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[self cellSelectedBackgroundImageName]]];
        
        UIImageView *selectedBackgroundImageView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
        selectedBackgroundImageView.image = selectedBackgroundImage;
        
        cell.backgroundView = selectedBackgroundImageView;
        
        [cell setSelected:YES animated:NO];
        
    }
    else
    {
        [cell setSelected:NO animated:NO];
        
    }
    
    //cell custom rect
    cell.cellX = [self cellX];
    cell.cellWidth = [self cellWitdh];
    
    return cell;
}

@end
