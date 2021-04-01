//
//  PatchBay.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 3/31/21.
//

import UIKit

protocol Patchable: Hashable {}
struct AnyPatchable: Patchable {
    var hash: AnyHashable
    
    init<T: Patchable>(_ patchable: T) {
        self.hash = AnyHashable(patchable)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hash)
    }
    
    static func == (lhs: AnyPatchable, rhs: AnyPatchable) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

enum PatchPointType: Int, Codable, Hashable {
    case output
    case input
}

protocol PatchBay: class, Codable, Hashable {
    associatedtype PatchPoints: PatchPoint
    var name: String { get }
    var colCount: Int { get }
    var rowCount: Int { get }
    init()
}

extension PatchBay {
        
    var patchPoints: [PatchPoints] {
        return PatchPoints.allCases as! [PatchPoints]
    }
    
    var view: PatchBayView<Self> {
        return PatchBayView<Self>(patchBay: self)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(patchPoints)
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

protocol PatchPoint: RawRepresentable, CaseIterable, Codable, Patchable {
    var type: PatchPointType { get }
    var name: String { get }
    var patchable: Bool { get }
}

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

final class Subharmonicon: PatchBay {
    typealias PatchPoints = PB
    var name: String = "SUBHARMONICON"
    var colCount: Int = 4
    var rowCount: Int = 8

    enum PB: Int, PatchPoint {
        case vco1
        case vco1Sub
        case vco1PWM
        case vcaOut
        case vco1Out
        case vco1Sub1Out
        case vco1Sub2Out
        case vca
        case vco2
        case vco2Sub
        case vco2PWM
        case vcaEGOut
        case vco2Out
        case vco2Sub1Out
        case vco2Sub2Out
        case cutoff
        case play
        case reset
        case trigger
        case vcfEG
        case rhythm1
        case rhythm2
        case rhythm3
        case rhythm4
        case seq1Out
        case seq1ClkOut
        case seq2Out
        case seq2ClkOut
        case midiIn
        case clock
        case clockOut
        case triggerOut

        var type: PatchPointType {
            switch self {
            case .vco1: return .input
            case .vco1Sub: return .input
            case .vco1PWM: return .input
            case .vcaOut: return .output
            case .vco1Out: return .output
            case .vco1Sub1Out: return .output
            case .vco1Sub2Out: return .output
            case .vca: return .input
            case .vco2: return .input
            case .vco2Sub: return .input
            case .vco2PWM: return .input
            case .vcaEGOut: return .output
            case .vco2Out: return .output
            case .vco2Sub1Out: return .output
            case .vco2Sub2Out: return .output
            case .cutoff: return .input
            case .play: return .input
            case .reset: return .input
            case .trigger: return .input
            case .vcfEG: return .input
            case .rhythm1: return .input
            case .rhythm2: return .input
            case .rhythm3: return .input
            case .rhythm4: return .input
            case .seq1Out: return .output
            case .seq1ClkOut: return .output
            case .seq2Out: return .output
            case .seq2ClkOut: return .output
            case .midiIn: return .input
            case .clock: return .input
            case .clockOut: return .output
            case .triggerOut: return .output
            }
        }

        var name: String {
            switch self {
            case .vco1: return "VCO 1"
            case .vco1Sub: return "VCO 1 SUB"
            case .vco1PWM: return "VCO 1 PWM"
            case .vcaOut: return "VCA"
            case .vco1Out: return "VCO 1"
            case .vco1Sub1Out: return "VCO 1 SUB 1"
            case .vco1Sub2Out: return "VCO 1 SUB 2"
            case .vca: return "VCA"
            case .vco2: return "VCO 2"
            case .vco2Sub: return "VCO 2 SUB"
            case .vco2PWM: return "VCO 2 PWM"
            case .vcaEGOut: return "VCA EG"
            case .vco2Out: return "VCO 2"
            case .vco2Sub1Out: return "VCO 2 SUB 1"
            case .vco2Sub2Out: return "VCO 2 SUB 2"
            case .cutoff: return "CUTOFF"
            case .play: return "PLAY"
            case .reset: return "RESET"
            case .trigger: return "TRIGGER"
            case .vcfEG: return "VCF EG"
            case .rhythm1: return "RHYTHM 1"
            case .rhythm2: return "RHYTHM 2"
            case .rhythm3: return "RHYTHM 3"
            case .rhythm4: return "RHYTHM 4"
            case .seq1Out: return "SEQ 1"
            case .seq1ClkOut: return "SEQ 1 CLK"
            case .seq2Out: return "SEQ 2"
            case .seq2ClkOut: return "SEQ 2 CLK"
            case .midiIn: return "MIDI IN"
            case .clock: return "CLOCK"
            case .clockOut: return "CLOCK"
            case .triggerOut: return "TRIGGER"
            }
        }

        var patchable: Bool {
            switch self {
            case .vco1: return true
            case .vco1Sub: return true
            case .vco1PWM: return true
            case .vcaOut: return true
            case .vco1Out: return true
            case .vco1Sub1Out: return true
            case .vco1Sub2Out: return true
            case .vca: return true
            case .vco2: return true
            case .vco2Sub: return true
            case .vco2PWM: return true
            case .vcaEGOut: return true
            case .vco2Out: return true
            case .vco2Sub1Out: return true
            case .vco2Sub2Out: return true
            case .cutoff: return true
            case .play: return false
            case .reset: return false
            case .trigger: return true
            case .vcfEG: return true
            case .rhythm1: return true
            case .rhythm2: return true
            case .rhythm3: return true
            case .rhythm4: return true
            case .seq1Out: return true
            case .seq1ClkOut: return true
            case .seq2Out: return true
            case .seq2ClkOut: return true
            case .midiIn: return false
            case .clock: return false
            case .clockOut: return false
            case .triggerOut: return true
            }
        }
    }
}
