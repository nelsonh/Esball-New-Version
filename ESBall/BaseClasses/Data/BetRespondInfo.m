//
//  BetRespondInfo.m
//  ESBall
//
//  Created by Nelson on 1/30/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRespondInfo.h"

@implementation BetRespondInfo

@synthesize gameType = _gameType;
@synthesize gameCode = _gameCode;
@synthesize credit = _credit;
@synthesize error = _error;

#pragma mark - override mehtods
-(void)convertToDataFromXMLString:(NSString *)xmlStr
{
    //make sure xml is matched
    if([xmlStr rangeOfString:@"onBet"].length>0)
    {
        [super convertToDataFromXMLString:xmlStr];
    }
    else
    {
        NSLog(@"onBet xml does not match");
    }
}

-(void)XMLParserDidEnd:(XMLParser *)parser
{
    [super XMLParserDidEnd:parser];
    
    NSMutableDictionary *dic = parser.attributeDictionary;
    
    //get and assign data
    _gameType = [[dic objectForKey:@"gameType"] intValue];
    _gameCode = [[dic objectForKey:@"gameCode"] intValue];
    _credit = [[dic objectForKey:@"credit"] doubleValue];
    _error = [dic objectForKey:@"runEor"];
    
    [self postNotificationWithString:BetRespondInfoReayNotification withObject:self];
    
}

@end
