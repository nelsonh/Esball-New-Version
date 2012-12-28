//
//  AsyncSocket.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/28.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "AsyncSocket.h"

@interface AsyncSocket()

-(id)initWithSocket;
-(void)continueLisetnSocket;

@end

static AsyncSocket *socketInstance;

@implementation AsyncSocket

@synthesize theDelegate = _theDelegate;
@synthesize socketListeningInterval = _socketListeningInterval;
@synthesize writeDataTimeoutInterval = _writeDataTimeoutInterval;
@synthesize hostName = _hostName;
@synthesize port = _port;

+(id)asyncSocket
{
    @synchronized(self)
    {
        if(socketInstance)
            return socketInstance;
        else
        {
            return [[AsyncSocket alloc] initWithSocket];
        }
    }
}

-(GCDAsyncSocket *)baseSocket
{
    return socket;
}

#pragma mark - init
-(id)initWithSocket;
{
    if(self = [super init])
    {
        socket = [[GCDAsyncSocket alloc] init];
        socket.delegate = self;
        socket.delegateQueue = dispatch_get_main_queue();
        
        //socket continue listen interval default
        _socketListeningInterval = 0.5;
        //socket write data timeout interval default
        _writeDataTimeoutInterval = 5.0;
        
        [self loadCommonErrors];
    }

    return self;
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

#pragma mark - interface methods
-(BOOL)connectToHost:(NSString *)host withPort:(uint16_t)port
{
    BOOL success = NO;
    NSError *error;
    success = [socket connectToHost:host onPort:port error:&error];
    
    if(error)
    {
        NSLog(@"connect to host fail:%@", error);
    }
    
    return success;
}

-(void)disconnectToHost
{
    [socket disconnect];
}

-(void)getID
{
    NSString *sendStr = [NSString stringWithFormat:@"getsid%@\n", @""];
    NSData *sendData = [sendStr dataUsingEncoding:NSASCIIStringEncoding];
    
    [socket writeData:sendData withTimeout:_writeDataTimeoutInterval tag:0];
}

-(void)loginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    
    tempUsername = username;
    tempPassword = tempPassword;
    

    NSString *sendStr = [NSString stringWithFormat:@"%@,%@\n", username, password];
    NSData *sendData = [sendStr dataUsingEncoding:NSASCIIStringEncoding];
    
    [socket writeData:sendData withTimeout:_writeDataTimeoutInterval tag:0];
    
    NSLog(@"login data sent");
}

-(BOOL)sendDataToServerWithData:(NSData *)dataToSend
{

    if(!dataToSend)
    {
        NSLog(@"send data to server fail, data was nil");
        return NO;
    }
    else
    {
        [socket writeData:dataToSend withTimeout:_writeDataTimeoutInterval tag:0];
        return YES;
    }
}

#pragma mark - continue listen socket
-(void)continueLisetnSocket
{
    if(socket.isConnected)
        [socket readDataWithTimeout:-1 tag:0];
}

#pragma mark - GCDAsyncSocket delegate
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"did connect to host:%@ on port:%u", host, port);
    
    connectedHost = host;
    connectedPort = port;
    
    //continue listen incoming data
    socketListeningScheduler = [NSTimer scheduledTimerWithTimeInterval:_socketListeningInterval target:self selector:@selector(continueLisetnSocket) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:socketListeningScheduler forMode:NSRunLoopCommonModes];
    NSLog(@"start listen data from server");
    
    if([_theDelegate respondsToSelector:@selector(AsyncSocket:didConnectToHost:onPort:)])
    {
        [_theDelegate AsyncSocket:self didConnectToHost:host onPort:port];
    }
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    NSString *hostname = [connectedHost copy];
    unsigned short port = connectedPort;
    
    connectedHost = nil;
    connectedPort = 0;
    
    if([_theDelegate respondsToSelector:@selector(AsyncSocket:didDisconnectToHost:onPort:)])
    {
        [_theDelegate AsyncSocket:self didDisconnectToHost:hostname onPort:port];
    }
    
    //stop listening
    [socketListeningScheduler invalidate];
    
    
    NSLog(@"did disconnect to host:%@ port:%us", hostname, port);
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    unsigned long encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingBig5);
    
    NSString *respondString = [[NSString alloc] initWithData:data encoding:encoding];
    
    /**handle server common error**/
    id object = [commonErrors objectForKey:respondString];
    if(object)
    {
        //temp show alert
        NSString *errorMsg = object;
        UIAlertView *commonErrorAlert = [[UIAlertView alloc] initWithTitle:nil message:errorMsg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        [commonErrorAlert show];
    }
    
    /**check if login is success**/
    if([respondString rangeOfString:@"loginsid"].length>0)
    {
        //success login
        loginUsername = tempUsername;
        loginPassword = tempPassword;
        
        tempUsername = nil;
        tempPassword = nil;
        
        if([_theDelegate respondsToSelector:@selector(AsyncSocket:didLoginWithUsername:andPassword:)])
        {
            [_theDelegate AsyncSocket:self didLoginWithUsername:loginUsername andPassword:loginPassword];
        }
    }
    else
    {
        if([_theDelegate respondsToSelector:@selector(AsyncSocket:didReceivedRespond:)])
        {
            [_theDelegate AsyncSocket:self didReceivedRespond:respondString];
        }
    }
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    NSLog(@"did write data");
}


#pragma mark - getter setter
-(NSString *)hostName
{
    return connectedHost;
}

-(uint16_t)port
{
    return connectedPort;
}

@end
