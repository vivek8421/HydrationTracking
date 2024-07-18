//
//  ViewController.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 17/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var waterTracker: WaterAnimationTracker!
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Example of setting progress to 75%
        waterTracker.setProgress(to: 0.75, withAnimation: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let cupCapacity = viewModel.getSelectedCupCapacity()
        drinkButton.setTitle("Drink \(cupCapacity) ml", for: .normal)
        drinkButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    }
    
    
    @IBAction func didDrinkButtonClick(_ sender: UIButton) {
        
    }

    @IBAction func didChangeCapacity(_ sender: UIButton) {
        let cupListViewController = AppStoryboard.main.viewController(CupListViewController.self)
        cupListViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(cupListViewController, animated: true)
    }
}

