//
//  ImagePull.h
//  ESBall
//
//  Created by Nelson on 12/7/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImagePull;

/**
 * A protocol of ImagePull
 */
@protocol ImagePullDelegate <NSObject>

@optional

/**
 * Fire when image download complete
 */
-(void)ImagePullDelegate:(ImagePull *)imagePull pullImageComplete:(UIImage *)image;

/**
 * Fire when image download fail
 */
-(void)ImagePullDelegateFail:(ImagePull *)imagePull;

@end

@interface ImagePull : NSObject<NSURLConnectionDataDelegate>{
    
    //connection to image
    NSURLConnection *imageConnection;
    
    //image data
    NSMutableData *imageData;
}

@property (nonatomic, weak) id<ImagePullDelegate> theDelegate;//delegate

/**
 * A method start pulling image from url
 *
 * @param url the url to image
 */
-(void)pullImageFrom:(NSURL *)url;

/**
 * A method to cancel during downloading image
 */
-(void)cancel;

/**
 * A method to turn NSData into string of hex
 *
 * @param data the data of image 
 * @return string in hex
 */
-(NSString *)nsdataToHex:(NSData *)data;

/**
 * A method to check JPEG image is valid
 *
 * @param inImageData NSData of image
 * @return yes JPEG is vaild otherwise no
 */
-(BOOL)isValidJPEG:(NSData *)inImageData;

@end
