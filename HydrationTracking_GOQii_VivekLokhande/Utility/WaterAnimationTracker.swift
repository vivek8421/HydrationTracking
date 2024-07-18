//
//  a.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//


import UIKit
import UIKit

class WaterAnimationTracker: UIView {
    
    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        let padding: CGFloat = 12
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - padding
        let startAngle = CGFloat.pi
        let endAngle: CGFloat = 0
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 6
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 6
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        
        layer.addSublayer(trackLayer)
        layer.addSublayer(shapeLayer)
    }
    
    func setProgress(to progress: CGFloat, withAnimation: Bool) {
        var progress = progress
        if progress > 1 {
            progress = 1
        } else if progress < 0 {
            progress = 0
        }
        
        if withAnimation {
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            basicAnimation.toValue = progress
            basicAnimation.duration = 2
            basicAnimation.fillMode = .forwards
            basicAnimation.isRemovedOnCompletion = false
            shapeLayer.add(basicAnimation, forKey: "basicAnimation")
        } else {
            shapeLayer.strokeEnd = progress
        }
    }
}
