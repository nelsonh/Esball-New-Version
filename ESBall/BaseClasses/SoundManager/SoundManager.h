//
//  SoundManager.h
//  ESBall
//
//  Created by Nelson on 1/22/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundManager : NSObject{
    
    BOOL isBgMusicLoaded;
    NSDictionary *keyValueSoundEffects;
}

//init
+(id)soundManager;

//bg music
-(BOOL)preloadBackgroundMusic:(NSString *)fileName;
-(void)playBackgroundMusicWithLoop:(BOOL)yesOrNo;
-(void)pauseBackgroundMusic;
-(void)resumeBackgroundMusic;

//sound effect
-(BOOL)preloadSoundEffectWithPlist:(NSString *)soundEffectPlistName;
-(void)playSoundEffectWithKey:(NSString *)soundEffectKey;
-(void)stopAllSoundEffect;

//unload
-(void)unloadAllSoundResources;

@end
