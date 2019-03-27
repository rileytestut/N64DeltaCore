//
//  N64EmulatorBridge.h
//  N64DeltaCore
//
//  Created by Riley Testut on 3/27/19.
//  Copyright © 2019 Riley Testut. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <DeltaCore/DeltaCore.h>
#import <DeltaCore/DeltaCore-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface N64EmulatorBridge : NSObject <DLTAEmulatorBridging>

@property (class, nonatomic, readonly) N64EmulatorBridge *sharedBridge;

@end

NS_ASSUME_NONNULL_END
