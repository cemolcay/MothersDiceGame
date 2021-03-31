//
//  ViewController.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 3/31/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let dfam = PatchBayView<DFAM>(frame: .zero)
        view.addSubview(dfam)
        dfam.translatesAutoresizingMaskIntoConstraints = false
        dfam.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dfam.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dfam.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        dfam.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        let mother32 = PatchBayView<Mother32>(frame: .zero)
//        view.addSubview(mother32)
//        mother32.translatesAutoresizingMaskIntoConstraints = false
//        mother32.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        mother32.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        mother32.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        mother32.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//        let subharmonicon = PatchBayView<Subharmonicon>(frame: .zero)
//        view.addSubview(subharmonicon)
//        subharmonicon.translatesAutoresizingMaskIntoConstraints = false
//        subharmonicon.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        subharmonicon.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        subharmonicon.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        subharmonicon.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//        let layout = UIStackView()
//        view.addSubview(layout)
//        layout.translatesAutoresizingMaskIntoConstraints = false
//        layout.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        layout.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        layout.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        layout.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        layout.axis = .horizontal
//        layout.spacing = 8
//        layout.alignment = .fill
//        layout.distribution = .fillEqually
//        layout.addArrangedSubview(dfam)
//        layout.addArrangedSubview(mother32)
    }
}
