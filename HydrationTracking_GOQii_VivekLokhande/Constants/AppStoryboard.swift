//
//  Constants.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//


import UIKit

enum AppStoryboard: String {
    case launch  = "LaunchScreen"
    case main = "Main"
    
    private var instance: UIStoryboard{
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    func viewController<T: UIViewController>(_ viewControllerClass: T.Type) -> T {
        let storyboardId = String(describing: viewControllerClass)
        guard let viewController = instance.instantiateViewController(withIdentifier: storyboardId) as? T else{
            fatalError()
        }
       return viewController
    }
}
