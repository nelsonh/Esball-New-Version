//
//  SBBetRecordView.m
//  ESBall
//
//  Created by Nelson on 3/12/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBBetRecordView.h"
#import "SBBetRecordInfo.h"
#import "FileFinder.h"
#import "HelperMethods.h"

@implementation SBBetRecordView

@synthesize tableView = _tableView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - public interface
-(void)refreshBetRecordWithNewBetRecords:(NSArray *)theBetRecords
{
    if(theBetRecords == nil)
        return;
    
    //clear bet records first
    [self clearBetRecordsWithRefreshDisplay:NO];
    
    //assign new one
    betRecords = theBetRecords;
    
    //reload data
    [_tableView reloadData];
}

-(void)clearBetRecordsWithRefreshDisplay:(BOOL)yesOrNo
{
    betRecords = nil;
    
    if(yesOrNo)
        [_tableView reloadData];
}

-(SBBetRecordCell *)configureCellWithCell:(SBBetRecordCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    SBBetRecordInfo *info = [betRecords objectAtIndex:indexPath.row];
    FileFinder * fileFinder = [FileFinder fileFinder];
    
    cell.diceImageView.hidden = YES;
    cell.diceStringLabel.hidden = YES;
    
    //left side of cell could either be image or string
    if([info isDataAnImage])
    {
        cell.diceImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:info.dataFileName]];
        
        cell.diceImageView.hidden = NO;
    }
    else
    {
        NSString *diceStr = [NSString stringWithString:info.dataFileName];
        cell.diceStringLabel.text = diceStr;
        
        cell.diceStringLabel.hidden = NO;
    }
    
    cell.amountOfBetLabel.text = [HelperMethods doubleToStringWithDoubleValue:info.amountOfBet WithMaxFractionDigits:2];
    
    return cell;
}

#pragma mark - UITableViewDataSource delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(betRecords != nil)
        return betRecords.count;
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"SBBetRecordCell";
    
    SBBetRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell)
    {
        cell = [[SBBetRecordCell alloc] initWithReuseIdentifier:cellIdentifier];
    }
    
    return [self configureCellWithCell:cell withIndexPath:indexPath];
}

#pragma mark - UITableView delegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
