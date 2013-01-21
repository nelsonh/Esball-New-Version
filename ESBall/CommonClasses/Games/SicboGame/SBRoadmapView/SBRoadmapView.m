//
//  SBRoadmapView.m
//  ESBall
//
//  Created by Nelson on 1/18/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBRoadmapView.h"

@implementation SBRoadmapView

@synthesize tableView = _tableView;
@synthesize roadmapInfo = _roadmapInfo;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - sort roadmap data array function
NSInteger SortRoadmapData(id num1, id num2, void *context)
{
    NSArray *data1 = num1;
    NSArray *data2 = num2;
    
    int sum1 = [[data1 objectAtIndex:1] intValue] + [[data1 objectAtIndex:2] intValue] + [[data1 objectAtIndex:3] intValue];
    int sum2 = [[data2 objectAtIndex:1] intValue] + [[data2 objectAtIndex:2] intValue] + [[data2 objectAtIndex:3] intValue];
    
    
    if(sum1 < sum2)
        return NSOrderedAscending;
    else if (sum1 > sum2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
    
    
}

#pragma mark - public interface
-(void)convertRoadmapInfo
{
    //example 29021116-2-5-6
    //after example 29021116,2,5,6
    
    if(_roadmapInfo)
    {
        roadmapDatas = [[NSMutableArray alloc] init];
        
        for(NSString *data in _roadmapInfo)
        {
            NSArray *splitedData = [data componentsSeparatedByString:@"-"];
            
            [roadmapDatas addObject:splitedData];
        }
    }
    
    //sort data ascending order
    [roadmapDatas sortUsingFunction:SortRoadmapData context:NULL];
}

-(void)updateView
{
    [self convertRoadmapInfo];
    
    [_tableView reloadData];
}

-(SBRoadmapCell *)configureCell:(SBRoadmapCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    //example 29021116,2,5,6
    
    //get data
    NSArray *data = [roadmapDatas objectAtIndex:indexPath.row];
    
    //start to configure cell
    int firstDice = [[data objectAtIndex:1] intValue];
    int secondDice = [[data objectAtIndex:2] intValue];
    int thirdDice = [[data objectAtIndex:3] intValue];
    int sum = firstDice + secondDice + thirdDice;
    
    NSString *dicesStr = [NSString stringWithFormat:@"%i %i %i", firstDice, secondDice, thirdDice];
    cell.diceLabel.text = dicesStr;
    cell.sumLabel.text = [NSString stringWithFormat:@"%i", sum];
    
    if(sum >= 11 && sum <= 17)
    {
        cell.bigOrSmallLabel.text = NSLocalizedString(@"大", @"大");
    }
    else if(sum >= 4 && sum <= 10)
    {
        cell.bigOrSmallLabel.text = NSLocalizedString(@"小", @"小");
    }
    
    //color up
    if(sum >= 11 && sum <= 17)
    {
        cell.diceLabel.textColor = [UIColor redColor];
        cell.sumLabel.textColor = [UIColor redColor];
        cell.bigOrSmallLabel.textColor = [UIColor redColor];
    }
    else if(sum >= 4 && sum <= 10)
    {
        cell.diceLabel.textColor = [UIColor greenColor];
        cell.sumLabel.textColor = [UIColor greenColor];
        cell.bigOrSmallLabel.textColor = [UIColor greenColor];
    }
    
    return cell;
}

#pragma mark - UITableViewDataSource delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(roadmapDatas)
        return roadmapDatas.count;
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"SBRoadmapCell";
    
    SBRoadmapCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell)
    {
        cell = [[SBRoadmapCell alloc] initWithReuseIdentifier:cellIdentifier];
    }
    
    return [self configureCell:cell withIndexPath:indexPath];
}

#pragma mark - UITableView delegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;//we are not allow any cell to be select
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
