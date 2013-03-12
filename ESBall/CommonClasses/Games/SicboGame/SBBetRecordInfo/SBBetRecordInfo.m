//
//  SBBetRecordInfo.m
//  ESBall
//
//  Created by Nelson on 3/12/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBBetRecordInfo.h"

@implementation SBBetRecordInfo

@synthesize dataFileName = _dataFileName;
@synthesize amountOfBet = _amountOfBet;

#pragma mark - public interface
-(BOOL)isDataAnImage
{
    if(_dataFileName)
    {
        //since our image are png format
        return [_dataFileName hasSuffix:@"png"];
    }

    return nil;
}

@end
