//
//  UpdateInfo.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "UpdateInfo.h"



@implementation UpdateInfo

@synthesize identifier = _identifier;
@synthesize let = _let;
@synthesize sid = _sid;
@synthesize gameType = _gameType;
@synthesize gameCode = _gameCode;
@synthesize autoNext = _autoNext;
@synthesize countDown = _countDown;
@synthesize dealerName = _dealerName;
@synthesize gameCodeName = _gameCodeName;
@synthesize poker = _poker;
@synthesize result = _result;
@synthesize roadmap = _roadmap;
@synthesize roundNumber = _roundNumber;
@synthesize roundSerial = _roundSerial;
@synthesize status = _status;
@synthesize payoff = _payoff;
@synthesize credit = _credit;

//trim string only for sicbo what the hell
-(void)trimString:(NSString *)string
{
    if([string rangeOfString:@"{"].location == NSNotFound)
        return;
    
    NSUInteger loc = [string rangeOfString:@"{"].location;
    NSUInteger loc2 = ([string rangeOfString:@"}"].location-loc)+1;
    
    NSRange range = {loc, loc2};
    
    NSLog(@"range:%@", NSStringFromRange(range));
    
    [string stringByReplacingCharactersInRange:range withString:@""];
}

#pragma mark - override mehtods
-(void)convertToDataFromXMLString:(NSString *)xmlStr
{
    //make sure xml is matched
    if([xmlStr rangeOfString:@"onUpdate"].length>0)
    {
        [self trimString:xmlStr];
        [super convertToDataFromXMLString:xmlStr];
    }
    else
    {
        NSLog(@"onUpdate xml does not match");
    }
}

#pragma mark - XMLParser delegate
-(void)XMLParser:(XMLParser *)parser didStartElementWithAttDic:(NSDictionary *)attDic
{
    [super XMLParser:parser didStartElementWithAttDic:attDic];
}

-(void)XMLParserDidEnd:(XMLParser *)parser
{
    [super XMLParserDidEnd:parser];
    
    NSMutableDictionary *dic = parser.attributeDictionary;
    
    _identifier = [dic objectForKey:@"id"];
    _let = [dic objectForKey:@"let"];
    _sid = [dic objectForKey:@"sid"];
    _gameType = [[dic objectForKey:@"gameType"] intValue];
    _gameCode = [[dic objectForKey:@"gameCode"] intValue];
    
    NSString *autoNext = [dic objectForKey:@"autoNext"];
    _autoNext = [autoNext isEqualToString:@"N"]? NO:YES;
    
    _countDown = [[dic objectForKey:@"countDown"] intValue];
    _dealerName = [dic objectForKey:@"dealerName"];
    _gameCodeName = [dic objectForKey:@"gameCodeName"];
    
    NSArray *poker = [[dic objectForKey:@"poker"] componentsSeparatedByString:@","];
    _poker = poker;
    
    _result = [[dic objectForKey:@"result"] intValue];
    
    NSArray *roadmap = [[dic objectForKey:@"roadmap"] componentsSeparatedByString:@","];
    _roadmap = roadmap;
    
    _roundNumber = [dic objectForKey:@"roundNo"];
    _roundSerial = [dic objectForKey:@"roundSerial"];
    
    _status = [dic objectForKey:@"status"];
    _payoff = [[dic objectForKey:@"payoff"] doubleValue];
    _credit = [[dic objectForKey:@"credit"] doubleValue];
    
    [self postNotificationWithString:UpdateInfoReayNotification withObject:self];
    
}

@end
