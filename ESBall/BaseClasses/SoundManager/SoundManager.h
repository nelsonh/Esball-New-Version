//
//  SoundManager.h
//  ESBall
//
//  Created by Nelson on 1/22/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundManager : NSObject{
    
    //indicate background music is loaded or not
    BOOL isBgMusicLoaded;
    
    //hold sound effects list (sound effect that define in plist file)
    NSDictionary *keyValueSoundEffects;
}

/**
 * A method retun SoundManager instance, FoundManager instance can be only one in app
 * SoundManager is a singleton
 */
+(id)soundManager;

/**
 * A method to preload background music
 *
 * @param fileName background music file name
 */
-(BOOL)preloadBackgroundMusic:(NSString *)fileName;

/**
 * A method to play background music
 *
 * @param yesOrNo should background music loop
 */
-(void)playBackgroundMusicWithLoop:(BOOL)yesOrNo;

/**
 * A method to pause background music
 */
-(void)pauseBackgroundMusic;

/**
 * A method to resume background music
 */
-(void)resumeBackgroundMusic;

/**
 * A method to preload sound effect
 *
 * @param soundEffectPlistName pilst file name of sound effect list
 * @return yes preload success otherwise no
 */
-(BOOL)preloadSoundEffectWithPlist:(NSString *)soundEffectPlistName;

/**
 * A method to play sound effect(look in plist file)
 *
 * @param soundEffectKey each key point to a specific sound effect
 */
-(void)playSoundEffectWithKey:(NSString *)soundEffectKey;

/**
 * A method to stop all sound effects;
 */
-(void)stopAllSoundEffect;

/**
 * A method to unload all preloaded sound 
 */
-(void)unloadAllSoundResources;

@end
