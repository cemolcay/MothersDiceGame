//
//  PatchGenerator.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 4/1/21.
//

import Foundation

struct Patch {
    var from: AnyPatchable
    var to: AnyPatchable
}

class PatchGenerator {
    var inputPoints: [AnyPatchable] = []
    var outputPoints: [AnyPatchable] = []
    
    func addRule<T: PatchBay, U: PatchBay>(fromPatchBay: T, toPatchBay: U) {
        let from = fromPatchBay.patchPoints
            .filter({ $0.patchable })
            .filter({ $0.type == .input })
            .map({ AnyPatchable($0) })
        let to = toPatchBay.patchPoints
            .filter({ $0.patchable })
            .filter({ $0.type == .output })
            .map({ AnyPatchable($0) })
        inputPoints.append(contentsOf: from)
        outputPoints.append(contentsOf: to)
        inputPoints = Array<AnyPatchable>(Set(inputPoints))
        outputPoints = Array<AnyPatchable>(Set(outputPoints))
    }
    
    func generatePatch() -> Patch? {
        guard let input = inputPoints.randomElement(),
              let output = outputPoints.randomElement()
        else { return nil }
        return Patch(
            from: input,
            to: output)
    }
}
