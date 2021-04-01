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
