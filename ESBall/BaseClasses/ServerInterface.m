//
//  ServerInterface.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/28.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "ServerInterface.h"
#import <SystemConfiguration/SystemConfiguration.h>

#define kStreamReadBufferSize 32768 //32k

@interface ServerInterface ()

-(void)loadCommonErrors;
-(BOOL)canReachHost;
//-(BOOL)doSendDataWithData:(NSData *)data;
-(void)processMessage:(NSString *)msg;
-(void)connectToHostWithUserName:(NSString *)username andPassword:(NSString *)password;
-(BOOL)isCompleteXMLWithXMLString:(NSString *)xmlStr;

@end

static ServerInterface *serverInterfaceInstance;
static NSString *hostToCnnect = @"183.182.66.167";//167, 80, 239

@implementation ServerInterface

@synthesize theDelegate = _theDelegate;
@synthesize theSID = _theSID;

#pragma mark - init
+(id)serverInterface
{
    @synchronized(self)
    {
        if(serverInterfaceInstance)
            return serverInterfaceInstance;
        else
        {
            serverInterfaceInstance = [[ServerInterface alloc] init];
            [serverInterfaceInstance loadCommonErrors];
            
            return serverInterfaceInstance;
        }
    }

}

-(void)loadCommonErrors
{
    commonErrors = [[NSMutableDictionary alloc] init];
    
    NSString *key, *msg;
    
    key = @"API_EC_ACC_30_SEC";
    msg = NSLocalizedString(@"请三十秒后再次登入", @"请三十秒后再次登入");
    [commonErrors setObject:msg forKey:key];
    
    key = @"API_EC_ACC_DISABLED";
    msg = NSLocalizedString(@"帐号停用", @"帐号停用");
    [commonErrors setObject:msg forKey:key];
    
    key = @"API_EC_ACC_PWD_INVALID";
    msg = NSLocalizedString(@"密码错误", @"密码错误");
    [commonErrors setObject:msg forKey:key];
    
    key = @"API_EC_ACC_FREEZE";
    msg = NSLocalizedString(@"帐号冻结", @"帐号冻结");
    [commonErrors setObject:msg forKey:key];
    
    key = @"API_EC_ACC_SUSPENDED";
    msg = NSLocalizedString(@"帐号停用", @"帐号停用");
    [commonErrors setObject:msg forKey:key];
    
    key = @"API_EC_SYS_MAINTAIN";
    msg = NSLocalizedString(@"维护中 请稍后", @"维护中 请稍后");
    [commonErrors setObject:msg forKey:key];
    
    key = @"NDER_MIN";
    msg = NSLocalizedString(@"下注失敗", @"下注失敗");
    [commonErrors setObject:msg forKey:key];
    
    key = @"OVERMAX";
    msg = NSLocalizedString(@"注额不足", @"注额不足");
    [commonErrors setObject:msg forKey:key];
    
    key = @"TIMEOUT";
    msg = NSLocalizedString(@"连线逾时", @"连线逾时");
    [commonErrors setObject:msg forKey:key];
}

#pragma mark - internal
-(BOOL)isCompleteXMLWithXMLString:(NSString *)xmlStr
{
    BOOL head = NO;
    BOOL end = NO;
    
    if([xmlStr rangeOfString:@"<beans>"].location != NSNotFound)
    {
        head = YES;
    }
    
    if([xmlStr rangeOfString:@"</beans>"].location != NSNotFound)
    {
        end = YES;
    }
    
    return (head&&end);
}

#pragma mark - interface
-(BOOL)canReachHost
{
    bool success = false;
    const char *host_name = [hostToCnnect cStringUsingEncoding:NSASCIIStringEncoding];
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host_name);
    SCNetworkReachabilityFlags flags;
    success = SCNetworkReachabilityGetFlags(reachability, &flags);
    bool isAvailable = success && (flags & kSCNetworkFlagsReachable) &&
    !(flags & kSCNetworkFlagsConnectionRequired);
    
    if(isAvailable)
        return YES;
    else
        return NO;
}

