//
//  N64.swift
//  N64DeltaCore
//
//  Created by Riley Testut on 3/27/19.
//  Copyright © 2019 Riley Testut. All rights reserved.
//

import Foundation
import AVFoundation

import DeltaCore

public extension GameType
{
    static let n64 = GameType("com.rileytestut.delta.game.n64")
}

@objc public enum N64GameInput: Int, Input
{
    // D-Pad
    case up = 0
    case down = 1
    case left = 2
    case right = 3
    
    // Analog-Stick
    case analogStickUp = 4
    case analogStickDown = 5
    case analogStickLeft = 6
    case analogStickRight = 7
    
    // C-Stick
    case cStickUp = 8
    case cStickDown = 9
    case cStickLeft = 10
    case cStickRight = 11
    
    // Other
    case a = 12
    case b = 13
    case l = 14
    case r = 15
    case z = 16
    case start = 17
    
    public var type: InputType {
        return .game(.n64)
    }
}

public struct N64: DeltaCoreProtocol
{
    public static let core = N64()
    
    public let gameType = GameType.n64
    
    public let gameInputType: Input.Type = N64GameInput.self
    
    public let gameSaveFileExtension = "sav"
    
    public let audioFormat = AVAudioFormat(commonFormat: .pcmFormatInt16, sampleRate: 33600, channels: 2, interleaved: true)!
    
    public let videoFormat = VideoFormat(pixelFormat: .bgra8, dimensions: CGSize(width: 320, height: 240))
    
    public let supportedCheatFormats: Set<CheatFormat> = {
        let gameSharkFormat = CheatFormat(name: NSLocalizedString("GameShark", comment: ""), format: "XXXXXXXX YYYY", type: .gameShark)
        return [gameSharkFormat]
    }()
    
    public let emulatorBridge: EmulatorBridging = N64EmulatorBridge.shared
    
    private init()
    {
    }
}

