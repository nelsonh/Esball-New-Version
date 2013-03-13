//
//  Hlper.m
//  ESBall
//
//  Created by Nelson on 3/13/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "HelperMethods.h"

@implementation HelperMethods

+(NSString *)doubleToStringWithDoubleValue:(double)value WithMaxFractionDigits:(int)numDigit
{
    NSNumberFormatter *doubleValueWithMaxTwoDecimalPlaces = [[NSNumberFormatter alloc] init];
    [doubleValueWithMaxTwoDecimalPlaces setNumberStyle:NSNumberFormatterDecimalStyle];
    [doubleValueWithMaxTwoDecimalPlaces setMaximumFractionDigits:numDigit];
    
    NSString *retStr = [doubleValueWithMaxTwoDecimalPlaces stringFromNumber:[NSNumber numberWithDouble:value]];
    
    return retStr;
}

@end
