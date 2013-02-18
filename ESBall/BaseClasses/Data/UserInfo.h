//
//  UserInfo.h
//  ESBall
//
//  Created by Nelson on 11/30/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

/**
 contain user's information that had been interpreted from server
 post notification when interpret data complete
 **/

#import <Foundation/Foundation.h>
#import "BaseInfo.h"

/**
 * Pre-define string for notification name
 */
__unused static NSString *UserInfoReadyNotification = @"UserInfoIsReady";

@interface UserInfo : BaseInfo

/**
 * these properties hold information that extract from XML
 */
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *let;
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, assign) NSUInteger gameType;
@property (nonatomic, assign) NSUInteger gameCode;
@property (nonatomic, assign) double credit;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, assign) double currencyRate;
@property (nonatomic, assign) NSUInteger hallID;
@property (nonatomic, assign) BOOL kick;
@property (nonatomic, assign) double max;
@property (nonatomic, assign) double ou;
@property (nonatomic, assign) double pair;
@property (nonatomic, assign) double tie;
@property (nonatomic, assign) double min;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) double maxBalance;
@property (nonatomic, assign) double payoffTotal;
@property (nonatomic, assign) NSUInteger siteLevel;
@property (nonatomic, strong) NSArray *chipList;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) BOOL stateLisBoa;
@property (nonatomic, assign) BOOL stateTT;
@property (nonatomic, strong) NSArray *chipFilter;


@end
