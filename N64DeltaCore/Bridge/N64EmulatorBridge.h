//
//  N64EmulatorBridge.h
//  N64DeltaCore
//
//  Created by Riley Testut on 3/27/19.
//  Copyright © 2019 Riley Testut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol DLTAEmulatorBridging;

NS_ASSUME_NONNULL_BEGIN

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Weverything" // Silence "Cannot find protocol definition" warning due to forward declaration.
__attribute__((visibility("default")))
@interface N64EmulatorBridge : NSObject <DLTAEmulatorBridging>
#pragma clang diagnostic pop

@property (class, nonatomic, readonly) N64EmulatorBridge *sharedBridge;

@property (nonatomic, readonly) AVAudioFormat *preferredAudioFormat;

@property (copy, nonatomic, nullable) NSURL *coreDirectoryURL;
@property (strong, nonatomic, nullable) NSBundle *coreResourcesBundle;

@end

NS_ASSUME_NONNULL_END
