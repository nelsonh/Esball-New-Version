//
//  ImagePull.h
//  ESBall
//
//  Created by Nelson on 12/7/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImagePull;

@protocol ImagePullDelegate <NSObject>

@optional

-(void)ImagePullDelegate:(ImagePull *)imagePull pullImageComplete:(UIImage *)image;
-(void)ImagePullDelegateFail:(ImagePull *)imagePull;

@end

@interface ImagePull : NSObject<NSURLConnectionDataDelegate>{
    
    NSURLConnection *imageConnection;
    NSMutableData *imageData;
}

@property (nonatomic, weak) id<ImagePullDelegate> theDelegate;

-(void)pullImageFrom:(NSURL *)url;
-(void)cancel;

@end
