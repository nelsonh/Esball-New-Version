//
//  SoundManager.h
//  ESBall
//
//  Created by Nelson on 1/22/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * SoundManager subclass of NSObject
 * manage all sounds in game
 */
@interface SoundManager : NSObject{
    
    //indicate background music is loaded or not
    BOOL isBgMusicLoaded;
    
    //hold sound effects list (sound effect that define in plist file)
    NSDictionary *keyValueSoundEffects;
}

/**
 * A method retun SoundManager instance, FoundManager instance can be only one in app
 * SoundManager is a singleton
 *
 * 建立一個 SoundManager 實體, 實體只有一份
 */
+(id)soundManager;

/**
 * A method to preload background music
 *
 * 預先載入背景音樂
 *
 * @param fileName background music file name
 */
-(BOOL)preloadBackgroundMusic:(NSString *)fileName;

/**
 * A method to play background music
 *
 * 播放背景音樂
 *
 * @param yesOrNo should background music loop
 */
-(void)playBackgroundMusicWithLoop:(BOOL)yesOrNo;

/**
 * A method to pause background music
 *
 * 暫停背景音樂
 */
-(void)pauseBackgroundMusic;

/**
 * A method to resume background music
 *
 * 回復背景音樂
 */
-(void)resumeBackgroundMusic;

/**
 * A method to preload sound effect
 *
 * 預先載入聲音
 *
 * @param soundEffectPlistName pilst file name of sound effect list
 * @return yes preload success otherwise no
 */
-(BOOL)preloadSoundEffectWithPlist:(NSString *)soundEffectPlistName;

/**
 * A method to play sound effect(look in plist file)
 *
 * 播放特定聲音, 聲音必須預先定義
 *
 * @param soundEffectKey each key point to a specific sound effect
 */
-(void)playSoundEffectWithKey:(NSString *)soundEffectKey;

/**
 * A method to stop all sound effects;
 *
 * 停止所有聲音
 */
-(void)stopAllSoundEffect;

/**
 * A method to unload all preloaded sound
 *
 * 釋放所有聲音資源
 */
-(void)unloadAllSoundResources;

@end
