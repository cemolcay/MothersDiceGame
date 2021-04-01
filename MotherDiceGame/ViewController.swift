//
//  ViewController.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 3/31/21.
//

import UIKit

class ViewController: UIViewController {
    let generator = PatchGenerator()
    let mother32 = Mother32()
    var mother32View: PatchBayView<Mother32>!
    let dfam = DFAM()
    var dfamView: PatchBayView<DFAM>!
    let subharmonicon = Subharmonicon()
    var subharmoniconView: PatchBayView<Subharmonicon>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dfamView = dfam.view
//        view.addSubview(dfamView)
//        dfamView.translatesAutoresizingMaskIntoConstraints = false
//        dfamView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        dfamView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        dfamView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        dfamView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        mother32View = mother32.view
//        view.addSubview(mother32View)
//        mother32View.translatesAutoresizingMaskIntoConstraints = false
//        mother32View.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        mother32View.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        mother32View.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        mother32View.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        subharmoniconView = subharmonicon.view
//        view.addSubview(subharmoniconView)
//        subharmoniconView.translatesAutoresizingMaskIntoConstraints = false
//        subharmoniconView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        subharmoniconView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        subharmoniconView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        subharmoniconView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let patchBayLayout = UIStackView()
        patchBayLayout.axis = .horizontal
        patchBayLayout.spacing = 8
        patchBayLayout.alignment = .fill
        patchBayLayout.distribution = .fillEqually
        patchBayLayout.addArrangedSubview(dfamView)
        patchBayLayout.addArrangedSubview(mother32View)
        
        let generateButton = UIButton(type: .system)
        generateButton.setTitle("Generate Patch", for: .normal)
        generateButton.addTarget(self, action: #selector(generatePatchButtonPressed(sender:)), for: .touchUpInside)
        
        let layout = UIStackView()
        view.addSubview(layout)
        layout.axis = .vertical
        layout.translatesAutoresizingMaskIntoConstraints = false
        layout.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        layout.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        layout.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        layout.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        layout.addArrangedSubview(patchBayLayout)
        layout.addArrangedSubview(generateButton)
        
        generator.addRule(fromPatchBay: dfam, toPatchBay: dfam)
        generator.addRule(fromPatchBay: dfam, toPatchBay: mother32)
        generator.addRule(fromPatchBay: mother32, toPatchBay: dfam)
        generator.addRule(fromPatchBay: mother32, toPatchBay: mother32)
    }
    
    @IBAction func generatePatchButtonPressed(sender: UIButton) {
        guard let patch = generator.generatePatch() else { return }
        dfamView.unhighlight()
        dfamView.highlight(patchPoint: patch.from)
        dfamView.highlight(patchPoint: patch.to)
        mother32View.unhighlight()
        mother32View.highlight(patchPoint: patch.from)
        mother32View.highlight(patchPoint: patch.to)
        subharmoniconView.unhighlight()
        subharmoniconView.highlight(patchPoint: patch.from)
        subharmoniconView.highlight(patchPoint: patch.to)
        print(patch)
    }
}
