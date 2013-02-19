//
//  BaseInfo.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "XMLParser.h"

/**
 * BaseInfo subclass of NSObject
 * provide a xml interpreter associated with data which was sent from server
 */
@interface BaseInfo : NSObject<XMLParserDelegate>{
    
    //XMLParser instance
    __block XMLParser *xmlParser;
}

/**
 * A method to convert XML to usable data(a NSObject)
 *
 * 轉換 XML 資料
 *
 * @param xmlStr xml string
 */
-(void)convertToDataFromXMLString:(NSString *)xmlStr;

/**
 * A method to post a notification
 *
 * 發佈 notification, 當資料轉換完成
 *
 * @param notifiStr notification's name
 * @param object the object that follow notification
 */
-(void)postNotificationWithString:(NSString *)notifiStr withObject:(id)object;

@end
