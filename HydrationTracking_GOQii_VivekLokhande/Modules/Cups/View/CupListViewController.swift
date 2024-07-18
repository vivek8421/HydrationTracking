//
//  CupListViewController.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import UIKit

class CupListViewController: UIViewController {
// MARK: - IBoutlets
    @IBOutlet weak var cupCollectionView: UICollectionView!
    private let viewModel = CupViewModel()

// MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        uiConfiguration()
    }

// MARK: - UIConfigurations
    private func uiConfiguration() {
        cupCollectionView.register(CupCollectionViewCell.nib, forCellWithReuseIdentifier: CupCollectionViewCell.id)
        
        let selectedIndexPath = viewModel.getSelectedIndexPath()
        cupCollectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .top)
    }
    
// MARK: - IBActions
    @IBAction func didSaveButtonClick() {
        if let selectedCells = cupCollectionView.indexPathsForSelectedItems, let index = selectedCells.first?.row {
                  self.viewModel.setSelectedCup(index: index)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource Methods
extension CupListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CupCollectionViewCell
            .id, for: indexPath) as? CupCollectionViewCell else {
            fatalError()
        }
        cell.cupData = viewModel.cups[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods 
extension CupListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width/2 - 40
        let height = width + 44
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
