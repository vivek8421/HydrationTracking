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

    func showAlertMessage(title: String = "", message: String = "",handler: (()->Void)? = nil){
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel){_ in
            if let handler{ handler() }
        }
        alertMessage.addAction(ok)
        self.present(alertMessage, animated: true)
    }
}
