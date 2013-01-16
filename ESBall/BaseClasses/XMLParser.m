//
//  XMLPaser.m
//  ESBall
//
//  Created by Nelson on 11/30/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "XMLParser.h"


@interface XMLParser ()

@end

static XMLParser *paserInstance;

@implementation XMLParser

@synthesize theDelegate = _theDelegate;
@synthesize attributeDictionary = _attributeDictionary;
@synthesize xmlStrData = _xmlStrData;

+(id)xmlParser
{
    @synchronized(self)
    {
        if(paserInstance)
            return paserInstance;
        else
        {
            paserInstance = [[XMLParser alloc] init];
            return paserInstance;
        }
    }
}

-(id)initXMLParser;
{
    if(self = [super init])
    {
        
    }
    
    return self;
}

-(BOOL)isXMLStrAvaliable:(NSString *)xmlStr
{
    BOOL head = NO;
    BOOL end = NO;
    
    if([xmlStr rangeOfString:@"beans"].location != NSNotFound)
    {
        head = YES;
    }
    
    if([xmlStr rangeOfString:@"/beans"].location != NSNotFound)
    {
        end = YES;
    }
    
    
    if(!(head&&end))
    {
        //NSLog(@"xml str not avaliable");
#ifdef DEBUG
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
            NSString *msg = [NSString stringWithFormat:@"XML is not valid\n\n\n\n%@", xmlStr];
            InternalErrorAlert(self, @"Internal error", msg);
            
            //NSAssert(false, @"fail on parser xml, xml is not valid");
        });

        
#endif
    }
     
    
    return (head&&end);
}

-(void)paserXMLWithString:(NSString *)xmlStr
{
    //is xml valid
    if(![self isXMLStrAvaliable:xmlStr])
    {
        if([_theDelegate respondsToSelector:@selector(XMLParser:invalidateXML:)])
        {
            [_theDelegate XMLParser:self invalidateXML:xmlStr];
        }
        
        return;
    }
    
    _xmlStrData = xmlStr;
#ifdef XMLParserDebug
    NSLog(@"\n\n%@\n\n", xmlStr);
#endif
    
    if(parser)
        parser = nil;
    
    NSData *xmlData = [xmlStr dataUsingEncoding:NSUTF8StringEncoding];
    parser = [[NSXMLParser alloc] initWithData:xmlData];
    parser.delegate = self;
    
    attDic = [[NSMutableDictionary alloc] init];
    
    if([parser parse])
    {
#ifdef XMLParserDebug
        NSLog(@"can not pase xml Error:%@", parser.parserError);
#endif
    }
}

#pragma mark - NSXMLPaser delegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    
    //convert data and key base on server respond xml
    if([elementName isEqualToString:@"bean"])
    {
        NSString *key = [[attributeDict allKeys] objectAtIndex:0];
        id obj = [[attributeDict objectForKey:key] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        key = [key stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        [attDic setObject:obj forKey:key];
    }
    else if([elementName isEqualToString:@"property"])
    {
        NSString *key = [[attributeDict allKeys] objectAtIndex:0];
        id obj_Value = [[attributeDict objectForKey:key] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        key = [[attributeDict allKeys] objectAtIndex:1];
        NSString *key_Name = [[attributeDict objectForKey:key] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        [attDic setObject:obj_Value forKey:key_Name];
    }
    
    //inform delegate
    if([_theDelegate respondsToSelector:@selector(XMLParser:didStartElementWithAttDic:)])
    {
        [_theDelegate XMLParser:self didStartElementWithAttDic:attributeDict];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{

    //parsing xml complete and inform delegate
    if([_theDelegate respondsToSelector:@selector(XMLParserDidEnd:)])
    {
        [_theDelegate XMLParserDidEnd:self];
    }
}

#pragma mark - getter setter
-(NSMutableDictionary *)attributeDictionary
{
    return attDic;
}

@end
