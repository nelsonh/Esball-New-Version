//
//  FileFinder.h
//  ESBall
//
//  Created by Nelson on 12/12/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * FileFinder subclass of NSObject
 * find path to specific resource
 */
@interface FileFinder : NSObject

/**
 * A method return FileFinder instance, FileFinder instance can be only one in app
 * FileFinder is a singleton
 * 
 * 建立 FileFinder 實體, 實體只有一份
 */
+(id)fileFinder;

/**
 * A method return a full file path in bundle for a specific file
 *
 * 回傳特定檔案的路徑
 *
 * @param filename file's name
 */
-(NSString *)findPathForFileWithFileName:(NSString *)filenname;

@end
