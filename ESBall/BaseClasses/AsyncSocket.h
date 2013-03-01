//
//  AsyncSocket.h
//  ESBall
//
//  Created by Nelson on 12/11/28.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@class AsyncSocket;

@protocol AsyncSocketDelegate <NSObject>

@optional

-(void)AsyncSocket:(AsyncSocket *)socket didConnectToHost:(NSString *)hostname onPort:(uint16_t)port;
-(void)AsyncSocket:(AsyncSocket *)socket didDisconnectToHost:(NSString *)hostname onPort:(uint16_t)port;
-(void)AsyncSocket:(AsyncSocket *)socket didLoginWithUsername:(NSString *)username andPassword:(NSString *)password;
-(void)AsyncSocket:(AsyncSocket *)socket didReceivedRespond:(NSString *)respondStr;

@end
@interface AsyncSocket : NSObject<GCDAsyncSocketDelegate>{
    
    //GCDAsyncSocket
    GCDAsyncSocket *socket;
    //scheduler for repeating fire read data on socket
    NSTimer *socketListeningScheduler;
    
    //connected host
    NSString *connectedHost;
    //connected port
    uint16_t connectedPort;
    //login username
    NSString *loginUsername;
    //login password
    NSString *loginPassword;
    
    //temp store username password
    NSString *tempUsername;
    NSString *tempPassword;
    
    //server common error
    NSMutableDictionary *commonErrors;
}

@property (nonatomic, weak) id<AsyncSocketDelegate> theDelegate;
@property (nonatomic, assign) NSTimeInterval socketListeningInterval;
@property (nonatomic, assign) NSTimeInterval writeDataTimeoutInterval;
@property (nonatomic, readonly) NSString *hostName;
@property (nonatomic, readonly) uint16_t port;

+(id)asyncSocket;
-(GCDAsyncSocket *)baseSocket;
-(BOOL)connectToHost:(NSString *)host withPort:(uint16_t)port;
-(void)disconnectToHost;
-(void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
-(BOOL)sendDataToServerWithData:(NSData *)dataToSend;
-(void)getID;

@end
