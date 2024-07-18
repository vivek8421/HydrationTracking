//
//  HistoryTableViewCell.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDrink: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    
    var history: HistoryModel? {
        didSet {
            guard let history else { return }
            lblDrink.text = history.drink + " ml"
            lblTime.text = history.time
        }
    }
}
