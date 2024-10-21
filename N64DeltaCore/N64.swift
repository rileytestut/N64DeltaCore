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
    
    // C-Buttons
    case cUp = 8
    case cDown = 9
    case cLeft = 10
    case cRight = 11
    
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
    
    public var isContinuous: Bool {
        switch self
        {
        case .analogStickUp, .analogStickDown, .analogStickLeft, .analogStickRight: return true
        default: return false
        }
    }
}

public struct N64: DeltaCoreProtocol
{
    public static let core = N64()
    
    public var name: String { "Mupen64Plus" }
    public var identifier: String { "com.rileytestut.N64DeltaCore" }
    
    public var gameType: GameType { GameType.n64 }
    public var gameInputType: Input.Type { N64GameInput.self }
    public var gameSaveFileExtension: String { "sav" }
    
    public var audioFormat: AVAudioFormat { N64EmulatorBridge.shared.preferredAudioFormat }
    public var videoFormat: VideoFormat { VideoFormat(format: .openGLES3, dimensions: N64EmulatorBridge.shared.preferredVideoResolution) }
    
    public var supportedCheatFormats: Set<CheatFormat> {
        let gameSharkFormat = CheatFormat(name: NSLocalizedString("GameShark", comment: ""), format: "XXXXXXXX YYYY", type: .gameShark)
        return [gameSharkFormat]
    }
    
    public var emulatorBridge: EmulatorBridging { N64EmulatorBridge.shared }
    
    private init()
    {
    }
}

// Expose DeltaCore properties to Objective-C.
public extension N64EmulatorBridge
{
    @objc(n64Resources) class var __n64Resources: Bundle {
        return N64.core.resourceBundle
    }
    
    @objc(coreDirectoryURL) class var __coreDirectoryURL: URL {
        return _coreDirectoryURL
    }
}

private let _coreDirectoryURL = N64.core.directoryURL

