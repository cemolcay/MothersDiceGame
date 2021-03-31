# Mother's Dice Game

Random patch generator inspired by the [Moog Sound Studio](https://www.moogmusic.com/news/moog-music-introduces-complete-synthesizer-studio-experience) kit's dice game.

## PatchBayView

Includes DFAM, Mother-32 and Subharmonicon patch bays as custom `UIView` instances.

You can create as many `PatchBay` instances with `PatchBayView`s as you want and apply auto-layout on them or embed them in stack views.

``` swift
let dfam = PatchBayView<DFAM>(frame: .zero)
let mother32 = PatchBayView<Mother32>(frame: .zero)
let subharmonicon = PatchBayView<Subharmonicon>(frame: .zero)
```

## PatchBay

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
	static let colCount: Int = 2
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
	    case .vco: return "VCO CV"
	    case .vcoOut: return "VCO OUT"
	    }
	}
    
	var patchable: Bool {
	    switch self {
	    case .vco: return true
	    case .vcoOut: return true
	    }
	}
}
```

## DFAM

![alt](https://raw.githubusercontent.com/cemolcay/MothersDiceGame/master/pb-dfam.png)

## Mother-32

![alt](https://raw.githubusercontent.com/cemolcay/MothersDiceGame/master/pb-m32.png)

## Subharmonicon

![alt](https://raw.githubusercontent.com/cemolcay/MothersDiceGame/master/pb-subh.png)