//
//  XMLPaser.h
//  ESBall
//
//  Created by Nelson on 11/30/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMLParser;

@protocol XMLParserDelegate <NSObject>

@optional

-(void)XMLParser:(XMLParser *)parser didStartElementWithAttDic:(NSDictionary *)attDic;
-(void)XMLParserDidEnd:(XMLParser *)parser;
-(void)XMLParser:(XMLParser *)parser invalidateXML:(NSString *)xmlStr;

@end

@interface XMLParser : NSObject<NSXMLParserDelegate>{
    
    NSXMLParser *parser;
    NSMutableDictionary *attDic;
    
}

@property (nonatomic, weak) id<XMLParserDelegate> theDelegate;
@property (nonatomic, readonly) NSMutableDictionary *attributeDictionary;//all key and objct are string
@property (nonatomic, strong) NSString *xmlStrData;


//not used
+(id)xmlParser;

-(id)initXMLParser;
-(void)paserXMLWithString:(NSString *)xmlStr;

@end
