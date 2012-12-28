//
//  UserInfo.m
//  ESBall
//
//  Created by Nelson on 11/30/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo

@synthesize identifier = _identifier;
@synthesize let = _let;
@synthesize sid = _sid;
@synthesize gameType = _gameType;
@synthesize gameCode = _gameCode;
@synthesize credit = _credit;
@synthesize currency = _currency;
@synthesize currencyRate = _currencyRate;
@synthesize hallID = _hallID;
@synthesize kick = _kick;
@synthesize max = _max;
@synthesize ou = _ou;
@synthesize pair = _pair;
@synthesize tie = _tie;
@synthesize min = _min;
@synthesize userID = _userID;
@synthesize userName = _userName;
@synthesize maxBalance = _maxBalance;
@synthesize payoffTotal = _payoffTotal;
@synthesize siteLevel = _siteLevel;
@synthesize chipList = _chipList;
@synthesize phone = _phone;
@synthesize stateLisBoa = _stateLisBoa;
@synthesize stateTT = _stateTT;
@synthesize chipFilter = _chipFilter;




#pragma mark - override mehtods
-(void)convertToDataFromXMLString:(NSString *)xmlStr
{
    //make sure xml is matched
    if([xmlStr rangeOfString:@"onUserInfo"].length>0)
    {
        [super convertToDataFromXMLString:xmlStr];
    }
    else
    {
        NSLog(@"UserInfo xml does not match");
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
    
    //get and assign data
    _identifier = [dic objectForKey:@"id"];
    _let = [dic objectForKey:@"let"];
    _sid = [dic objectForKey:@"sid"];
    _gameType = [[dic objectForKey:@"gameType"] intValue];
    _gameCode = [[dic objectForKey:@"gameCode"] intValue];
    _credit = [[dic objectForKey:@"credit"] doubleValue];
    _currency = [dic objectForKey:@"currency"];
    _currencyRate = [[dic objectForKey:@"currencyRate"] doubleValue];
    _hallID = [[dic objectForKey:@"hallID"] intValue];
    
    NSString *kick = [dic objectForKey:@"kick"];
    _kick = [kick isEqualToString:@"N"]? NO:YES;
    
    _max = [[dic objectForKey:@"max"] doubleValue];
    _ou = [[dic objectForKey:@"ou"] doubleValue];
    _pair = [[dic objectForKey:@"pair"] doubleValue];
    _tie = [[dic objectForKey:@"tie"] doubleValue];
    _min = [[dic objectForKey:@"min"] doubleValue];
    
    _userID = [dic objectForKey:@"userID"];
    _userName = [dic objectForKey:@"userName"];
    _maxBalance = [[dic objectForKey:@"MaxBalance"] doubleValue];
    _payoffTotal = [[dic objectForKey:@"PayoffTotal"] doubleValue];
    _siteLevel = [[dic objectForKey:@"siteLevel"] intValue];
    
    NSArray *chipList = [[dic objectForKey:@"chipList"] componentsSeparatedByString:@","];
    _chipList = chipList;
    //NSLog(@"chiplist:%@", chipList);
    
    _phone = [dic objectForKey:@"phone"];
    
    NSString *stateLisBoa = [dic objectForKey:@"StateLisBoa"];
    _stateLisBoa = [stateLisBoa isEqualToString:@"N"]? NO:YES;
    
    NSString *stateTT = [dic objectForKey:@"StateTT"];
    _stateTT = [stateTT isEqualToString:@"N"]? NO:YES;
    
    NSArray *chipFilter = [[dic objectForKey:@"chipFilter"] componentsSeparatedByString:@","];
    _chipFilter = chipFilter;
    
    [self postNotificationWithString:UserInfoReadyNotification withObject:self];
    
}

@end
