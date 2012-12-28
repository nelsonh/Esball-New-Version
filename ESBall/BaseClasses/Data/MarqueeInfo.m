//
//  MarqueeInfo.m
//  ESBall
//
//  Created by Nelson on 12/11/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "MarqueeInfo.h"

@implementation MarqueeInfo

@synthesize let = _let;
@synthesize sid = _sid;
@synthesize gameType = _gameType;
@synthesize gameCode = _gameCode;
@synthesize lang = _lang;
@synthesize marquee = _marquee;

#pragma mark - override mehtods
-(void)convertToDataFromXMLString:(NSString *)xmlStr
{
    //make sure xml is matched
    if([xmlStr rangeOfString:@"onUpdateMarquee"].length>0)
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
    
    _let = [dic objectForKey:@"let"];
    _sid = [dic objectForKey:@"sid"];
    _gameType = [[dic objectForKey:@"gameType"] intValue];
    _gameCode = [[dic objectForKey:@"gameCode"] intValue];
    _lang = [dic objectForKey:@"lang"];
    _marquee = [dic objectForKey:@"marquee"];
    
    [self postNotificationWithString:MarqueeInfoReadyNotification withObject:self];
}

@end
