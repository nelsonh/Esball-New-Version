//
//  BetRecordViewController.m
//  ESBall
//
//  Created by Nelson on 1/8/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordViewController.h"
#import "ServerInterface.h"
#import "HeaderView.h"
#import "FileFinder.h"
#import "BetRecordDetailViewController.h"

/*
#define kNumberOfData 150
#define kSectionOfData 1
*/

#pragma mark - Record data
@interface RecordData : NSObject

@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *roundSerial;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *banker;
@property (nonatomic, strong) NSString *player;
@property (nonatomic, strong) NSString *totalBet;
@property (nonatomic, strong) NSString *totalPayoff;

@end

@implementation RecordData

@synthesize cid = _cid;
@synthesize roundSerial = _roundSerial;
@synthesize date = _date;
@synthesize time = _time;
@synthesize banker = _banker;
@synthesize player = _player;
@synthesize totalBet = _totalBet;
@synthesize totalPayoff = _totalPayoff;

@end




@interface BetRecordViewController ()

@end

@implementation BetRecordViewController

@synthesize theDelegate = _theDelegate;
@synthesize gameType = _gameType;
@synthesize tableView = _tableView;
@synthesize referenceView = _referenceView;

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
    
    NSLog(@"BetRecordViewController dealloc");
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    isPullingDataFail = NO;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self pullRecordData];
    
    if([self presentEmptyModelAtBeginning])
    {
        [self showDetailRecordWithCID:@"" withGameType:@""];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public interface overridable
-(BOOL)presentEmptyModelAtBeginning
{
    return NO;
}

-(NSUInteger)numberOfDataToPull
{
    return 0;
}

-(NSUInteger)sectionToPull
{
    return 0;
}

-(NSString *)cellBackgroundImageName
{
    return @"";
}

-(NSString *)cellSelectedBackgroundImageName
{
    return @"";
}

-(CGFloat)tableViewHeaderHeight
{
    return 0.0f;
}

-(NSString *)tableViewHeaderBackgroundImageName
{
    return @"";
}

-(CGFloat)tableViewTitleXPosition
{
    return 0.0f;
}

-(UIColor *)tableViewTitleColor
{
    return [UIColor darkGrayColor];
}

-(NSString *)cellIdentifier
{
    //must match cell id in IB
    return @"";
}

-(void)showDetailRecordWithCID:(NSString *)cid withGameType:(NSString *)gameType
{
    //subclass need implement it's own  transition style and controller
    
    /* example ipad
    //if there is one remove it
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[BetRecordDetailViewController class]])
        {
            BetRecordDetailViewController *detailController = controller;
            
            [detailController removeFromParentViewController];
            
            break;
        }
    }
    
    //add new one
    BetRecordDetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"BetRecordDetailViewController"];
    
    controller.cid = cid;
    controller.gameType = gameType;
    
    [controller addToConrtoller:self inFrame:_referenceView.frame];
     */
}

#pragma mark - public interface
-(void)pullRecordData
{
    isPullingDataFail = NO;
    
    ServerInterface *theInterface = [ServerInterface serverInterface];
    
    NSString *addressToPull = [NSString stringWithFormat:@"https://bm.esb886.com/app/api/LiveDealerAPI.php?type=getBetRecord&sid=%@&GameType=%i&Rows=%i&Page=%i&Type=I&Gamekind=3&Second=open", theInterface.theSID, _gameType, [self numberOfDataToPull], [self sectionToPull]];
    
    NSURL *url = [NSURL URLWithString:addressToPull];
    
    //asynchronize pull data
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    urlConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

-(NSMutableDictionary *)convertDataWithString:(NSString *)dataStr
{
    NSMutableArray *splitedComponents = (NSMutableArray *)[dataStr componentsSeparatedByString:@"CID"];
    
    //trim out first & last we don't needed
    [splitedComponents removeObjectAtIndex:0];
    [splitedComponents removeLastObject];
    
    NSLog(@"converted data:%@", splitedComponents);
    
    NSMutableDictionary *dataCategoryDir = [[NSMutableDictionary alloc] init];
    
    for(NSString *row in splitedComponents)
    {
        NSArray *splitedSubComponents = [row componentsSeparatedByString:@","];
        
        //create new record data
        RecordData *newRecordData = [[RecordData alloc] init];
        
        newRecordData.cid = [[splitedSubComponents objectAtIndex:0] copy];
        newRecordData.roundSerial = [[splitedSubComponents objectAtIndex:1] copy];
        
        NSString *dateTimeComponents = [splitedSubComponents objectAtIndex:2];
        NSString *dateComponent = [[dateTimeComponents componentsSeparatedByString:@" "] objectAtIndex:0];
        NSString *timeComponent = [[dateTimeComponents componentsSeparatedByString:@" "] objectAtIndex:1];
        newRecordData.date = [dateComponent copy];
        newRecordData.time = [timeComponent copy];
        
        newRecordData.banker = [[splitedSubComponents objectAtIndex:3] copy];
        newRecordData.player = [[splitedSubComponents objectAtIndex:4] copy];
        newRecordData.totalBet = [[splitedSubComponents objectAtIndex:5] copy];
        newRecordData.totalPayoff = [[splitedSubComponents objectAtIndex:6] copy];
        
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

-(void)addToConrtoller:(UIViewController *)parentController inPosition:(CGPoint)pos
{
    [parentController addChildViewController:self];
    [parentController.view addSubview:self.view];
    
    CGRect newRect = CGRectMake(pos.x, pos.y, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = newRect;
    
    if([_theDelegate respondsToSelector:@selector(BetRecordViewControllerDidAddToParentController:)])
    {
        [_theDelegate BetRecordViewControllerDidAddToParentController:self];
    }
}

-(BetRecordCell *)configureCell:(BetRecordCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    //find data
    NSArray *allKeys = [recordDatas allKeys];
    allKeys = [allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *categoryKey = [allKeys objectAtIndex:indexPath.section];
    
    NSMutableArray *records = [recordDatas objectForKey:categoryKey];
    
    RecordData *data =[records objectAtIndex:indexPath.row];
    
    NSMutableString *subtitleStr = [[NSMutableString alloc] init];
    
    NSString *bankerStr = NSLocalizedString(@"庄:", @"庄:");
    NSString *playerStr = NSLocalizedString(@"闲:", @"闲:");
    NSString *totalBetStr = NSLocalizedString(@"总投注", @"总投注");
    NSString *totalPayoffStr = NSLocalizedString(@"总派采", @"总派采");
    
    //configure cell with data
    cell.roundSerialLabel.text = data.roundSerial;
    [cell.roundSerialLabel sizeToFit];
    
    [subtitleStr appendFormat:@"%@%@ ", bankerStr, data.banker];
    [subtitleStr appendFormat:@"%@%@ ", playerStr, data.player];
    [subtitleStr appendFormat:@"%@%@ ", totalBetStr, data.totalBet];
    [subtitleStr appendFormat:@"%@%@", totalPayoffStr, data.totalPayoff];
    cell.subDetailLabel.text = subtitleStr;
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    UIImage *backgroundImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[self cellBackgroundImageName]]];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    backgroundImageView.image = backgroundImage;
    
    cell.backgroundView = backgroundImageView;
    
    return cell;
}

#pragma mark - override method
-(void)removeFromParentViewController
{
    [self.view removeFromSuperview];
    [self willMoveToParentViewController:nil];
    [super removeFromParentViewController];
    
    if([_theDelegate respondsToSelector:@selector(BetRecordViewControllerDidRemoveFromParentController:)])
    {
        [_theDelegate BetRecordViewControllerDidRemoveFromParentController:self];
    }
}

#pragma mark - UITableViewDataSource delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(recordDatas)
    {
        NSArray *categories = [recordDatas allKeys];
        
        return categories.count;
    }
    else if(isPullingDataFail)
    {
        return 1;//data fail cell
    }
    
    return 1;//loading cell //if record data not ready
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(recordDatas)
    {
        //string of categroy
        NSArray *allKeys = [recordDatas allKeys];
        allKeys = [allKeys sortedArrayUsingSelector:@selector(compare:)];
        NSString *categoryKey = [allKeys objectAtIndex:section];
        
        //content by category
        NSMutableArray *categoryContent = [recordDatas objectForKey:categoryKey];
        
        return categoryContent.count;
    }
    else if(isPullingDataFail)
    {
        return 1;//data fail cell
    }
    
    return 1;//loading cell //if record data not ready
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(!recordDatas)//if record data not ready
    {
        UITableViewCell *loadingCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LoadingCell"];
        loadingCell.selectionStyle = UITableViewCellSelectionStyleNone;
        loadingCell.textLabel.text = NSLocalizedString(@"载入中...", @"载入中...");
        loadingCell.textLabel.textAlignment = UITextAlignmentCenter;
        
        return loadingCell;
    }
    else if(isPullingDataFail)
    {
        UITableViewCell *dataFailCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DataFailCell"];
        dataFailCell.selectionStyle = UITableViewCellSelectionStyleNone;
        dataFailCell.textLabel.text = NSLocalizedString(@"载入失败", @"载入失败");
        dataFailCell.textLabel.textAlignment = UITextAlignmentCenter;
        
        return dataFailCell;
    }
    
    NSString *cellIdentifier = [self cellIdentifier];
    
    BetRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell)
    {
        cell = [[BetRecordCell alloc] initWithReuseIdentifier:cellIdentifier];
    }
    
    //configure cell and return
    return [self configureCell:cell withIndexPath:indexPath];
}

#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self tableViewHeaderHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(!recordDatas || isPullingDataFail)
        return nil;
    
    NSArray *allKeys = [recordDatas allKeys];
    allKeys = [allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *categoryKey = [allKeys objectAtIndex:section];
    
    //create header
    HeaderView *header = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, [self tableViewHeaderHeight]) withTitleName:categoryKey withTitleXPosition:[self tableViewTitleXPosition] withTitleColor:[self tableViewTitleColor] withBackgroundImageName:[self tableViewHeaderBackgroundImageName]];
    
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(!recordDatas)//if record data not ready
        return;
    
    if(isPullingDataFail)
    {
        [self pullRecordData];
    }
    
    FileFinder *fileFinder = [FileFinder fileFinder];

    BetRecordCell *cell = (BetRecordCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    UIImage *selectedBackgroundImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:[self cellSelectedBackgroundImageName]]];
    
    UIImageView *selectedBackgroundImageView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    selectedBackgroundImageView.image = selectedBackgroundImage;
    
    
    cell.selectedBackgroundView = selectedBackgroundImageView;
    
    //show detail record controller
    NSArray *allKeys = [recordDatas allKeys];
    allKeys = [allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *key = [allKeys objectAtIndex:indexPath.section];
    
    NSMutableArray *array = [recordDatas objectForKey:key];
    RecordData *data = [array objectAtIndex:indexPath.row];
    
    [self showDetailRecordWithCID:[data.cid copy] withGameType:[NSString stringWithFormat:@"%i", _gameType]];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(!recordDatas)//if record data not ready
        return nil;
    else
        return indexPath;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BetRecordCell *cell = (BetRecordCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selectedBackgroundView =nil;
}

#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    pendingData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [pendingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [connection cancel];
    urlConnection = nil;
    
    NSString *dataStr = [[NSString alloc] initWithData:pendingData encoding:NSUTF8StringEncoding];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        recordDatas = [self convertDataWithString:dataStr];
        
        [_tableView reloadData];
        
        pendingData = nil;
        
    });
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    urlConnection = nil;
    pendingData = nil;
    recordDatas = nil;
    
    isPullingDataFail = YES;
}

@end
