//
//  DFAM.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 4/1/21.
//

import Foundation

final class DFAM: PatchBay {
    typealias PatchPoints = PB
    var name: String = "DFAM"
    var colCount: Int = 3
    var rowCount: Int = 8

    enum PB: Int, PatchPoint {
        case trigger
        case vcaCV
        case vcaOut
        case velocity
        case vcaDecay
        case vcaEGOut
        case extAudio
        case vcfDecay
        case vcfEGOut
        case noiseLevel
        case vcoDecay
        case vcoEGOut
        case vcfMod
        case vco1
        case vco1Out
        case fmAmt
        case vco2
        case vco2Out
        case tempo
        case runStop
        case advClock
        case triggerOut
        case velocityOut
        case pitchOut

        var type: PatchPointType {
            switch self {
            case .trigger: return .input
            case .vcaCV: return .input
            case .vcaOut: return .output
            case .velocity: return .input
            case .vcaDecay: return .input
            case .vcaEGOut: return .output
            case .extAudio: return .input
            case .vcfDecay: return .input
            case .vcfEGOut: return .output
            case .noiseLevel: return .input
            case .vcoDecay: return .input
            case .vcoEGOut: return .output
            case .vcfMod: return .input
            case .vco1: return .input
            case .vco1Out: return .output
            case .fmAmt: return .input
            case .vco2: return .input
            case .vco2Out: return .output
            case .tempo: return .input
            case .runStop: return .input
            case .advClock: return .input
            case .triggerOut: return .output
            case .velocityOut: return .output
            case .pitchOut: return .output
            }
        }

        var name: String {
            switch self {
            case .trigger: return "TRIGGER"
            case .vcaCV: return "VCA CV"
            case .vcaOut: return "VCA"
            case .velocity: return "VELOCITY"
            case .vcaDecay: return "VCA DECAY"
            case .vcaEGOut: return "VCA EG"
            case .extAudio: return "EXT AUDIO"
            case .vcfDecay: return "VCF DECAY"
            case .vcfEGOut: return "VCF EG"
            case .noiseLevel: return "NOISE"
            case .vcoDecay: return "VCO DECAY"
            case .vcoEGOut: return "VCO EG"
            case .vcfMod: return "VCF MOD"
            case .vco1: return "VCO 1 CV"
            case .vco1Out: return "VCO 1"
            case .fmAmt: return "1-2 FM AMT"
            case .vco2: return "VCO 2 CV"
            case .vco2Out: return "VCO 2"
            case .tempo: return "TEMPO"
            case .runStop: return "RUN/STOP"
            case .advClock: return "ADV/CLOCK"
            case .triggerOut: return "TRIGGER"
            case .velocityOut: return "VELOCITY"
            case .pitchOut: return "PITCH"
            }
        }

        var patchable: Bool {
            switch self {
            case .trigger: return true
            case .vcaCV: return true
            case .vcaOut: return true
            case .velocity: return true
            case .vcaDecay: return true
            case .vcaEGOut: return true
            case .extAudio: return false
            case .vcfDecay: return true
            case .vcfEGOut: return true
            case .noiseLevel: return true
            case .vcoDecay: return true
            case .vcoEGOut: return true
            case .vcfMod: return true
            case .vco1: return true
            case .vco1Out: return true
            case .fmAmt: return true
            case .vco2: return true
            case .vco2Out: return true
            case .tempo: return true
            case .runStop: return false
            case .advClock: return false
            case .triggerOut: return true
            case .velocityOut: return true
            case .pitchOut: return true
            }
        }
    }
}
