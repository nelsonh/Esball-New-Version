//
//  BetRespondInfo.h
//  ESBall
//
//  Created by Nelson on 1/30/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

/**
 contain bet confirm information that had been interpreted from server
 post notification when interpret data complete
 **/

#import "BaseInfo.h"

/*
 * Pre-define string for notification name
 */
__unused static NSString *BetRespondInfoReayNotification = @"BetRespondInfoReady";

@interface BetRespondInfo : BaseInfo

/*
 * these properties hold information that extract from XML
 */
@property (nonatomic, assign) NSUInteger gameType;
@property (nonatomic, assign) NSUInteger gameCode;
@property (nonatomic, assign) double credit;
@property (nonatomic, strong) NSString *error;

@end
