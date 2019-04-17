//
//  N64EmulatorBridge.h
//  N64DeltaCore
//
//  Created by Riley Testut on 3/27/19.
//  Copyright © 2019 Riley Testut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#import <DeltaCore/DeltaCore-Swift.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((visibility("default")))
@interface N64EmulatorBridge : NSObject <DLTAEmulatorBridging>
{
}

@property (class, nonatomic, readonly) N64EmulatorBridge *sharedBridge;

@property (nonatomic, readonly) AVAudioFormat *preferredAudioFormat;
@property (nonatomic, readonly) CGSize preferredVideoDimensions;

@end

NS_ASSUME_NONNULL_END
