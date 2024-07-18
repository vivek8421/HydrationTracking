//
//  CoreDataHelper.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 17/07/24.
//


import Foundation
import CoreData

final class CoreDataHelper{
    static var shared = CoreDataHelper()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HydrationTracking_GOQii_VivekLokhande")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
