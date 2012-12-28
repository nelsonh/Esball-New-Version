//
//  FileFinder.m
//  ESBall
//
//  Created by Nelson on 12/12/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "FileFinder.h"

static FileFinder *fileFinderInstance;

@implementation FileFinder

+(id)fileFinder
{
    @synchronized(self)
    {
        if(fileFinderInstance == nil)
        {
            fileFinderInstance = [[FileFinder alloc] init];
            return fileFinderInstance;
        }
        else
        {
            return fileFinderInstance;
        }
    }
}

-(NSString *)findPathForFileWithFileName:(NSString *)filenname
{
    return [[NSBundle mainBundle] pathForResource:filenname ofType:nil];

}

@end
