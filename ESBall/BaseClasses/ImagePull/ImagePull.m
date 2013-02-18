//
//  ImagePull.m
//  ESBall
//
//  Created by Nelson on 12/7/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "ImagePull.h"

@interface ImagePull ()

-(NSString *)nsdataToHex:(NSData *)data;

@end

@implementation ImagePull

@synthesize theDelegate = _theDelegate;

-(void)dealloc
{
    [imageConnection cancel];
    imageConnection = nil;
    imageData = nil;
}

#pragma mark - public interface
-(void)pullImageFrom:(NSURL *)url
{
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:url];
    [imageRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    imageConnection = [NSURLConnection connectionWithRequest:imageRequest delegate:self];
    
    if(!imageConnection)
    {
        NSLog(@"URL connection to video image can not be created");
        
        if([_theDelegate respondsToSelector:@selector(ImagePullDelegateFail:)])
        {
            [_theDelegate ImagePullDelegateFail:self];
        }
    }
}

-(void)cancel
{
    [imageConnection cancel];
}

#pragma mark - internal
-(NSString *)nsdataToHex:(NSData *)data
{
    const unsigned char *dbytes = [data bytes];
    NSMutableString *hexStr = [[NSMutableString alloc] init];
    
    for(int i = 0; i < [data length]; i ++)
    {
        [hexStr appendFormat:@"%02x", dbytes[i]];
    }
    
    return hexStr;
}

-(BOOL)isValidJPEG:(NSData *)inImageData
{
    if(inImageData)
    {
        NSUInteger loc = inImageData.length-3;
        NSUInteger len = 2;
        
        if(inImageData.length < (loc+len))
            return NO;
        
        NSData *data = [inImageData subdataWithRange:NSMakeRange(inImageData.length-2, 2)];
        NSString *hexByte = [self nsdataToHex:data];
        
        if([hexByte isEqualToString:@"ffd9"])
            return YES;
        else
            return NO;
    }
    else
    {
        return NO;
    }
}

#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    /**
     a new connection to image has established
     **/
    imageData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [imageData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [connection cancel];
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        //NSLog(@"image data:%i", imageData.length);
        //NSLog(@"image data:%@", imageData);
        if([self isValidJPEG:imageData])
        {
            UIImage *videoImage = [[UIImage alloc] initWithData:imageData];
            imageData = nil;
            
            //double check
            if(!videoImage)
            {
                //NSLog(@"Image pull fail");
                //image is not ready
                if([_theDelegate respondsToSelector:@selector(ImagePullDelegateFail:)])
                {
                    [_theDelegate ImagePullDelegateFail:self];
                }
                
                imageData = nil;
            }
            
            if([_theDelegate respondsToSelector:@selector(ImagePullDelegate:pullImageComplete:)])
            {
                [_theDelegate ImagePullDelegate:self pullImageComplete:videoImage];
            }
        }
        else
        {
            //NSLog(@"Image pull fail");
            
            if([_theDelegate respondsToSelector:@selector(ImagePullDelegateFail:)])
            {
                [_theDelegate ImagePullDelegateFail:self];
            }
        }
    
    });

}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [connection cancel];
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        NSLog(@"connection has an error:%@", error);
        
        if([_theDelegate respondsToSelector:@selector(ImagePullDelegateFail:)])
        {
            [_theDelegate ImagePullDelegateFail:self];
        }
        
        imageData = nil;
    
    });

}

@end
