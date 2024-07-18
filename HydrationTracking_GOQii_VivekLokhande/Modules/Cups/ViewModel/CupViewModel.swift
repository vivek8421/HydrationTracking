//
//  CupViewModel.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import Foundation

final class CupViewModel {
    let cups: [CupModel] = [
        .init(imageName: .smallGlass200ML, cupTitle: "Small glass", cupCapicity: "200 ml"),
        .init(imageName: .mediumGlass240ML, cupTitle: "Medium glass", cupCapicity: "240 ml"),
        .init(imageName: .largeGlass350ML, cupTitle: "Large glass", cupCapicity: "350 ml"),
        .init(imageName: .bottle500ML, cupTitle: "Bottle", cupCapicity: "500 ml"),
        .init(imageName: .paperCup175ML, cupTitle: "Paper cup", cupCapicity: "175 ml")
    ]
}
