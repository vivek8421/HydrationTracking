//
//  HomeViewModel.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import Foundation

final class HomeViewModel {
    //dependent on
    private let cupViewModel = CupViewModel()
    private let customUserDefaults = CustomUserDefaults.shared
    private let coreDataManager = CoreDataManager()
    
// MARK: - User Default Methods
    func getSelectedCupCapacity() -> Int {
        let selectedIndex = customUserDefaults.get(key: .selectedCupIndex) as? Int
        let cup = cupViewModel.cups[selectedIndex ?? 0]
        return cup.cupCapicity
    }
    
    func getTodayTarget() -> Int? {
        return customUserDefaults.get(key: .drinkTarget) as? Int
    }
    
    func getCompleteDrinkAmount() -> Int {
        let targetIntake = customUserDefaults.get(key: .drinkComplete) as? Int
        return targetIntake ?? 0
    }
    
    func setTodayTarget(target: Int) {
        customUserDefaults.set(target, key: .drinkTarget)
    }
    
    func setCompleteTarget(intake: Int) {
        customUserDefaults.set(intake, key: .drinkComplete)
    }
    
    func createDrinkHistory(drink: Int) {
        let time = getCurrentTimeString()
        let history = HistoryModel(time: time, drink: "\(drink)")
        coreDataManager.saveHistory(history)
    }
    
    
    func getCurrentTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mma"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let currentTime = Date()
        return dateFormatter.string(from: currentTime)
    }
}
