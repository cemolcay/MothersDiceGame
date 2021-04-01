# Mother's Dice Game

Random patch generator inspired by the [Moog Sound Studio](https://www.moogmusic.com/news/moog-music-introduces-complete-synthesizer-studio-experience) kit's dice game.

## PatchBayView

Includes DFAM, Mother-32 and Subharmonicon patch bays as custom `UIView` instances.  

You can create as many `PatchBay` instances with `PatchBayView`s as you want and apply auto-layout on them or embed them in stack views.

``` swift
let dfam = PatchBayView<DFAM>(patchBay: DFAM())
let mother32 = PatchBayView<Mother32>(patchBay: Mother32())
let subharmonicon = PatchBayView<Subharmonicon>(patchBay: Subharmonicon())
```

## PatchBay

You can use this protocol and create other synths. 

- Create a final class conforming `PatchBay`,
- Implement `PatchBay` protocol values.
- Create the patch points inside an enum conforming `PatchPoint`,
- Add the patch points as cases.
- Implement `PatchPoint` protocol values.

``` swift
final class CustomSynth: PatchBay {
    typealias PatchPoints = PB
    var name: String = "My Custom Synth"
    var colCount: Int = 2
    var rowCount: Int = 1

    enum PB: Int, PatchPoint {
        case vco
        case vcoOut
        
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
}
```

## Patch Generator

- Create an instance of `PatchGenerator`.
- Add rule set for allowed patch point connections.
- Call `generatePatch()` function on the patch generator.
- It returns a `Patch` struct which includes the input and output `PatchPoint`s in `Patchable` format.
- You can use the `highlight(patch: Patch)` function on `PatchBayView`s for highlighting the patch points.

```swift
let generator = PatchGenerator()

generator.addRule(fromPatchBay: dfam, toPatchBay: dfam)
generator.addRule(fromPatchBay: dfam, toPatchBay: mother32)
generator.addRule(fromPatchBay: mother32, toPatchBay: dfam)
generator.addRule(fromPatchBay: mother32, toPatchBay: mother32)

let patch = generator.generatePatch()
dfam.highlight(patch: patch)
mother32.highlight(patch: patch)
```

![alt](https://github.com/cemolcay/MothersDiceGame/raw/main/pb.gif)

## DFAM

![alt](https://raw.githubusercontent.com/cemolcay/MothersDiceGame/master/pb-dfam.png)

## Mother-32

![alt](https://raw.githubusercontent.com/cemolcay/MothersDiceGame/master/pb-m32.png)

## Subharmonicon

![alt](https://raw.githubusercontent.com/cemolcay/MothersDiceGame/master/pb-subh.png)
