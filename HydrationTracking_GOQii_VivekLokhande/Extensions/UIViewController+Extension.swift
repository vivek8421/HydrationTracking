//
//  UIViewController+Extension.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import UIKit

extension UIViewController {
    
    func addNoDataView(tableView: UITableView, message: String){
        let label = UILabel()
        label.text = message
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.center = tableView.center
        tableView.backgroundView = label
    }

}
