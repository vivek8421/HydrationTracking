//
//  CircleView.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import UIKit

class CircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Create the shape layer
        let shapeLayer = CAShapeLayer()
        let insetRect = bounds.insetBy(dx: 10, dy: 10) // Adjust the insets as needed
        shapeLayer.path = UIBezierPath(ovalIn: insetRect).cgPath
        
        // Configure the shape layer
        shapeLayer.fillColor = UIColor.white.cgColor
        
        // Configure the shadow
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: 5)
        shapeLayer.shadowOpacity = 0.7
        shapeLayer.shadowRadius = 10
        
        // Add the shape layer to the view's layer
        layer.addSublayer(shapeLayer)
    }
}
