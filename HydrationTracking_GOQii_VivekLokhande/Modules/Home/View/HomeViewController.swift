//
//  ViewController.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 17/07/24.
//

import UIKit

class HomeViewController: UIViewController {
// MARK: - IBOutlets
    @IBOutlet weak var lblCompleteTargetDrink: UILabel!
    @IBOutlet weak var lblTargetDrink: UILabel!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var waterTracker: WaterAnimationTracker!
    private let viewModel = HomeViewModel()
    
// MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let cupCapacity = viewModel.getSelectedCupCapacity()
        drinkButton.setTitle("Drink \(cupCapacity) ml", for: .normal)
    }
    
    
// MARK: - Methods
    private func uiConfiguration() {
        let todayTarget = viewModel.getTodayTarget()
        if todayTarget != nil {
            //if target is set
            setTitlesAndGraph()
        } else {
            //if target is not set show Alert message
            showAlertForDailyTarget()
        }
    }
    
    private func showAlertForDailyTarget() {
        let alertController = UIAlertController(title: "Set today target", message: "Please enter the amount of water you drank today (in ml)", preferredStyle: .alert)
        // Add a text field to the alert
        alertController.addTextField { textField in
            textField.placeholder = "Enter today target"
            textField.keyboardType = .numberPad
        }
        // Add the OK action
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Handle the OK action
            if let textField = alertController.textFields?.first, let text = textField.text, let target = Int(text) {
                self.viewModel.setTodayTarget(target: target)
                self.setTitlesAndGraph()
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func setTitlesAndGraph() {
        let target = viewModel.getTodayTarget() ?? 0
        let complete = viewModel.getCompleteDrinkAmount()
        
        lblTargetDrink.text = "/\(target) ml"
        lblCompleteTargetDrink.text = "\(complete)"
        
        let progress = CGFloat(complete) / CGFloat(target)
        waterTracker.setProgress(to: progress, withAnimation: true)
        
        //if target is complete show Alert message
        if complete >= target {
            showAlertMessage(title: "Congratulations", message: "Your target is complete")
        }
    }
    
    
// MARK: - IBAction
    @IBAction func didDrinkButtonClick(_ sender: UIButton) {
        let selected = viewModel.getSelectedCupCapacity()
        let complete = viewModel.getCompleteDrinkAmount()
        viewModel.setCompleteTarget(intake: complete + selected)
        setTitlesAndGraph()
        viewModel.createDrinkHistory(drink: selected)
    }

    @IBAction func didChangeCapacity(_ sender: UIButton) {
        let cupListViewController = AppStoryboard.main.viewController(CupListViewController.self)
        cupListViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(cupListViewController, animated: true)
    }
}

