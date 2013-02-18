//
//  XMLPaser.h
//  ESBall
//
//  Created by Nelson on 11/30/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMLParser;

/*
 * A protocol of XMLParser
 */
@protocol XMLParserDelegate <NSObject>

@optional

/*
 * Fire when xml parser start an element
 */
-(void)XMLParser:(XMLParser *)parser didStartElementWithAttDic:(NSDictionary *)attDic;

/*
 * Fire when parser process end
 */
-(void)XMLParserDidEnd:(XMLParser *)parser;

/*
 * Fire when xml parser detect xml is not validate
 */
-(void)XMLParser:(XMLParser *)parser invalidateXML:(NSString *)xmlStr;

@end

@interface XMLParser : NSObject<NSXMLParserDelegate>{
    
    NSXMLParser *parser;
    NSMutableDictionary *attDic;
    
}

@property (nonatomic, weak) id<XMLParserDelegate> theDelegate;//delegate
@property (nonatomic, readonly) NSMutableDictionary *attributeDictionary;//all key and objct are string
@property (nonatomic, strong) NSString *xmlStrData;//string of xml


//not used
+(id)xmlParser NS_DEPRECATED_IOS(2_0, 2_0);

/*
 * A method to create XMLParser instance
 */
-(id)initXMLParser;

/*
 * A method start to parse xml
 *
 * @param xmlStr string of XML
 */
-(void)paserXMLWithString:(NSString *)xmlStr;

@end
