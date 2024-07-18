//
//  HistoryViewModel.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import Foundation

final class HistoryViewModel {
    private let coreDataManager = CoreDataManager()
    var noDataView: () -> Void = {}
    var dataPresentView: () -> Void = {}
    var history: [HistoryModel] = []
    
    func fetchHistory() {
        self.history = []
        
        let allHistory = coreDataManager.fetchHistory()
        for i in allHistory {
            history.append(.init(time: i.time ?? "", drink: i.drink ?? ""))
        }
        
        if history.count == 0{
            noDataView()
        }else{
            dataPresentView()
        }
    }
}
