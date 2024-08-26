//
//  CoreDataManager.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//


import UIKit
import CoreData

final class CoreDataManager {
    
    private let coreDataHelper = CoreDataHelper.shared
    private var context: NSManagedObjectContext {
        return coreDataHelper.persistentContainer.viewContext
    }
    
// MARK: - Save History Data
    func saveHistory(_ history: HistoryModel) {
        let historyEntity = HistoryEntity(context: context)
        historyEntity.drink = history.drink
        historyEntity.time = history.time
        //save data
        self.saveContext()
    }
    
// MARK: - Fetch History data
    func fetchHistory() -> [HistoryEntity] {
        var history: [HistoryEntity] = []
        do{
            history = try context.fetch(HistoryEntity.fetchRequest())
        }
        catch let error{
            print(error)
        }
        return history
    }
    
// MARK: - Other common functions
    private func saveContext() {
        do{
            try context.save()
        }
        catch let error{
            print(error)
        }
    }
}
