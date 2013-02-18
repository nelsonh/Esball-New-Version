//
//  ServerInterface.h
//  ESBall
//
//  Created by tomneo2004 on 12/11/28.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kConnectionTimeout 60//connection timeout period 

/*
 * Pre-define string
 */
__unused static NSString *ConnectionLostNotification = @"ConnectionLost";
__unused static NSString *InternetNotAvalible = @"InternetNotAvalible";

@class ServerInterface;

/*
 * A protocol of ServerInterface
 */
@protocol ServerInterfaceDelegate <NSObject>

@optional

/*
 * Fire when connect to host
 */
-(void)ServerInterface:(ServerInterface *)interface didConnectToHost:(NSString *)hostname onPort:(uint16_t)port;

/*
 * Fire when disconnect to host
 */
-(void)ServerInterface:(ServerInterface *)interface didDisconnectToHost:(NSString *)hostname onPort:(uint16_t)port;

/*
 * Fire when login
 */
-(void)ServerInterface:(ServerInterface *)interface didLoginWithUsername:(NSString *)username andPassword:(NSString *)password;

/*
 * Fire when receive respond data from server
 */
-(void)ServerInterface:(ServerInterface *)interface didReceivedRespond:(NSString *)respondStr;

/*
 * Fire when it is about to send data to server
 */
-(void)ServerInterface:(ServerInterface *)interface didSendDataWithData:(NSData *)data;

/*
 * Fire when error happend
 */
-(void)ServerInterface:(ServerInterface *)interface errorOccurredWithError:(NSString *)errorMsg;

@end

@interface ServerInterface : NSObject<NSStreamDelegate>{
    
    //input stream
    NSInputStream *inputStream;
    //output stream
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
    
    //indicate connect to host 
    BOOL isConnected;
    
    //server common error
    NSMutableDictionary *commonErrors;
    
    //is server return common error
    BOOL severReturnError;
    
    //hold sid that given from server
    NSString *sid;
    
    //for xml format
    NSMutableString *pendingDataStr;
    
    //for normal string msg specially read from stream
    NSMutableString *appendableStr;
}

@property (nonatomic, weak) id<ServerInterfaceDelegate>theDelegate;//delegate
@property (nonatomic, readonly) NSString *theSID;//getter method for SID

/*
 * A method return ServerInterface instance which can be only one in app
 * ServerInterface is a singleton, there is no second one
 */
+(id)serverInterface;

/*
 * A method return host server IP
 */
-(NSString *)serverIP;

/*
 * A method to check if can reach host server
 */
-(BOOL)canReachHost;

/*
 * A method to logout from server
 */
-(void)logout;

//-(void)connectToHostWithUserName:(NSString *)username andPassword:(NSString *)password;

/*
 * A method to disconnect from host server
 */
-(void)disconnectToHost;

/*
 * A method that get call when timeout
 */
-(void)timeout;

/*
 * A method used to login server
 *
 * @param username login user name
 * @param passowrd login password
 */
-(void)loginWithUserName:(NSString *)username andPassword:(NSString *)password;

/*
 * A method used to send data to host server
 *
 * @param dataToSend NSData that will be send to host server
 */
-(BOOL)sendDataToServerWithData:(NSData *)dataToSend;

@end
