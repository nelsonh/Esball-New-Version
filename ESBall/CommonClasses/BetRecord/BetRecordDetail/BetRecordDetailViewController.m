//
//  BetRecordDetailViewController.m
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordDetailViewController.h"
#import "ServerInterface.h"


@interface BetRecordDetailViewController ()

@end

@implementation BetRecordDetailViewController

@synthesize cid = _cid;
@synthesize gameType = _gameType;
@synthesize roundNumberLabel = _roundNumberLabel;
@synthesize tableNumberLabel = _tableNumberLabel;
@synthesize dateTimeLabel = _dateTimeLabel;
@synthesize commentLabel = _commentLabel;
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    
    if(urlConnection)
        [urlConnection cancel];
    
    NSLog(@"BetRecordDetailView dellocate");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //start to download data
    [self pullDetailRecordData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public interface overridable
-(NSString *)cellIdentifier
{
    //must match id in IB
    return @"";
}

-(NSString *)cellIdentifierForTotalBet
{
    //must match id in IB
    return @"";
}

-(void)showPokerRecord
{
    //where you are going to present poker history record
    //subclass need to implement thier own 
}

#pragma mark - sort record data array function
NSInteger SortRecordData(id num1, id num2, void *context)
{
    NSDictionary *dic1 = num1;
    NSDictionary *dic2 = num2;
    
    int serialType1 = [[dic1 objectForKey:@"SerialType"] intValue];
    int serialType2 = [[dic2 objectForKey:@"SerialType"] intValue];
    
    if(serialType1 < serialType2)
        return NSOrderedAscending;
    else if (serialType1 > serialType2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

#pragma mark - public interface
-(void)pullDetailRecordData
{
    //reset mark for download data fail
    isPullingDataFail = NO;
    
    ServerInterface *theInterface = [ServerInterface serverInterface];
    
    /*start to download info of record we needed async*/
    
    NSString *addressToPull = [NSString stringWithFormat:@"https://bm.esb886.com/app/api/LiveDealerAPI.php?type=getBetDetail&sid=%@&WagersID=%@&GameType=%@", theInterface.theSID, _cid, _gameType];
    
    NSURL *url = [NSURL URLWithString:addressToPull];
    
    //asynchronize pull data
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    urlConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

-(BOOL)isAllDigitals:(NSString *)str
{
    /**see if passing string contain only digital**/
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [str rangeOfCharacterFromSet: nonNumbers];
    return r.location == NSNotFound;
}

-(NSString *)gameCodeNameWithGameCode:(NSUInteger)gameCode
{
    /**convert game code to table name**/
    /*
    NSString *tableName;
    
    switch (gameCode) {
        case 1:
            tableName = @"A";
            break;
        case 2:
            tableName = @"B";
            break;
        case 3:
            tableName = @"C";
            break;
        case 6:
            tableName = @"D";
            break;
        case 7:
            tableName = @"E";
            break;
            
        default:
            tableName = @"";
            break;
            
    }
    
    return tableName;
     */
    return @"";
}

-(NSMutableDictionary *)convertDataWithJasonData:(NSData *)jsonData
{
    /**convert downloaded Json data into data structure as a dictionary**/
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableDictionary *detailRecordData = [[NSMutableDictionary alloc] init];
    
    NSArray *allKeys = [dic allKeys];
    
    for(NSString *key in allKeys)
    {
        if([self isAllDigitals:key])//if key is only digital it is row of record data
        {
            if(![detailRecordData objectForKey:@"Records"])
            {
                NSDictionary *aRowRecord = [dic objectForKey:key];
                NSMutableArray *array = [[NSMutableArray alloc] init];
                [array addObject:aRowRecord];
                
                [detailRecordData setObject:array forKey:@"Records"];
            }
            else
            {
                NSDictionary *aRowRecord = [dic objectForKey:key];
                NSMutableArray *array = [detailRecordData objectForKey:@"Records"];
                [array addObject:aRowRecord];
            }
        }
        else
        {
            NSString *dataStr = [dic objectForKey:key];
            [detailRecordData setObject:dataStr forKey:key];
        }
    }
    
    //sort ascending
    NSMutableArray *noneSortedRecord = [detailRecordData objectForKey:@"Records"];
    [noneSortedRecord sortUsingFunction:SortRecordData context:NULL];
    
    NSLog(@"%@", detailRecordData);
    
    //return detailRecordData;
    return detailRecordData;
}

-(void)processData:(NSMutableDictionary *)dic
{
    //process common data not each row record data
    _roundNumberLabel.text = [detailRecord objectForKey:@"RoundSerial"];
    _dateTimeLabel.text = [detailRecord objectForKey:@"WagersDate"];
    _commentLabel.text = nil;
    
    NSString *tableName = [self gameCodeNameWithGameCode:[[detailRecord objectForKey:@"GameCode"] intValue]];
    _tableNumberLabel.text = tableName;
    
}

-(NSString *)betTypeWithTypeNumber:(NSUInteger)betType
{
    /*convert bet type to string*/
    switch (betType) {
        case 1:
            return NSLocalizedString(@"庄", @"庄");
            break;
            
        case 2:
            return NSLocalizedString(@"闲", @"闲");
            break;
            
        case 3:
            return NSLocalizedString(@"和", @"和");
            break;
            
        case 4:
            return NSLocalizedString(@"庄对", @"庄对");
            break;
            
        case 5:
            return NSLocalizedString(@"闲对", @"闲对");
            break;
            
        case 6:
            return NSLocalizedString(@"大", @"大");
            break;
            
        case 7:
            return NSLocalizedString(@"小", @"小");
            break;
            
        case 8:
            return NSLocalizedString(@"庄单", @"庄单");
            break;
            
        case 9:
            return NSLocalizedString(@"庄双", @"庄双");
            break;
            
        case 10:
            return NSLocalizedString(@"闲单", @"闲单");
            break;
            
        case 11:
            return NSLocalizedString(@"闲双", @"闲双");
            break;
            
        default:
            return @"";
            break;
    }
    
    return @"";
}

-(BetRecordDetailRowCell *)configureCell:(BetRecordDetailRowCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    if(detailRecord)
    {
        NSMutableArray *rowRecords = [detailRecord objectForKey:@"Records"];
        
        NSDictionary *dataDic = [rowRecords objectAtIndex:indexPath.row];
        
        cell.proportionLabel.text = [dataDic objectForKey:@"Odds"];
        cell.totalBetLabel.text = [dataDic objectForKey:@"Bet"];
        cell.totalPayoffLabel.text = [dataDic objectForKey:@"Payoff"];
        
        int betType = [[dataDic objectForKey:@"SerialType"] intValue];
        
        cell.characterTypeLabel.text = [self betTypeWithTypeNumber:betType];
        
        //color up
        if([cell.totalPayoffLabel.text floatValue] < 0)
        {
            cell.totalPayoffLabel.textColor = [UIColor redColor];
        }
    }
    
    return cell;
}

-(BetRecordDetailTotalRowCell *)configureCellForBetTotal:(BetRecordDetailTotalRowCell *)cell
{
    if(detailRecord)
    {
        cell.totalbetLabel.text = [detailRecord objectForKey:@"TotalBet"];
        cell.totalPayoffLabel.text = [detailRecord objectForKey:@"TotalPayoff"];
        
        //color up
        if([cell.totalPayoffLabel.text floatValue] < 0)
        {
            cell.totalPayoffLabel.textColor = [UIColor redColor];
        }
    }
    
    return cell;
}

-(void)addToConrtoller:(UIViewController *)parentController inFrame:(CGRect)frame
{
    [parentController addChildViewController:self];
    [parentController.view addSubview:self.view];
    
    self.view.frame = frame;
    
    NSLog(@"frame :%@", NSStringFromCGRect(self.view.frame));
}

#pragma mark - override method
-(void)removeFromParentViewController
{
    [self.view removeFromSuperview];
    [self willMoveToParentViewController:nil];
    [super removeFromParentViewController];
    
}

#pragma mark - UITableViewDataSource delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(detailRecord)
    {
        return 1;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(detailRecord)
    {
        NSMutableArray *rowRecords = [detailRecord objectForKey:@"Records"];
        
        return rowRecords.count+1;//plus 1 because there is a row at bottom for sum
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *rowRecords = [detailRecord objectForKey:@"Records"];
    
    NSLog(@"%i", indexPath.row);
    
    //if it is last row
    if((indexPath.row+1) > rowRecords.count)
    {
        NSString *cellIdentifier = [self cellIdentifierForTotalBet];
        
        BetRecordDetailTotalRowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell)
        {
            cell = [[BetRecordDetailTotalRowCell alloc] initWithReuseIdentifier:cellIdentifier];
        }
        
        return [self configureCellForBetTotal:cell];
    }
    else
    {
        NSString *cellIdentifier = [self cellIdentifier];
        
        BetRecordDetailRowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell)
        {
            cell = [[BetRecordDetailRowCell alloc] initWithReuseIdentifier:cellIdentifier];
        }
        
        return [self configureCell:cell withIndexPath:indexPath];
    }
}

#pragma mark - UITableView delegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;//we are not allow any cell to be select
}

#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //init appendable data
    pendingData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //append data
    [pendingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [connection cancel];
    urlConnection = nil;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //convert downloaded Json data
        detailRecord = [self convertDataWithJasonData:pendingData];
        
        //process data 
        [self processData:detailRecord];
        //show poker info 
        [self showPokerRecord];
        
        pendingData = nil;
        
        //tell table to reload data
        [_tableView reloadData];
        
    });
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    urlConnection = nil;
    pendingData = nil;
    detailRecord = nil;
    
    isPullingDataFail = YES;
}

@end
