//
//  N64EmulatorBridge.m
//  N64DeltaCore
//
//  Created by Riley Testut on 3/27/19.
//  Copyright © 2019 Riley Testut. All rights reserved.
//

#import "N64EmulatorBridge.h"

@interface N64EmulatorBridge ()

@property (nonatomic, copy, nullable, readwrite) NSURL *gameURL;

@end

@implementation N64EmulatorBridge
@synthesize audioRenderer = _audioRenderer;
@synthesize videoRenderer = _videoRenderer;
@synthesize saveUpdateHandler = _saveUpdateHandler;

+ (instancetype)sharedBridge
{
    static N64EmulatorBridge *_emulatorBridge = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _emulatorBridge = [[self alloc] init];
    });
    
    return _emulatorBridge;
}

#pragma mark - Emulation State -

- (void)startWithGameURL:(NSURL *)gameURL
{
}

- (void)stop
{
}

- (void)pause
{
    
}

- (void)resume
{
    
}

#pragma mark - Game Loop -

- (void)runFrame
{
}

#pragma mark - Inputs -

- (void)activateInput:(NSInteger)input
{
    
}

- (void)deactivateInput:(NSInteger)input
{
    
}

- (void)resetInputs
{
    
}

#pragma mark - Save States -

- (void)saveSaveStateToURL:(NSURL *)url
{
    
}

- (void)loadSaveStateFromURL:(NSURL *)url
{
    
}

#pragma mark - Game Saves -

- (void)saveGameSaveToURL:(NSURL *)url
{
    
}

- (void)loadGameSaveFromURL:(NSURL *)url
{
    
}

#pragma mark - Cheats -

- (BOOL)addCheatCode:(NSString *)cheatCode type:(NSString *)type
{
    return YES;
}

- (void)resetCheats
{
    
}

- (void)updateCheats
{
    
}

#pragma mark - Getters/Setters -

- (NSTimeInterval)frameDuration
{
    return (1.0 / 60.0);
}

@end

