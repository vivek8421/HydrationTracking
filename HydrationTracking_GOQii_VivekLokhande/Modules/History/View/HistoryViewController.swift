//
//  HistoryViewController.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import UIKit

class HistoryViewController: UIViewController {
// MARK: - IBOutlets
    @IBOutlet weak var historyTableView: UITableView!
    private let viewModel = HistoryViewModel()

// MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchHistory()
        historyTableView.reloadData()
    }
    
// MARK: - Methods
    private func uiConfiguration() {
        historyTableView.register(HistoryTableViewCell.nib, forCellReuseIdentifier: HistoryTableViewCell.id)
        viewModel.noDataView = {
            self.addNoDataView(tableView: self.historyTableView, message: "History not found")
        }
        viewModel.dataPresentView = {
            self.historyTableView.backgroundView = nil
        }
    }
}

// MARK: - UITableViewDataSource Methods
extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = historyTableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.id, for: indexPath) as? HistoryTableViewCell else {
            fatalError()
        }
        cell.history = viewModel.history[indexPath.row]
        return cell
    }
}
