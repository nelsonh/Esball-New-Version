//
//  MarqueeInfo.h
//  ESBall
//
//  Created by Nelson on 12/11/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BaseInfo.h"

static NSString *MarqueeInfoReadyNotification = @"MarqueeInfoIsReady";

@interface MarqueeInfo : BaseInfo

@property (nonatomic, strong) NSString *let;
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, assign) NSUInteger gameType;
@property (nonatomic, assign) NSUInteger gameCode;
@property (nonatomic, strong) NSString *lang;
@property (nonatomic, strong) NSString *marquee;

@end
