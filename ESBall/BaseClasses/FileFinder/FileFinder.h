//
//  FileFinder.h
//  ESBall
//
//  Created by Nelson on 12/12/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileFinder : NSObject

/*
 * A method return FileFinder instance, FileFinder instance can be only one in app
 * FileFinder is a singleton
 */
+(id)fileFinder;

/*
 * A method return a full file path in bundle for a specific file
 *
 * @param filename file's name
 */
-(NSString *)findPathForFileWithFileName:(NSString *)filenname;

@end
