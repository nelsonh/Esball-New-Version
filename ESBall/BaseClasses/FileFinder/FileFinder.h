//
//  FileFinder.h
//  ESBall
//
//  Created by Nelson on 12/12/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileFinder : NSObject

+(id)fileFinder;
-(NSString *)findPathForFileWithFileName:(NSString *)filenname;

@end
