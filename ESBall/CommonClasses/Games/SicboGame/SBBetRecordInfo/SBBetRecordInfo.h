//
//  SBBetRecordInfo.h
//  ESBall
//
//  Created by Nelson on 3/12/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBBetRecordInfo : NSObject

@property (nonatomic, copy) NSString *dataFileName;
@property (nonatomic, assign) double amountOfBet;

/**
 * A method to check if this data is an image
 * this method will check if dataFileName param contain image file name string
 * or pure string
 *
 * @return YES this is image data
 * @return NO this is string data
 */
-(BOOL)isDataAnImage;

@end
