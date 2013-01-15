//
//  ServerInterface.h
//  ESBall
//
//  Created by tomneo2004 on 12/11/28.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *ConnectionLostNotification = @"ConnectionLost";

@class ServerInterface;
@protocol ServerInterfaceDelegate <NSObject>

@optional

-(void)ServerInterface:(ServerInterface *)interface didConnectToHost:(NSString *)hostname onPort:(uint16_t)port;
-(void)ServerInterface:(ServerInterface *)interface didDisconnectToHost:(NSString *)hostname onPort:(uint16_t)port;
-(void)ServerInterface:(ServerInterface *)interface didLoginWithUsername:(NSString *)username andPassword:(NSString *)password;
-(void)ServerInterface:(ServerInterface *)interface didReceivedRespond:(NSString *)respondStr;
-(void)ServerInterface:(ServerInterface *)interface didSendDataWithData:(NSData *)data;
-(void)ServerInterface:(ServerInterface *)interface errorOccurredWithError:(NSString *)errorMsg;

@end

@interface ServerInterface : NSObject<NSStreamDelegate>{
    
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
    //login username
    NSString *loginUsername;
    //login password
    NSString *loginPassword;
    //temp store username password
    NSString *tempUsername;
    NSString *tempPassword;
    //connected host
    NSString *connectedHost;
    //connected port
    uint16_t connectedPort;
    BOOL isConnected;
    //server common error
    NSMutableDictionary *commonErrors;
    //is server return common error
    BOOL severReturnError;
    NSString *sid;
    
    NSMutableString *pendingDataStr;
    
    NSMutableString *appendableStr;
}

@property (nonatomic, weak) id<ServerInterfaceDelegate>theDelegate;
@property (nonatomic, readonly) NSString *theSID;

+(id)serverInterface;
-(void)logout;
//-(void)connectToHostWithUserName:(NSString *)username andPassword:(NSString *)password;
-(void)disconnectToHost;
-(void)loginWithUserName:(NSString *)username andPassword:(NSString *)password;
-(BOOL)sendDataToServerWithData:(NSData *)dataToSend;

@end
