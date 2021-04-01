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

        let dfam = DFAM()
        let dfamView = dfam.patchBayView()
        view.addSubview(dfamView)
        dfamView.translatesAutoresizingMaskIntoConstraints = false
        dfamView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dfamView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dfamView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        dfamView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        let mother32 = Mother32()
//        let mother32View = mother32.patchBayView()
//        view.addSubview(mother32View)
//        mother32View.translatesAutoresizingMaskIntoConstraints = false
//        mother32View.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        mother32View.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        mother32View.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        mother32View.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//        let subharmonicon = Subharmonicon()
//        let subharmoniconView = subharmonicon.patchBayView()
//        view.addSubview(subharmoniconView)
//        subharmoniconView.translatesAutoresizingMaskIntoConstraints = false
//        subharmoniconView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        subharmoniconView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        subharmoniconView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
//        subharmoniconView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
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
//        layout.addArrangedSubview(dfamView)
//        layout.addArrangedSubview(mother32View)
    }
}
