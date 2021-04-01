//
//  PatchBayView.swift
//  MotherDiceGame
//
//  Created by Cem Olcay on 3/31/21.
//

import UIKit

class PatchView: UIView {
    var lineWidth: CGFloat = 2
    var lineColor: UIColor = .black
    
    override func draw(_ rect: CGRect) {
        // hex
        let numberOfSides: CGFloat = 6
        let radiusOuterCircle: CGFloat = min(rect.width, rect.height) / 2
        let theta = (CGFloat.pi * 2) / numberOfSides
        let centerX = rect.midX
        let centerY = rect.midY

        let initialPoint = CGPoint(
            x: radiusOuterCircle * cos((2 * .pi * (0 / numberOfSides)) + theta) + centerX,
            y: radiusOuterCircle * sin((2 * .pi * (0 / numberOfSides)) + theta) + centerY)

        let shapePath = UIBezierPath()
        shapePath.move(to: initialPoint)
        for i in 1...Int(numberOfSides) {
            shapePath.addLine( to: CGPoint(
                x: radiusOuterCircle * cos((2 * .pi * (CGFloat(i) / numberOfSides)) + theta) + centerX,
                y: radiusOuterCircle * sin((2 * .pi * (CGFloat(i) / numberOfSides)) + theta) + centerY))
        }
        
        shapePath.close()
        lineColor.setStroke()
        shapePath.lineWidth = lineWidth
        shapePath.stroke()
        
        // outer circle
        let outCircle = UIBezierPath(
            arcCenter: CGPoint(x: rect.midX, y: rect.midY),
            radius: radiusOuterCircle / 1.5,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: true)
        lineColor.setStroke()
        outCircle.lineWidth = lineWidth
        outCircle.stroke()

        // inner circle
        let inCircle = UIBezierPath(
            arcCenter: CGPoint(x: rect.midX, y: rect.midY),
            radius: radiusOuterCircle / 2.25,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: true)
        lineColor.setStroke()
        lineColor.setFill()
        inCircle.lineWidth = lineWidth
        inCircle.stroke()
        inCircle.fill()
        
        super.draw(rect)
    }
}

class PatchPointView<T: PatchPoint>: UIView {
    let patchPoint: T!
    let layoutStack = UIStackView()
    let label = UILabel()
    let patchView = PatchView()
        
    init(patchPoint: T) {
        self.patchPoint = patchPoint
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        self.patchPoint = .none
        super.init(coder: coder)
    }
    
    func commonInit() {
        addSubview(layoutStack)
        layoutStack.translatesAutoresizingMaskIntoConstraints = false
        layoutStack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        layoutStack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        layoutStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        layoutStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        layoutStack.axis = .vertical
        layoutStack.spacing = 0
        layoutStack.alignment = .fill
        layoutStack.distribution = .fill
        layoutStack.addArrangedSubview(label)
        layoutStack.addArrangedSubview(patchView)
        
        label.textAlignment = .center
        label.text = patchPoint.name
        label.backgroundColor = patchPoint.type == .output ? .black : .clear
        label.textColor = patchPoint.type == .output ? .white : .black
        label.font = UIFont(name: "Futura-CondensedMedium", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        patchView.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        patchView.setNeedsDisplay()
    }

    func highlight() {
        patchView.backgroundColor = .red
    }
    
    func unhighlight() {
        patchView.backgroundColor = .clear
    }
}

protocol PatchableView where Self: UIView {
    associatedtype PatchBayType: PatchBay
    var patchBay: PatchBayType { get set }
    var patchPoints: [PatchPointView<PatchBayType.PatchPoints>] { get set }
}

extension PatchableView {
    func highlight(patchPoint: AnyPatchable) {
        if let point = patchPoint.hash.base as? PatchBayType.PatchPoints,
           let pointView = patchPoints.first(where: { $0.patchPoint == point }) {
            pointView.highlight()
        }
    }
    
    func unhighlight() {
        patchPoints.forEach({ $0.unhighlight() })
    }
}

class PatchBayView<T: PatchBay>: UIView, PatchableView {
    typealias PatchBayType = T
    var patchBay: T
    var patchPoints: [PatchPointView<T.PatchPoints>] = []
    let layoutStack = UIStackView()

    init(patchBay: T) {
        self.patchBay = patchBay
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        self.patchBay = .init()
        super.init(coder: coder)
    }
    
    func commonInit() {
        addSubview(layoutStack)
        layoutStack.translatesAutoresizingMaskIntoConstraints = false
        layoutStack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        layoutStack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        layoutStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        layoutStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        layoutStack.axis = .vertical
        layoutStack.spacing = 8
        layoutStack.alignment = .fill
        layoutStack.distribution = .fill

        let text = NSMutableAttributedString(
            string: "\(patchBay.name) - IN / ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        text.append(NSAttributedString(
            string: " OUT ",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.backgroundColor: UIColor.black
            ]))
        let label = UILabel()
        label.attributedText = text
        label.font = UIFont(name: "Futura-CondensedMedium", size: 17)
        label.baselineAdjustment = .alignBaselines
        label.textAlignment = .center
        layoutStack.addArrangedSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let patchBayStack = UIStackView()
        patchBayStack.axis = .vertical
        patchBayStack.spacing = 0
        patchBayStack.alignment = .fill
        patchBayStack.distribution = .fillEqually
        layoutStack.addArrangedSubview(patchBayStack)

        for x in 0..<patchBay.rowCount {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.spacing = 8
            rowStack.alignment = .fill
            rowStack.distribution = .fillEqually
            patchBayStack.addArrangedSubview(rowStack)
            
            for y in 0..<patchBay.colCount {
                guard let patchPoint = T.PatchPoints(rawValue: (x * patchBay.colCount) + y as! T.PatchPoints.RawValue) else { continue }
                let patchPointView = PatchPointView<T.PatchPoints>(patchPoint: patchPoint)
                rowStack.addArrangedSubview(patchPointView)
                patchPoints.append(patchPointView)
            }
        }
    }
}
