//
//  BaseInfo.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

/**
 provide a xml interpreter associated with data which was pulled from server
 **/

#import <Foundation/Foundation.h>
#import "XMLParser.h"

@interface BaseInfo : NSObject<XMLParserDelegate>{
    
    __block XMLParser *xmlParser;
}

-(void)convertToDataFromXMLString:(NSString *)xmlStr;
-(void)postNotificationWithString:(NSString *)notifiStr withObject:(id)object;

@end
