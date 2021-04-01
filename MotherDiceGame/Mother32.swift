//
//  Mother32.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 4/1/21.
//

import Foundation

final class Mother32: PatchBay {
    typealias PatchPoints = PB
    var name: String = "MOTHER 32"
    var colCount: Int = 4
    var rowCount: Int = 8

    enum PB: Int, PatchPoint {
        case extAudio
        case mixCV
        case vcaCV
        case vcaOut
        case noiseOut
        case vcfCutoff
        case vcfRes
        case vcfOut
        case vco1v
        case vcoFm
        case vcoSawOut
        case vcoSqOut
        case vcoMod
        case lfoRate
        case lfoTriOut
        case lfoSqOut
        case mix1
        case mix2
        case vcMix
        case vcMixOut
        case mult
        case mult1Out
        case mult2Out
        case assignOut
        case gate
        case egOut
        case kbOut
        case gateOut
        case tempo
        case runStop
        case reset
        case hold


        var type: PatchPointType {
            switch self {
            case .extAudio: return .input
            case .mixCV: return .input
            case .vcaCV: return .input
            case .vcaOut: return .output
            case .noiseOut: return .output
            case .vcfCutoff: return .input
            case .vcfRes: return .input
            case .vcfOut: return .output
            case .vco1v: return .input
            case .vcoFm: return .input
            case .vcoSawOut: return .output
            case .vcoSqOut: return .output
            case .vcoMod: return .input
            case .lfoRate: return .input
            case .lfoTriOut: return .output
            case .lfoSqOut: return .output
            case .mix1: return .input
            case .mix2: return .input
            case .vcMix: return .input
            case .vcMixOut: return .output
            case .mult: return .input
            case .mult1Out: return .output
            case .mult2Out: return .output
            case .assignOut: return .output
            case .gate: return .input
            case .egOut: return .output
            case .kbOut: return .output
            case .gateOut: return .output
            case .tempo: return .input
            case .runStop: return .input
            case .reset: return .input
            case .hold: return .input
            }
        }

        var name: String {
            switch self {
            case .extAudio: return "EXT AUDIO"
            case .mixCV: return "MIX CV"
            case .vcaCV: return "VCA CV"
            case .vcaOut: return "VCA"
            case .noiseOut: return "NOISE"
            case .vcfCutoff: return "VCF CUTOFF"
            case .vcfRes: return "VCF RES"
            case .vcfOut: return "VCF"
            case .vco1v: return "VCO 1V/OCT"
            case .vcoFm: return "VCO LIN FM"
            case .vcoSawOut: return "VCO SAW"
            case .vcoSqOut: return "VCO PULSE"
            case .vcoMod: return "VCO MOD"
            case .lfoRate: return "LFO RATE"
            case .lfoTriOut: return "LFO TRI"
            case .lfoSqOut: return "LFO SQ"
            case .mix1: return "MIX 1"
            case .mix2: return "MIX 2"
            case .vcMix: return "VC MIX CTRL"
            case .vcMixOut: return "VC MIX"
            case .mult: return "MULT"
            case .mult1Out: return "MULT 1"
            case .mult2Out: return "MULT 2"
            case .assignOut: return "ASSIGN"
            case .gate: return "GATE"
            case .egOut: return "EG"
            case .kbOut: return "KB"
            case .gateOut: return "GATE"
            case .tempo: return "TEMPO"
            case .runStop: return "RUN/STOP"
            case .reset: return "RESET"
            case .hold: return "HOLD"
            }
        }

        var patchable: Bool {
            switch self {
            case .extAudio: return false
            case .mixCV: return true
            case .vcaCV: return true
            case .vcaOut: return true
            case .noiseOut: return true
            case .vcfCutoff: return true
            case .vcfRes: return true
            case .vcfOut: return true
            case .vco1v: return true
            case .vcoFm: return true
            case .vcoSawOut: return true
            case .vcoSqOut: return true
            case .vcoMod: return true
            case .lfoRate: return true
            case .lfoTriOut: return true
            case .lfoSqOut: return true
            case .mix1: return false
            case .mix2: return false
            case .vcMix: return false
            case .vcMixOut: return false
            case .mult: return false
            case .mult1Out: return false
            case .mult2Out: return false
            case .assignOut: return false
            case .gate: return true
            case .egOut: return true
            case .kbOut: return true
            case .gateOut: return true
            case .tempo: return false
            case .runStop: return false
            case .reset: return false
            case .hold: return false
            }
        }
    }
}
