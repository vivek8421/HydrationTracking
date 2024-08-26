//
//  Constants.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import Foundation

enum CupImages: String {
    case smallGlass200ML = "200mlGlass"
    case mediumGlass240ML = "240mlGlass"
    case largeGlass350ML = "350mlGlass"
    case bottle500ML = "500mlBottle"
    case paperCup175ML = "170mlPaperCup"
}

enum ColorName: String {
    case waterColor = "WaterColor"
}

enum AlertTitle: String {
    case congratulations = "Congratulations"
    case setTarget = "Set today target"
}

enum AlertMessages: String {
    case congratulations = "Your target is complete"
    case setTarget = "Please enter the amount of water you drank today (in ml)"
}
