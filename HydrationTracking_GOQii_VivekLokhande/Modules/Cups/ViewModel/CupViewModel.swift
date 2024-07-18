//
//  CupViewModel.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import Foundation

final class CupViewModel {
    private let customUserDefaults = CustomUserDefaults.shared
    
    let cups: [CupModel] = [
        .init(imageName: .smallGlass200ML, cupTitle: "Small glass", cupCapicity: 200),
        .init(imageName: .mediumGlass240ML, cupTitle: "Medium glass", cupCapicity: 240),
        .init(imageName: .largeGlass350ML, cupTitle: "Large glass", cupCapicity: 350),
        .init(imageName: .bottle500ML, cupTitle: "Bottle", cupCapicity: 500),
        .init(imageName: .paperCup175ML, cupTitle: "Paper cup", cupCapicity: 175)
    ]
    
    func getSelectedIndexPath() -> IndexPath{
        let selectedIndex = customUserDefaults.get(key: .selectedCupIndex) as? Int
        return IndexPath(row: selectedIndex ?? 0, section: 0)
    }
    
    func setSelectedCup(index: Int) {
        customUserDefaults.set(index, key: .selectedCupIndex)
    }
}
