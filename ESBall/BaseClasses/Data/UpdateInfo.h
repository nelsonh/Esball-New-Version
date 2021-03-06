//
//  UpdateInfo.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//



#import "BaseInfo.h"

/*
 * Pre-define string for notification name
 */
__unused static NSString *UpdateInfoReayNotification = @"UpdateInfoIsReady";

/**
 * UpdateInfo subclass of BaseInfo
 * contain update's information that had been interpreted from server
 * post notification when interpret data complete
 */
@interface UpdateInfo : BaseInfo

/**
 * these properties hold information that extract from XML
 */
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *let;
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, assign) NSUInteger gameType;
@property (nonatomic, assign) NSUInteger gameCode;
@property (nonatomic, assign) BOOL autoNext;
@property (nonatomic, assign) NSUInteger countDown;
@property (nonatomic, strong) NSString *dealerName;
@property (nonatomic, strong) NSString *gameCodeName;
@property (nonatomic, strong) NSArray *poker;
@property (nonatomic, assign) NSUInteger result;
@property (nonatomic, strong) NSArray *roadmap;
@property (nonatomic, strong) NSString *roundNumber;
@property (nonatomic, strong) NSString *roundSerial;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) double payoff;
@property (nonatomic, assign) double credit;

/**
 * A method to trim string
 * trim string only for sicbo what the hell
 *
 * @param string string to trim
 */
-(NSString *)trimString:(NSString *)string;

@end