-(void)connectToHostWithUserName:(NSString *)username andPassword:(NSString *)password
{
    //remove previous inpustream if needed 
    if(inputStream)
    {
        if(inputStream.streamStatus == NSStreamStatusOpen)
            [inputStream close];
        
        [inputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        inputStream = nil;
    }
    
    //remove previous outputstream if needed
    if(outputStream)
    {
        if(outputStream.streamStatus == NSStreamStatusOpen)
            [outputStream close];
        
        [outputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        outputStream = nil;
    }
    
    if(![self canReachHost])
    {
        isConnected = NO;
        NSLog(@"can not reach host");
        return;
    }
    
    if(isConnected == YES)
    {
        NSLog(@"Host is already connected");
        return;
    }
    
    int code = 0;
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)hostToCnnect, 10243, &readStream, &writeStream);

    
    inputStream = (__bridge NSInputStream*)readStream;
    outputStream = (__bridge NSOutputStream*)writeStream;
    
    CFRelease(readStream);
    CFRelease(writeStream);
    
    inputStream.delegate = self;
    outputStream.delegate = self;
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
    
    
    NSString *respond = @"getsid\n";
    NSData *data = [[NSData alloc] initWithData:[respond dataUsingEncoding:NSASCIIStringEncoding]];
    code = [outputStream write:[data bytes] maxLength:[data length]];
    
    respond = [NSString stringWithFormat:@"%@,%@\n", username, password];
    data = [[NSData alloc] initWithData:[respond dataUsingEncoding:NSASCIIStringEncoding]];
    code = [outputStream write:[data bytes] maxLength:[data length]];
    
    
    if(code == -1)
    {
        isConnected = NO;
        NSLog(@"connect to server error");
    }
    else
    {
        tempUsername = username;
        tempPassword = password;
        
        isConnected = YES;
        NSLog(@"connect to server success");
        
        connectedHost = hostToCnnect;
        connectedPort = 10243;
        
        if([_theDelegate respondsToSelector:@selector(ServerInterface:didConnectToHost:onPort:)])
        {
            [_theDelegate ServerInterface:self didConnectToHost:hostToCnnect onPort:10243];
        }
        
    }
}

-(void)disconnectToHost
{
    if(inputStream)
    {
        [inputStream close];
        [inputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        
        inputStream = nil;
    }
    if(outputStream)
    {
        [outputStream close];
        [outputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        
        outputStream = nil;
    }
    
    
    isConnected = NO;
    loginUsername = nil;
    loginPassword = nil;
    
    connectedHost = nil;
    connectedPort = 0;
    
    if([_theDelegate respondsToSelector:@selector(ServerInterface:didDisconnectToHost:onPort:)])
    {
        [_theDelegate ServerInterface:self didDisconnectToHost:connectedHost onPort:connectedPort];
    }
}

-(void)loginWithUserName:(NSString *)username andPassword:(NSString *)password
{
    if(!isConnected)
        [self connectToHostWithUserName:username andPassword:password];
    /*
    int code = 0;
    NSString *respond = [NSString stringWithFormat:@"%@,%@\n", username, password];
    NSData *data = [[NSData alloc] initWithData:[respond dataUsingEncoding:NSASCIIStringEncoding]];
    code = [outputStream write:[data bytes] maxLength:[data length]];
     */
    
    //tempUsername = username;
    //tempPassword = password;
    
    /*
    if(code == -1)
    {
        NSLog(@"unable to login server");
    }
    */

}

-(BOOL)sendDataToServerWithData:(NSData *)dataToSend
{
    int code = 0;
    
    //send directly
    
    code = [outputStream write:[dataToSend bytes] maxLength:[dataToSend length]];
    
    if(code == -1)
    {
        return NO;
    }
    else
    {
#ifdef ServerClientSentDataDebug
        NSLog(@"Client send data to server with data:%@", [[NSString alloc] initWithData:dataToSend encoding:NSUTF8StringEncoding]);
#endif
        
        if([_theDelegate respondsToSelector:@selector(ServerInterface:didSendDataWithData:)])
        {
            [_theDelegate ServerInterface:self didSendDataWithData:dataToSend];
        }
        return YES;
    }
}
/*
-(BOOL)doSendDataWithData:(NSData *)data
{
    int code = 0;
    code = [outputStream write:[data bytes] maxLength:[data length]];
    
    if(code == -1)
    {
        return NO;
    }
    else
    {
        if([_theDelegate respondsToSelector:@selector(ServerInterface:didSendDataWithData:)])
        {
            [_theDelegate ServerInterface:self didSendDataWithData:data];
        }
        return YES;
    }
}
 */

#pragma mark - NSInputStream NSOutputStream delegate
- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
    
    
    switch (streamEvent) {
			
		case NSStreamEventOpenCompleted:
			NSLog(@"Stream to server was opened");
			break;
        case NSStreamEventHasSpaceAvailable:
        {
            //NSLog(@"Stream has space available");

            break;
        }
		case NSStreamEventHasBytesAvailable:
            
			if (theStream == inputStream) {
                
                int bufferSize= kStreamReadBufferSize;
                
				uint16_t buffer[bufferSize];
				int len = 0;
                UInt32 big5 = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingBig5);
                
				while ([inputStream hasBytesAvailable])
                {
					len = [inputStream read:buffer maxLength:sizeof(buffer)];
                    
					if (len > 0)
                    {
                        
						NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:big5];
                    
                        
#ifdef OutputServerRespond

                        NSLog(@"Server respond:\n\nDataByte:%i\n\n\n%@\n\n\n", len, output);
#endif
						
						if (nil != output)
                        {
                            if ([output rangeOfString:@"timeout is expired"].location !=NSNotFound || [output rangeOfString:@"Unknow"].location !=NSNotFound)
                            {
                                NSString *msg = NSLocalizedString(@"连线已中断，请重新登入", @"连线已中断，请重新登入");
                                UIAlertView *timeoutAlert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
                                [timeoutAlert show];
                                
                                [self disconnectToHost];
                                
                                [[NSNotificationCenter defaultCenter] postNotificationName:ConnectionLostNotification object:nil];
                                
                                return;
                            }
                            
                            /*
                            if(pendingDataStr)//if there is a pending data
                            {
                                //append this part
                                [pendingDataStr appendString:output];
                                
                                //if it is not complete xml wait for next part
                                if(![self isCompleteXMLWithXMLString:pendingDataStr])
                                {
                                    return;
                                }
                            }
                            else if([output rangeOfString:@"<beans>"].location != NSNotFound)
                            {
                                //if it is not a complete xml
                                if(![self isCompleteXMLWithXMLString:output])
                                {
                                    //init pending data and wait for next part
                                    pendingDataStr = nil;
                                    pendingDataStr = [[NSMutableString alloc] init];
                                    [pendingDataStr appendString:output];
                                    
                                    return;
                                }
                            }
                             */
                            
                            //[self processMessage:output];
                            //pendingDataStr = nil;//clear pending data
                            
                            if(appendableStr == nil)
                                appendableStr = [[NSMutableString alloc] init];
                            
                            [appendableStr appendString:output];
						}
					}
                    [self processMessage:appendableStr];
                    appendableStr = nil;
				}
			}
			break;
            
			
		case NSStreamEventErrorOccurred:
        {
            
            NSLog(@"Stream has occured an error");
            NSLog(@"Stream error:%@", theStream.streamError);
            NSString *msg = NSLocalizedString(@"连线已中断，请重新登入", @"连线已中断，请重新登入");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles:nil];
            [alertView show];
            
            [self disconnectToHost];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:ConnectionLostNotification object:nil];
             
            
            break;
		}
		case NSStreamEventEndEncountered:
            NSLog(@"Stream end");
            
            NSLog(@"Stream closed");
            [theStream close];
            [theStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            theStream = nil;
            [self disconnectToHost];
            
			break;
		default:
            NSLog(@"Stream received unknown event");
    }
    
}

