//
//  HomeViewModel.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import Foundation

final class HomeViewModel {
    private let cupViewModel = CupViewModel()
    
    func getSelectedCupCapacity() -> Int {
        let selectedIndex = CustomUserDefaults.shared.get(key: .selectedCupIndex) as? Int
        let cup = cupViewModel.cups[selectedIndex ?? 0]
        return cup.cupCapicity
    }
}
