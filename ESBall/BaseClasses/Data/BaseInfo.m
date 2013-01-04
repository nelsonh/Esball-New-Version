//
//  BaseInfo.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BaseInfo.h"
#import <dispatch/dispatch.h>

@implementation BaseInfo

-(void)convertToDataFromXMLString:(NSString *)xmlStr
{
    
    xmlParser = [[XMLParser alloc] initXMLParser];
    xmlParser.theDelegate = self;
    
#ifdef XMLParserGCD
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    
        [xmlParser paserXMLWithString:xmlStr];
    });
#else
    [xmlParser paserXMLWithString:xmlStr];
#endif
    
}

-(void)postNotificationWithString:(NSString *)notifiStr withObject:(id)object
{
#ifdef XMLParserGCD
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [[NSNotificationCenter defaultCenter] postNotificationName:notifiStr object:object];
    });
    
#endif
}

#pragma mark - XMLParser delegate
-(void)XMLParser:(XMLParser *)parser didStartElementWithAttDic:(NSDictionary *)attDic
{
    
}

-(void)XMLParserDidEnd:(XMLParser *)parser
{
    
}

-(void)XMLParser:(XMLParser *)parser invalidateXML:(NSString *)xmlStr
{

}

@end
