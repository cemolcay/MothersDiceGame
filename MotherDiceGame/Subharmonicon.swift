//
//  Subharmonicon.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 4/1/21.
//

import Foundation

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
