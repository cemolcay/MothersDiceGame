# Mother's Dice Game
====

Random patch generator inspired by the [Moog Sound Studio](https://www.moogmusic.com/news/moog-music-introduces-complete-synthesizer-studio-experience) kit's dice game.

## PatchBayView

Includes DFAM, Mother-32 and Subharmonicon patch bays as custom `UIView` instances.

You can create as many instances as you want and use auto-layout on them or embed them in stack views.

``` swift
let dfam = PatchBayView<DFAM>(frame: .zero)
let mother32 = PatchBayView<Mother32>(frame: .zero)
let subharmonicon = PatchBayView<Subharmonicon>(frame: .zero)
```

## PatchPoint

You can use this protocol and create other synths. 

- Create an enum with `Int` rawValue,
- Conform to `PatchPoint` protocol
- Add the patch points as cases.
- Implement `PatchPoint` set protocol values.

``` swift
enum CustomSynth: Int, PatchPoint {
	case vco
	case vcoOut

	static var `default`: CustomSynth = .vco
    static let colCount: Int = 1
    static let rowCount: Int = 1
    static var synthName: String = "My Custom Synth"
    
    var type: PatchType {
        switch self {
        case .vco: return .input
        case .vcoOut: return .output
        }
    }
    
    var name: String {
        switch self {
        case .vco1: return "VCO CV"
        case .vco1Sub: return "VCO OUT"
        }
    }
    
    var patchable: Bool {
        switch self {
        case .vco1: return true
        case .vco1Sub: return true
        }
    }
}
```

## DFAM

![alt](https://raw.githubusercontent.com/cemolcay/MotherDiceGame/master/pg-dfam.png)

## Mother-32

![alt](https://raw.githubusercontent.com/cemolcay/MotherDiceGame/master/pg-m32.png)

## Subharmonicon

![alt](https://raw.githubusercontent.com/cemolcay/MotherDiceGame/master/pg-subh.png)