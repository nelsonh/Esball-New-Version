//
//  SoundManager.m
//  ESBall
//
//  Created by Nelson on 1/22/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SoundManager.h"
#import "ObjectAL.h"

@interface SoundManager ()

-(void)initSoundManager;

@end

static SoundManager *soundManagerInstance;

@implementation SoundManager

#pragma mark - init
+(id)soundManager
{
    @synchronized(self)
    {
        if(soundManagerInstance == nil)
        {
            soundManagerInstance = [[SoundManager alloc] init];
            [soundManagerInstance initSoundManager];
            
            return soundManagerInstance;
        }
        else
        {
            return soundManagerInstance;
        }
    }
}

-(void)initSoundManager
{
    [OALSimpleAudio sharedInstance].allowIpod = NO;
    [OALSimpleAudio sharedInstance].honorSilentSwitch = YES;
}

#pragma mark - background music
-(BOOL)preloadBackgroundMusic:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    
    if(!path)
    {
        NSLog(@"can not found background music file with name: %@", fileName);
        isBgMusicLoaded = NO;
        return NO;
    }
    
    //preload background music
    if([[OALSimpleAudio sharedInstance] preloadBg:path])
    {
        isBgMusicLoaded = YES;
        return YES;
    }
    else
    {
        NSLog(@"audio engine preload background music fail");
        isBgMusicLoaded = NO;
        return NO;
    }
}

-(void)playBackgroundMusicWithLoop:(BOOL)yesOrNo
{
    //play bg music
    if(isBgMusicLoaded)
    {
        [[OALSimpleAudio sharedInstance] playBgWithLoop:yesOrNo];
    }
}

-(void)pauseBackgroundMusic
{
    if(isBgMusicLoaded)
    {
        [OALSimpleAudio sharedInstance].bgPaused = YES;
    }
}

-(void)resumeBackgroundMusic
{
    if(isBgMusicLoaded)
    {
        [OALSimpleAudio sharedInstance].bgPaused = NO;
    }
}

#pragma mark - sound effect
-(BOOL)preloadSoundEffectWithPlist:(NSString *)soundEffectPlistName
{
    //we will do localization later
    //NSString *lang = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    NSString *soundEffectPlistPath = soundEffectPlistName;
    
    //append path extension if needed
    if([[soundEffectPlistName pathExtension] isEqualToString:@""])
    {
        soundEffectPlistPath = [soundEffectPlistPath stringByAppendingString:@".plist"];
    }
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:soundEffectPlistPath ofType:nil];
    
    if(!plistPath)
    {
        NSLog(@"can not found sound effect plist file with name: %@", soundEffectPlistName);
        return NO;
    }
    
    keyValueSoundEffects = [NSDictionary dictionaryWithContentsOfFile:plistPath];

    NSArray *soundEffectFileNames = [keyValueSoundEffects allValues];

    for(NSString *fileName in soundEffectFileNames)
    {
        NSString *soundEffectFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        
        //can not find file
        if(!soundEffectFilePath)
        {
            NSLog(@"unable to preload sound effect file not found with name: %@", fileName);
            continue;
        }
        
        //preload sound effect file
        [[OALSimpleAudio sharedInstance] preloadEffect:soundEffectFilePath];
    }

    return YES;
}

-(void)playSoundEffectWithKey:(NSString *)soundEffectKey
{
    if(keyValueSoundEffects)
    {
        //get sound name
        NSString *soundToPlay = [keyValueSoundEffects objectForKey:soundEffectKey];
        
        //play sound effect
        [[OALSimpleAudio sharedInstance] playEffect:soundToPlay];
        
    }

}

-(void)stopAllSoundEffect
{
    [[OALSimpleAudio sharedInstance] stopAllEffects];
}

#pragma mark - clean resource
-(void)unloadAllSoundResources
{
    [[OALSimpleAudio sharedInstance] stopEverything];
    [[OALSimpleAudio sharedInstance] unloadAllEffects];
    
    keyValueSoundEffects = nil;
    isBgMusicLoaded = NO;
}

@end
