//
//  ViewController.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 3/31/21.
//

import UIKit

class ViewController: UIViewController {
    var dfam = PatchBayView<DFAM>(patchBay: DFAM())
    var mother32 = PatchBayView<Mother32>(patchBay: Mother32())
    var subharmonicon = PatchBayView<Subharmonicon>(patchBay: Subharmonicon())
    let generator = PatchGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(dfam)
//        dfam.translatesAutoresizingMaskIntoConstraints = false
//        dfam.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        dfam.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        dfam.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        dfam.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

//        view.addSubview(mother32)
//        mother32.translatesAutoresizingMaskIntoConstraints = false
//        mother32.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        mother32.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        mother32.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        mother32.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//        view.addSubview(subharmonicon)
//        subharmonicon.translatesAutoresizingMaskIntoConstraints = false
//        subharmonicon.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        subharmonicon.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        subharmonicon.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        subharmonicon.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let patchBayLayout = UIStackView()
        patchBayLayout.axis = .horizontal
        patchBayLayout.spacing = 8
        patchBayLayout.alignment = .fill
        patchBayLayout.distribution = .fillEqually
        patchBayLayout.addArrangedSubview(dfam)
        patchBayLayout.addArrangedSubview(mother32)
        
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
        dfam.highlight(patch: patch)
        mother32.highlight(patch: patch)
        subharmonicon.highlight(patch: patch)
        print(patch)
    }
}
