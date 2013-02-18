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
    
    //XMLParser instance
    __block XMLParser *xmlParser;
}

/**
 * A method to convert XML to usable data(a NSObject)
 *
 * @param xmlStr xml string
 */
-(void)convertToDataFromXMLString:(NSString *)xmlStr;

/**
 * A method to post a notification
 *
 * @param notifiStr notification's name
 * @param object the object that follow notification
 */
-(void)postNotificationWithString:(NSString *)notifiStr withObject:(id)object;

@end
