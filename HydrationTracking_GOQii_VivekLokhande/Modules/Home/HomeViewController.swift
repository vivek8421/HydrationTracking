//
//  ViewController.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 17/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var waterTracker: WaterAnimationTracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Example of setting progress to 75%
       // waterTracker.setProgress(to: 0.75, withAnimation: true)
    }


}