#pragma mark - handle incoming data
-(void)processMessage:(NSString *)msg
{
    
    /**handle server common error**/
    id object = [commonErrors objectForKey:msg];
    if(object)
    {
        if([_theDelegate respondsToSelector:@selector(ServerInterface:errorOccurredWithError:)])
        {
            [_theDelegate ServerInterface:self errorOccurredWithError:(NSString *)object];
        }
        
        //temp show alert
        NSString *errorMsg = object;
        UIAlertView *commonErrorAlert = [[UIAlertView alloc] initWithTitle:nil message:errorMsg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        [commonErrorAlert show];

    }
    
    /**check if login is success**/
    
    if([msg rangeOfString:@"onUpdateMarquee"].length>0)
    {
        //NSLog(@"on marquee");
        
        //dispatch data to delegate
        if([_theDelegate respondsToSelector:@selector(ServerInterface:didReceivedRespond:)])
        {
            [_theDelegate ServerInterface:self didReceivedRespond:msg];
        }
    }
    else if([msg rangeOfString:@"loginsid"].length>0)
    {
        //NSString *loginMessage = [NSString stringWithFormat:@"login\n"];
        //[self sendDataToServerWithData:[loginMessage dataUsingEncoding:NSASCIIStringEncoding]];
        
        //store sid
        NSArray *splite = [msg componentsSeparatedByString:@";"];
        sid = [splite objectAtIndex:1];
        
        //success login
        loginUsername = tempUsername;
        loginPassword = tempPassword;
        
        //tempUsername = nil;
        //tempPassword = nil;
        
        if([_theDelegate respondsToSelector:@selector(ServerInterface:didLoginWithUsername:andPassword:)])
        {
            [_theDelegate ServerInterface:self didLoginWithUsername:loginUsername andPassword:loginPassword];
        }
         
    }
    /*
    else if([msg rangeOfString:@"onLogin"].length > 0)
    {
        //success login
        loginUsername = tempUsername;
        loginPassword = tempPassword;
        
        //tempUsername = nil;
        //tempPassword = nil;
        
        if([_theDelegate respondsToSelector:@selector(ServerInterface:didLoginWithUsername:andPassword:)])
        {
            [_theDelegate ServerInterface:self didLoginWithUsername:loginUsername andPassword:loginPassword];
        }
    }
     */
    else
    {
        //dispatch data to delegate
        if([_theDelegate respondsToSelector:@selector(ServerInterface:didReceivedRespond:)])
        {
            [_theDelegate ServerInterface:self didReceivedRespond:msg];
        }
    }
}

#pragma mark - getter setter
-(NSString *)theSID
{
    return sid;
}

@end
